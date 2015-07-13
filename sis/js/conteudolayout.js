var ConteudoLayout, bloqueio, seguir;

$(function(){

    ConteudoLayout = (function(){
        var $elementsWithTooltip = $("[rel='tooltip']"),
            $dropDownButton = $('.dropdown-toggle'),
            $edcMidiaMenu = $('#edcmidiamenu'),
            $menuOptions = $('.w-aulas a'),
            $forwardButton = $('#forwardButton'),
            $backwardButton = $('#backwardButton'),
            $iframeContainer = $('#content'),
            $currentOrder = $('#currentOrder'),
            edcMidiaActive = function(){return $('.w-aulas a.active');},
            $firstEdcMidia = $('.w-aulas a').first(),
            $lastEdcMidia = $('.w-aulas a').last(),
            $lastOpenEdcMidia = $('.w-aulas a').not('.disabled').last(),
            $alunoTurmaId = $('#alunoTurmaId'),
            $alunoTurmaEdcId = $('#alunoTurmaEdcId'),
            $btnAtendimento = $('#btnAtendimento'),
            $commentsModalButton = $('#commentsModalButton'),
            $commentsCount = $('.commentsCount'),
            $logoutButton = $('#logoutButton'),
            $btnFavorito = $('#btnFavorito'),
            $turmaChatLink = $('#turmachatlink'),
            $turmaForumLink = $('#turmaforumlink'),
            $btnListFavorits = $('#btnTodosFavoritos'),
            edcId,
            alunoTurmaId,
            urlTurmaChat,
            SETINTERVAL_ID,
            SETINTERVAL_COUNTDOWN_ID,
            SETTIMEOUT_ID,
            INITIAL_TIME = {},
            AJAX_LONG_POLLING;



        var applyTooltipInElements = function(){
                $elementsWithTooltip.tooltip({placement: 'bottom'});
            },
            applyjScrollPageInMegaMenuContent = function(){
                setTimeout(function(){
                    $('.yamm-content').jScrollPane();
                }, 1);
            },
            setMenuOptionAsActive = function($element){
                $menuOptions.removeClass('active');
                $element.addClass('active');
            },
            reloadIframe = function(tipomidia, data){
                var text = 1,
                    swf = 7;

                if(tipomidia === text)
                {
                    $iframeContainer.removeAttr('src');
                    $iframeContainer.on('load', function(){
                        $(this).contents().find('body').html(data.Conteudo);
                    });
                }else if(tipomidia === swf)
                {
                    $iframeContainer.removeAttr('src');
                    $iframeContainer.on('load', function(){
                        $(this).contents().find('body').html('<style>*{margin: 0; padding: 0;}</style>' +
                        '<object width="100%" height="100%">' +
                        '<param name="wmode" value="transparent" />' +
                        '<param name="allowscriptaccess" value="sameDomain"/>' +
                        '<embed wmode="transparent" src="' + data.Url + '" type="application/x-shockwave-flash" allowscriptaccess="sameDomain" allowfullscreen="true" width="100%" height="100%"></embed>' +
                        '</object>');
                    });
                }else
                {
                    $iframeContainer.attr('src', data.Url + '&url_api=http://'+window.location.hostname + '&wmode=opaque');
                }
            },
            showOrderTextOfCurrentEdcMidia = function(order){
                $currentOrder.text(order);
            },
            startCountdown = function(seconds){
                if(seconds > 0)
                {
                    SETINTERVAL_COUNTDOWN_ID = setInterval(function() {
                        $forwardButton.attr('disabled', true).addClass('disabled').removeClass('fa').css({color: '#EEE'}).text(seconds);
                        if(seconds <= 0) {
                            $forwardButton.text("");
                            clearCountdown();
                            defaultStateForwardButton();
                            releaseNextEdcmidia();
                        }
                        seconds -= 1;
                    }, 1000);
                }
                /*else
                {
                    clearCountdown();
                    defaultStateForwardButton();
                    releaseNextEdcmidia();
                }*/
            },
            setEdcMidiaAsFinished = function(edcMidiaId){
                return $.ajax({
                    type: 'post',
                    url: '/plataforma/setEdcmidiaAsFinished',
                    data: {edcMidiaId: edcMidiaId, alunoTurmaEdcId: $alunoTurmaEdcId.val()}
                });
            },
            endEdcMidia = function(edcMidiaId, callback)
            {
                $.ajax({
                    type: 'post',
                    url: '/plataforma/endedcmidia',
                    data: {edcmidiaid: edcMidiaId}
                }).done(callback);
            },
            releaseNextEdcmidia = function(callback){

                endEdcMidia(INITIAL_TIME.id, function(){

                    var $currentOpenEdcmidia = $('a[data-id="'+INITIAL_TIME.id+'"]');
                    var $nextEdcmidia = $currentOpenEdcmidia.next();

                    if($nextEdcmidia.length)
                    {
                        var edcMidiaId = $nextEdcmidia.data('id');

                        $.ajax({
                            type: 'post',
                            url: '/plataforma/getEdcmidiaUrl',
                            data: {edcMidiaId: edcMidiaId}
                        }).done(function(url){
                            $nextEdcmidia.removeClass('disabled').attr('href', url);
                            if(callback)
                            {
                                callback($nextEdcmidia);
                            }
                        });
                    }
                });

            },
            clearCountdown = function(){
                clearInterval(SETINTERVAL_COUNTDOWN_ID);
                $forwardButton.addClass('fa').css({color: '#13a4e2'}).text("");
            },
            defaultStateForwardButton = function(){
                $forwardButton.attr('disabled', false);
            },
            openEdcMidia = function($element, changeurl){
                

                if($element.length)
                {
                    if(isEdcMidiaDisabled($element))
                    {
                        return false;
                    }
                    $(".progresso").hide();
                    $(".progresso-wait").show();
                    if(changeurl !== false)
                    {
                        changeUrlWithEdcMidia($element.data('id'));
                    }

                    setMenuOptionAsActive($element);
                    showOrderTextOfCurrentEdcMidia($element.text());
                    clearCountdown();
                    defaultStateForwardButton();

                    var saveEdcMidia = function(){
                        clearTimeout(SETTIMEOUT_ID);
                        SETTIMEOUT_ID = setTimeout(function(){
                            saveAlunoTurmaEdcMidia($element.data('id'), function(data){
                                reloadIframe($element.data('tipomidia'), data);
                                setBtnFavorito();
                                
                                if(data.Concluido)
                                {
                                    clearCountdown();
                                    defaultStateForwardButton();
                                    releaseNextEdcmidia();
                                }
                                else if(data.RequerInteracao === 'F')
                                {
                                    startCountdown(data.TempoMinimo);
                                }
                                recordTimeSpentInEdcMidia($element.data('id'));
                                incrementTotalViews($element.data('id'));
                                //checkIfEdcMidiaNextButtonPressed($element.data('id'));

                                loadCommentsForEdcmidia();
                                showCommentsButton();
                            });
                        }, 1000);    
                    };

                    var updateConclusionDate = recordTempoTotalInCasePageChange();

                    if(updateConclusionDate !== false)
                    {
                        updateConclusionDate.done(saveEdcMidia);
                    }else
                    {
                        saveEdcMidia();
                    }
                }else
                {
                    //Trecho que verifica se a midia acessada é a ultima da lição.
                    if(checkIfIsTheLastEdcmidia())
                    {
                        setEdcMidiaAsFinished(edcMidiaActive().data('id'))
                        .done(function(){
                            recordConclusionDateForEdc(edcMidiaActive().data('id'), $alunoTurmaId.val());
                        });
                    }
                }
            },
            checkIfIsTheLastEdcmidia = function(){
                var $edcMidiaActive = edcMidiaActive();
                return  ($edcMidiaActive.length) && ($edcMidiaActive.data('ultimamidia') === 1);
            },
            recordConclusionDateForEdc = function(edcMidiaId, alunoTurmaId){
                $.ajax({
                    url: '/plataforma/recordConclusionDateForEdc',
                    data: {edcMidiaId: edcMidiaId, alunoTurmaId: alunoTurmaId},
                    type: 'post'
                }).done(function(){
                    
                    var modalFacebook = $('#publishFacebook');

                    if(!modalFacebook.length){
                        window.location = '/plataforma/treeedcs/alunoturma/' + alunoTurmaId;
                    }
                    
                    modalFacebook.modal('show');
                    
                    modalFacebook.on('hide.bs.modal', function()
                    {
                        window.location = '/plataforma/treeedcs/alunoturma/' + alunoTurmaId;
                    });
                });
            },
            isEdcMidiaDisabled = function($element){
                return $element.hasClass('disabled');
            },
            changeUrlWithEdcMidia = function(edcMidiaId){
                if(edcId && edcMidiaId)
                {
                    var newUrl = '/plataforma/conteudo/alunoturma/' + $alunoTurmaId.val() + '/edcid/' + edcId + '/edcMidiaId/' + edcMidiaId;
                    history.pushState({edcMidiaId: edcMidiaId}, '', newUrl);
                }
            },
            trackTimeOfTempoTotalEvery30Seconds = function(edcMidiaId){
                clearInterval(SETINTERVAL_ID);
                SETINTERVAL_ID = setInterval(function(){
                    $.ajax({
                        type: 'post',
                        url: '/plataforma/trackTimeOfTempoTotal',
                        data: {edcMidiaId: edcMidiaId, alunoTurmaEdcId: $alunoTurmaEdcId.val()}
                    }).done(function(){
                        INITIAL_TIME.id = edcMidiaId;
                    });
                }, 30 * 1000);
            },
            recordTempoTotalInCasePageChange = function(){
                if($.map(INITIAL_TIME, function(n, i) { return i; }).length)
                {
                    var id = INITIAL_TIME.id;

                    return $.ajax({
                        type: 'post',
                        url: '/plataforma/trackTimeOfTempoTotalWhenPageChanges',
                        data: {edcMidiaId: id, alunoTurmaEdcId: $alunoTurmaEdcId.val()}
                    });
                }

                return false;
            },
            saveAlunoTurmaEdcMidia = function(edcMidiaId, callback){
                $.ajax({
                    type: 'post',
                    url: '/plataforma/saveAlunoTurmaEdcMidia',
                    data: {edcMidiaId: edcMidiaId, alunoTurmaEdcId: $alunoTurmaEdcId.val()},
                    dataType: 'json'
                }).done(function(data){
                    callback(data);
                });
            },
            incrementTotalViews = function(edcMidiaId){
                $.ajax({
                    type: 'post',
                    url: '/plataforma/incrementTotalViews',
                    data: {edcMidiaId: edcMidiaId, alunoTurmaEdcId: $alunoTurmaEdcId.val()}
                });
            },
            recordTimeSpentInEdcMidia = function(edcMidiaId){
                recordTempoTotalInCasePageChange();
                trackTimeOfTempoTotalEvery30Seconds(edcMidiaId);
                INITIAL_TIME.id = edcMidiaId;
            },
            fixContentHeight = function(){
                var navbarHeight = $('.navbar').outerHeight(true);

                $('#mainContent').css({
                    paddingTop: navbarHeight,
                    paddingBottom: 0
                });

                var height =  $(window).height() - navbarHeight - 5;

                $('#mainContent, #content, #sb-site').css({height: height+'px'});
            },
            goToNextEdcMidia = function ()
            {
                $forwardButton.click();
            },
            abortLongPollingAjaxRequest = function(){
                if(AJAX_LONG_POLLING)
                {
                    AJAX_LONG_POLLING.abort();
                }
            },
            openAtendimentoPopup = function(){
                window.open('http://www8.directtalk.com.br/Chat31/?idd=F48400706F923013507D', 'atendimento', 'width=350,height=500');
            },
            loadCommentsForEdcmidia = function(){
                var url = $iframeContainer.attr('src') === undefined ? createUrlWhenIframeIsWithoutUrl() : $iframeContainer.attr('src');

                if(typeof url !== 'undefined' && url !== false)
                {
                    url = url.split('?')[0]; // get the url before the query string beginning
                    $('.fb-comments').attr('data-href', url);
                    $commentsCount.attr('data-href', url);
                    getCommentsTotal();
                }
            },
            createUrlWhenIframeIsWithoutUrl = function(){
                // removes alunoturmaid parameter
                var url = document.URL.replace(/alunoturmaid\/[0-9]+\//, '');

                if(url.indexOf('edcMidiaId') === -1)
                {
                    url += '/edcMidiaId/' + edcMidiaActive().data('id');
                }

                return url;
            },
            showCommentsButton = function(){
                var $commentsModalButton = $('#commentsModalButton');
                $commentsModalButton.closest('.btn-group').show();

                getCommentsTotal();
            },
            getCommentsTotal = function(){
                var fql  = "SELECT comment_count FROM link_stat WHERE url = '" + $commentsCount.attr('data-href') + "'";

                $.ajax({
                    url: 'https://api.facebook.com/method/fql.query?format=json&query='+encodeURIComponent(fql),
                    dataType: 'jsonp'
                }).done(function(data){
                    if(data.length)
                    {
                        $commentsCount.text(data[0].comment_count);
                    }
                });
            },
            redirectToplataformaPage = function($element){
                window.location = $element.data('href');
            },
            openTurmaChatModal = function(){
                if(urlTurmaChat == undefined)
                {
                    $.ajax({
                        type: 'post',
                        url: '/plataforma/getGuidAndTurmaId',
                        data: {alunoTurmaId: alunoTurmaId},
                        dataType: 'json'
                    }).done(function(data){
                        urlTurmaChat = 'http://'+window.location.hostname+':5001/';
                        urlTurmaChat += '?guid=' + data.guid;
                        urlTurmaChat += '&idturma=' + data.idturma;
                        urlTurmaChat += '&idDisciplina=' + data.idDisciplina;

                        $('#turmaChatIframe').attr('src', urlTurmaChat);
                        $('#turmaChat').css({width: '100%'}).modal("show");
                    });
                }else
                {
                    $('#turmaChat').css({width: '100%'}).modal("show");
                }
            },
            // muda o icone de estrela do botão para mostrar se a midia é favorita ou não
            setBtnFavorito = function(){
                var edcMidiaId = edcMidiaActive().data('id');

                $.ajax({
                    type: 'post',
                    url: '/plataforma/getAlunoTurmaEdcMidiaFavorito',
                    data: {edcMidiaId: edcMidiaId, alunoTurmaEdcId: $alunoTurmaEdcId.val()},
                    dataType: 'html'
                }).done(function(favorito){
                    var changeFavoriteButtonIcon = function(iconName, flag){
                        $("#btnFavorito").html('<i class="' + iconName + '"></i>').data('favorito', flag);
                    };

                    if(favorito === 'T')
                    {
                        changeFavoriteButtonIcon('fa fa-star fa-lg', 'T');
                    }else
                    {
                        changeFavoriteButtonIcon('fa fa-star-o fa-lg', 'F');
                    }
                });
            },
            loadListFavoritos = function(){
                $.ajax({
                    type: 'post',
                    url: '/plataforma/ListAllFavorits',
                    data: {alunoTurmaId: $alunoTurmaId.val()},
                    dataType: 'html'
                }).done(function(data){
                    var values = JSON.parse(data);
                    if(values.allFavorits)
                    {
                        for(var i=0;i<values.allFavorits.length;i++)
                        {
                            var id = values.allFavorits[i].IdEdcMidia,
                                edcMidia = $("[data-id='"+id+"'"),
                                edcTitulo = edcMidia.attr("title"),
                                edcMidiaLink = edcMidia.attr("href"),
                                link = $("<a>").attr("href",edcMidiaLink).text(edcTitulo),
                                listRow = $("<li>").css("text-align","center").append(link);
                            $("#favoritList").append(listRow)
                        }
                    }
                });
            },
            resizeFacebookComments = function()
            {
                var $comments = $('.fb-comments'),
                    $commentsIframe = $('iframe', $comments),
                    src = $commentsIframe.attr('src').split('width='),
                    width = $comments.parent().width();

                $commentsIframe.attr('src', src[0] + 'width=' + width);
                $commentsIframe.css({width: width});
                $('span', $comments).css({width: width});
            },
            fbCommentsWorkaround = function()
            {
                $(window).on('resize', function(){
                    resizeFacebookComments();
                });

                $('.fb-comments iframe').on('load', function(){
                    resizeFacebookComments();
                    $('.fb-comments iframe').unbind('load');
                });

                FB.Event.subscribe('xfbml.render', resizeFacebookComments);
            };

        var onClickDropDownButton = function(){
                applyjScrollPageInMegaMenuContent();
            },
            onClickMenuOptions = function(e){
                e.preventDefault();
                var $self = $(this);
                openEdcMidia($self);
            },
            onClickBackwardButton = function(e){
                e.preventDefault();
                
                var $prevEdcMidia = $('a.active').prev();
                openEdcMidia($prevEdcMidia);
            },
            onClickForwardButton = function(e){
                e.preventDefault();
                var $nextEdcMidia = $('a.active').next();
                openEdcMidia($nextEdcMidia);
            },
            onPopStateWindow = function(e){
                openEdcMidia($("ul.yamm-content a[data-id='" + e.originalEvent.state.edcMidiaId + "']", $edcMidiaMenu), false);
            },
            onBeforeUnloadWindow = function(){
                abortLongPollingAjaxRequest();
            },
            onClickBtnAtendimento = function(){
                openAtendimentoPopup();
            },
            onClickCommentsModalButton = function(){
                // workaround to fix bug
                setTimeout(function(){
                    resizeFacebookComments();
                    FB.XFBML.parse();
                }, 1000);
            },
            onClickLogoutButton = function(){
                redirectToplataformaPage($(this));
            },
            onClickbtnFavorito = function(){
                var $self = $(this),
                edcMidiaId = edcMidiaActive().data('id');

                if($self.data('favorito') === 'F')
                {
                    $self.html('<i class="fa fa-star fa-lg"></i>').data('favorito','T');
                }else
                {
                    $self.html('<i class="fa fa-star-o fa-lg"></i>').data('favorito','F');
                }

                $.ajax({
                    type: 'post',
                    url: '/plataforma/saveAlunoTurmaEdcMidiaFavorito',
                    data: {edcMidiaId: edcMidiaId, alunoTurmaEdcId: $alunoTurmaEdcId.val(), favorito: $self.data('favorito')},
                    dataType: 'html'
                }).done(function(){
                    loadListFavoritos();
                });
            },
            onClickTurmaChatLink = function(e){
                e.preventDefault();
                openTurmaChatModal();
            },
            onClickTurmaForumLink = function(e)
            {
                e.preventDefault();
                $('#turmaForum').css({width: '100%'}).modal("show");
            },
            onClickbtnListFavorits = function(){
                $("#listFavorits").modal('show');
            };

        return {
            init: function(){
                applyTooltipInElements();
                fixContentHeight();
                if(edcMidiaActive().length)
                {
                    openEdcMidia(edcMidiaActive());
                }
                else if(!$lastOpenEdcMidia.length || $lastEdcMidia.data('ordem')==$lastOpenEdcMidia.data('ordem'))
                {
                    openEdcMidia($firstEdcMidia);
                }
                else
                {
                    openEdcMidia($lastOpenEdcMidia);
                }
                
                edcId = location.pathname.split('/')[6];
                alunoTurmaId = location.pathname.split('/')[4];
                
                $(window).on({
                    popstate: onPopStateWindow,
                    resize: fixContentHeight,
                    beforeunload: onBeforeUnloadWindow
                });
                
                $dropDownButton.on('click', onClickDropDownButton);
                $menuOptions.on('click', onClickMenuOptions);
                $backwardButton.on('click', onClickBackwardButton);
                $forwardButton.on('click', onClickForwardButton);
                $btnAtendimento.on('click', onClickBtnAtendimento);
                $logoutButton.on('click', onClickLogoutButton);
                $btnFavorito.on('click', onClickbtnFavorito);
                $btnListFavorits.on('click',onClickbtnListFavorits);

                $turmaChatLink.on('click', onClickTurmaChatLink);
                $turmaForumLink.on('click', onClickTurmaForumLink);
                
                $('#modalComments').on('hide.bs.modal', function(){
                    getCommentsTotal();
                });

                $.slidebars();

                window.fbAsyncInit = function(){
                    FB.init({
                        appId: '1578463135713236',
                        status: true,
                        xfbml: true
                    });

                    fbCommentsWorkaround();

                    $commentsModalButton.on('click', onClickCommentsModalButton);
                };

                $("#content").load(function(){
                    $(".progresso").show();
                    $(".progresso-wait").hide();

                });
            },
            releaseNextEdcmidia: releaseNextEdcmidia,
            goToNextEdcMidia: goToNextEdcMidia
        };
    })();

    ConteudoLayout.init();

    // Função para aceitar os EDC´s antigos do sistema.
    bloqueio = function(b)
    {
        if (!b)
            ConteudoLayout.releaseNextEdcmidia();
    };

    seguir = function()
    {
        ConteudoLayout.goToNextEdcMidia();
    };
});

