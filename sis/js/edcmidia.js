var Edcmidia;

$(document).ready(function(){
    Edcmidia = (function(){
        // selectors
        var updateGridButton = 'a.editar',
            descritorCheckbox = '#Edcmidia_descritor_ids :checkbox',

            $editor = null,

            $dropDownTipoMidia = $('#Edcmidia_IdTipoMidia'),
            $urlTextField = $('#Edcmidia_Url'),
            $tempoMinimoTextField = $('#Edcmidia_TempoMinimo'),
            $conteudoTextField = $('#Edcmidia_Conteudo'),
            $fileUploadField = $('#file_upload'),
            $requerInteracaoCheckbox = $('#Edcmidia_RequerInteracao'),
            $modalCreate = $("#modalCreate"),

            $modalImport = $("#modalImport"),
            $importButton = $(".edcMidiaImportButton"),
            $createButton = $('.edcMidiaCreateButton'),

            $saveButton = $('.edcMidiaDataSaveButton'),
            $checkbox = $('.booleanCheckbox'),
            $url = $('#url'),
            edcId = $('#Edcmidia_IdEdc').val(),
            $importUrlContentButton = $('#btnImportUrlContent'),
            $setRequerInteracaoButton = $('#setRequerInteracaoButton'),
            $removeRequerInteracaoButton = $('#removeRequerInteracaoButton'),
            uploadObject;

        // business functions
        var openModalForUpdate = function(edcMidiaId){
                getEdcMidiaData(edcMidiaId, function(data){
                    fillOutTheUpdateForm(data);
                    openDialog($modalCreate);
                });
            },
            openModalForCreate = function(){
                removeNicEditorPluginToContentTextField();
                resetFormInputs();
                setNicEditorPluginToContentTextField();
                hideFields();
                openDialog($modalCreate);
            },
            openDialog = function($element){
                $element.modal("show");
            },
            closeDialog = function($element){
                $element.modal("hide");
            },
            fillOutTheUpdateForm = function(data){
                removeNicEditorPluginToContentTextField();
                resetFormInputs();

                var inputPrefix = '#Edcmidia_';

                $.each(data, function(index, value){
                    if(index == 'descritor_ids')
                    {
                        $(descritorCheckbox, $modalCreate).each(function(){
                            if(value.indexOf(+($(this).val())) > -1)
                            {
                                $(this).attr('checked', true);
                            }
                        });
                    }

                    var input = $(inputPrefix+index, $modalCreate);

                    if(input.is('input, select, textarea'))
                    {
                        input.val(value);
                    }

                    if(input.is(':checkbox'))
                    {
                        var checked;

                        if(value == 1 || value == 'T')
                        {
                            checked = true;
                        }

                        if(value == 0 || value == 'F')
                        {
                            checked = false;
                        }

                        input.val(value).attr('checked', checked);
                    }
                });

                switchFieldsUrlAndContent($dropDownTipoMidia);
                setNicEditorPluginToContentTextField();
            },
            resetFormInputs = function(){
                $('#Edcmidia_RequerInteracao', $modalCreate).removeAttr('checked', false);
                $('#Edcmidia_Ativo', $modalCreate).attr('checked', true);
                $('input[type=text], select, textarea, #Edcmidia_Id, #Edcmidia_Ordem', $modalCreate).val('');
                $('input[type="checkbox"]', $modalCreate).attr('checked', false);
            },
            getEdcMidiaData = function(edcMidiaId, callback){
                $.ajax({
                    url: '/edcmidia/getEdcMidiaData',
                    type: 'post',
                    data: {id: edcMidiaId},
                    dataType: 'json'
                }).done(callback);
            },
            saveEdcMidiaData = function(data, callback){
                $.ajax({
                    url: '/edcmidia/saveEdcMidiaData',
                    type: 'post',
                    data: data,
                    dataType: 'json'
                }).done(callback);
            },
            refreshGridView = function(){
                $.fn.yiiGridView.update('edcMidiaGridView');
                $.fn.yiiGridView.update('edcMidiaInativoGridView');
                if($(".w-help-popover").hasClass("in"))
                    $(".w-help-popover").removeClass('in').addClass("out");
            },
            showErrorMessages = function(validationErrors){
                var errorMessage = "<ul>";
                $.each(validationErrors, function(index, value){
                    errorMessage += "<li>" + value + "</li>";
                });
                errorMessage += "</ul>";

                window.WiAlert('warning', errorMessage);
            },
            changeValueToTrueOrFalse = function($checkbox){
                $checkbox.val('F');

                if($checkbox.is(':checked'))
                {
                    $checkbox.val('T');
                }
            },
            makeGridViewSortable = function(options){
                options = options || {};

                var fixHelper = function(e, ui) {
                    ui.children().each(function() {
                        $(this).width($(this).width());
                    });
                    return ui;
                };

                options.helper = fixHelper;

                if($('tbody', '#edcMidiaGridView').length)
                    $('tbody', '#edcMidiaGridView').sortable(options);
            },
            saveNewEdcMidiaOrdem = function(e, ui){
                var data = $('tbody', '#edcMidiaGridView').sortable('serialize', {key: 'items[]', attribute: 'id'});
                $.ajax({
                    type: 'post',
                    url: '/edcmidia/saveNewEdcMidiaOrdem',
                    data: data,
                    dataType: 'json'
                }).done(refreshGridView);
            },
            getFilesFromRemoteDirectory = function(url, callback){
                $.ajax({
                    url: '/edcmidia/getContentFromRemoteDirectory',
                    type: 'post',
                    data: {url: url}
                }).done(function(html){
                    var content = $(html);

                    var files = [];
                    $('a[href*="."]', content).each(function(){
                        var file = $(this).text();

                        if(url.slice(-1) !== '/')
                        {
                            url += '/';
                        }

                        file = url + file;

                        files.push(file);
                    });

                    callback(files);
                });
            },
            saveFilesFromRemoteDirectory = function(files, edcId, doneCallback, failCallback){
                $.ajax({
                    url: '/edcmidia/saveFilesFromRemoteDirectory',
                    data: {files: files, edcId: edcId},
                    type: 'post'
                }).done(doneCallback).fail(failCallback);
            },
            switchFieldsUrlAndContent = function($element){
                var TEXT = 1, EXT_UPLOAD = $('option:selected', $element).data('extupload');

                $urlTextField.closest('.form-group').show();
                $conteudoTextField.closest('.form-group').hide();
                $fileUploadField.closest('.form-group').hide();

                if($element.val() == TEXT)
                {
                    $urlTextField.closest('.form-group').hide();
                    $fileUploadField.closest('.form-group').hide();

                    $conteudoTextField.closest('.form-group').show();
                }

                if(EXT_UPLOAD !== '')
                {
                    uploadFile(EXT_UPLOAD);

                    $urlTextField.closest('.form-group').hide();
                    $conteudoTextField.closest('.form-group').hide();

                    $fileUploadField.closest('.form-group').show();
                }

                if(!$element.val())
                {
                    hideFields();
                }
            },
            toggleRequerInteracaoField = function($element){
                var EDI = 3;
                if($element.val() == EDI)
                {
                    $requerInteracaoCheckbox.closest('.form-group').show();
                }else
                {
                    $requerInteracaoCheckbox.attr('checked', false);
                    $requerInteracaoCheckbox.closest('.form-group').hide();
                }
            },
            hideFields = function(){
                $urlTextField.closest('.form-group').hide();
                $conteudoTextField.closest('.form-group').hide();
                $fileUploadField.closest('.form-group').hide();
                $requerInteracaoCheckbox.closest('.form-group').hide();
            },
            setNicEditorPluginToContentTextField = function(){
                if($('#Edcmidia_Conteudo').length)
                    $editor = new nicEditor({fullPanel: true}).panelInstance('Edcmidia_Conteudo');
            },
            removeNicEditorPluginToContentTextField = function(){
                $editor.removeInstance('Edcmidia_Conteudo');
                $editor = null;
            },
            onlyNumberFilter = function($element){
                $element.val($element.val().replace(/[^0-9]/g, ''));
            },
            uploadFile = function(accepted_ext){
                var timestamp = new Date().getTime();

                if($fileUploadField.length)
                {
                    uploadObject = new AjaxUpload($fileUploadField, {
                        action: '/edcmidia/uploadfile?time=' + timestamp,
                        name: 'file_upload',
                        onSubmit: function(file, ext){
                            $fileUploadField.next('span.help-block').remove();

                            if (!(ext && new RegExp('^('+accepted_ext+')$').test(ext)))
                            {
                                // extension is not allowed
                                $fileUploadField.after('<span class="help-block">Só é aceito arquivo do(s) tipo(s): ' + accepted_ext.split('|').join(', ') + '.</span>');
                                return false;
                            }

                            $fileUploadField.after('<span class="help-block"><em>Carregando...</em></span>');
                        },
                        onComplete: function(file){
                            var fileName = timestamp + '_' + file;
                            var hostname = document.location.hostname;
                            var url = hostname + '/uploads/edcmidia/' + fileName;
                            $urlTextField.val(url);
                            $fileUploadField.next('span.help-block').text('Arquivo enviado com sucesso.');
                        }
                    });
                }


            },
            updateMidiasRequerInteracao = function($element, flag){
                if(window.confirm('Deseja ' + (flag === 'T' ? 'APLICAR' : 'REMOVER') + ' INTERAÇÃO para todos os conteúdos?'))
                {
                    $.ajax({
                        url: '/edcmidia/updateMidiasRequerInteracao',
                        data: {edcId: edcId, requerInteracao: flag},
                        type: 'post'
                    }).done(function(){
                        refreshGridView();
                        $('button', '#requerInteracaoButtons').removeClass('active');
                        $element.addClass('active');
                    });
                }
            };

        // events functions
        var onClickUpdateGridButton = function(e){
                e.preventDefault();
                var edcMidiaId = $(this).attr('href');
                openModalForUpdate(edcMidiaId);
            },
            onClickSaveButton = function(){
                var editorContent = new nicEditors.findEditor('Edcmidia_Conteudo').getContent();
                if(editorContent != '<br>') // se n tiver conteudo algum, o nicEdit sempre coloca um "<br>", se tiver só isso o campo tá vazio
                {
                    $conteudoTextField.val(editorContent);
                }else
                {
                    $conteudoTextField.val('');
                }

                var formData = $(':input', $('#modalCreate')).serialize();

                saveEdcMidiaData(formData, function(validationErrors){
                    if(!validationErrors)
                    {
                        location.reload();
                    }else
                    {
                        showErrorMessages(validationErrors);
                    }
                });
            },
            onClickCheckBox = function(){
                var self = $(this);
                changeValueToTrueOrFalse(self);
            },
            onClickImportUrlContentButton = function(){
                var url = $url.val();

                if(url == '')
                {
                    window.WiAlert('warning', 'Insira uma URL.');
                    return;
                }

                getFilesFromRemoteDirectory(url, function(files){
                    if(!files.length)
                    {
                        window.WiAlert('warning', 'Nada foi retornado a partir da URL informada.');
                        return;
                    }

                    saveFilesFromRemoteDirectory(
                        files,
                        edcId,
                        function(){
                            window.WiAlert('success', 'Registro realizado com sucesso.');
                            refreshGridView();
                            closeDialog($modalImport);
                            $url.val('');
                        },
                        function(objectCallback){
                            if(objectCallback.status === 500)
                            {
                                window.WiAlert('error', objectCallback.responseText);
                            }
                        }
                    );
                });
            },
            onChangeDropDownTipoMidia = function(){
                var self = $(this);
                switchFieldsUrlAndContent(self);
                toggleRequerInteracaoField(self);
            },
            onClickCreateButton = function(){
                openModalForCreate();
            },
            onKeyUpTempoMinimoTextField = function(){
                var self = $(this);
                onlyNumberFilter(self);
            },
            onClickSetRequerInteracaoButton = function(e){
                e.preventDefault();
                var flag = 'T';
                updateMidiasRequerInteracao($(this), flag);
            },
            onClickRemoveRequerInteracaoButton = function(e){
                e.preventDefault();
                var flag = 'F';
                updateMidiasRequerInteracao($(this), flag);
            },
            onClickEdcMidiaPreview = function(e)
            {
                e.preventDefault();
                var url = $(this).closest('tr').find('a.detalhes').attr('href');
                window.open(url,"_blank","toolbar=no, scrollbars=yes, resizable=yes, top=150, left=500, width=800, height=600");
            },
            alterRequerInteracao = function(e)
            {
                e.preventDefault();
                if($('td.checkbox-col input:checked').length){
                    multiToggleRequerInteracao()
                    return;;
                }
                var $element = $(this);
                $.post(
                    '/edcmidia/setinteracao/',
                    {checked:$(this).closest("tr").attr("id").replace("items[]_","")},
                    function(resposta)
                    {
                        window.WiAlert(resposta.s, resposta.m);
                        refreshGridView();
                    },
                    'json'
                );
            },
            multiToggleRequerInteracao = function(){
                if(window.confirm("Deseja aplicar essa ação para todos os itens selecionados?")){
                    var list = $('td.checkbox-col input:checked').map(function(){
                        return $(this).val();
                    }).get().join();
                    $.post(
                        '/edcmidia/setinteracao/',
                        {checked:list},
                        function(resposta)
                        {
                            window.WiAlert(resposta.s, resposta.m);
                            refreshGridView();
                        },
                        'json'
                    );
                    return true;
                }
                return false;
            },
            handleCheckIn = function(){

                $("#edcMidiaGridView .toggle-interation a").addClass('disabled');
                $("#edcMidiaGridView .buttoncolumn a").addClass('disabled');
                $("#edcMidiaInativoGridView .toggle-interation a").addClass('disabled');
                $("#edcMidiaInativoGridView .buttoncolumn a").addClass('disabled');

                $(".w-help-popover").addClass('in').removeClass("out");
            }
            handleCheckOut = function(){
              $("#edcMidiaGridView .toggle-interation a").removeClass('disabled');
              $("#edcMidiaGridView .buttoncolumn a").removeClass('disabled');
              $("#edcMidiaInativoGridView .toggle-interation a").removeClass('disabled');
              $("#edcMidiaInativoGridView .buttoncolumn a").removeClass('disabled');

              $(".w-help-popover").removeClass('in').addClass("out");
            }
            handleCheck = function(){
                    if($(".checkbox-col input:checked").length > 1){
                        handleCheckIn();
                    }
                    else if(!$(".checkbox-col input:checked").length){
                        handleCheckOut();
                    }
                }
            initRepeate = function()
            {
                var $gridAtivo = $("#edcMidiaGridView");
                var $gridInativo = $("#edcMidiaInativoGridView");
                $gridAtivo.on('click','td:not(.buttoncolumn, .checkbox-col, .toggle-interation), a.detalhes', onClickEdcMidiaPreview);
                $gridInativo.on('click','td:not(.buttoncolumn, .checkbox-col, .toggle-interation)', onClickEdcMidiaPreview);
                $("#setRequerInteracaoButton").on('click', onClickSetRequerInteracaoButton);
                $("#removeRequerInteracaoButton").on('click', onClickRemoveRequerInteracaoButton);
                $('a.setRequerInteracao').on('click', alterRequerInteracao);
                $('.awesome-tooltip').tooltip();
                $gridAtivo.on('change','.checkbox-col input', handleCheck);
                $gridInativo.on('change','.checkbox-col input', handleCheck);
                $("#edcMidiaGridView_c0_all, #edcMidiaInativoGridView_c0_all").on('change', function(){
                    if(this.checked){
                        handleCheckIn();
                        return;
                    }
                    handleCheckOut();
                });
                var onRefreshGrid = function(){
                    saveNewEdcMidiaOrdem();
                    if($(".w-help-popover").hasClass("in"))
                        $(".w-help-popover").removeClass('in').addClass("out");
                }
                $gridAtivo.on('update',onRefreshGrid);
                $gridInativo.on('update',onRefreshGrid);
            };

        return {
            init: function(){
                // do all bindings and stuff
                setNicEditorPluginToContentTextField();
                hideFields();
                makeGridViewSortable({
                    update: saveNewEdcMidiaOrdem
                });

                $('a.editar').on('click', function(e){
                    e.stopPropagation();
                });

                //$('.modal-body').css({maxHeight: '800px'});

                //$(document).on('click', updateGridButton, onClickUpdateGridButton);

                $('span[rel="tooltip"]').tooltip();

                $saveButton.on('click', onClickSaveButton);
                $checkbox.on('click', onClickCheckBox);
                $tempoMinimoTextField.on('keyup', onKeyUpTempoMinimoTextField);
                $importUrlContentButton.on('click', onClickImportUrlContentButton);
                $dropDownTipoMidia.on('change', onChangeDropDownTipoMidia);

                $(".w-help-popover .interation")
                    .off().click(function(e){
                        e.preventDefault();
                        e.stopPropagation();
                        $("#edcMidiaGridView .toggle-interation a").first().click();
                    });
                $(".w-help-popover .delete")
                    .off().click(function(e){
                        e.preventDefault();
                        e.stopPropagation();
                        $("#edcMidiaGridView .buttoncolumn .excluir")
                        .first().click();
                    });
                $(".w-help-popover .active")
                    .off().click(function(){
                        var list = $("td.checkbox-col input:checked").map(function(){
                            var $parent = $(this).closest(".grid-view");
                            var $target = $(".grid-view").not($parent).find("tbody");
                            $(this).closest("tr").appendTo($target);
                            return $(this).val();
                        }).get().join();
                        $.post(
                            '/edcmidia/ActivateDeactivateMultipleLines',
                            {checked:list},
                            function(data){
                                window.WiAlert(data.s,data.m);
                                saveNewEdcMidiaOrdem();
                            },
                            'json'
                        );
                    })

                if(!$createButton.hasClass("disabled"))
                {
                    $createButton.on('click', onClickCreateButton);
                    $modalImport.on('shown', function(){
                        $url.focus();
                    });
                    $importButton.on('click',function(){
                        $modalImport.modal('show');
                    });
                }

                switchFieldsUrlAndContent($dropDownTipoMidia);
                toggleRequerInteracaoField($dropDownTipoMidia);

                $("a.disabled").css('cursor','not-allowed');

                initRepeate();
                /*$gridAtivo.on('click','td', onClickEdcMidiaPreview);
                 $("#edcMidiaInativoGridView").on('click','td', onClickEdcMidiaPreview);*/
            },
            makeGridViewSortable: function(id, data)
            {
                makeGridViewSortable({update: saveNewEdcMidiaOrdem});
            },
            saveNewEdcMidiaOrdem: saveNewEdcMidiaOrdem,
            initRepeate : initRepeate
        };
    })();

    Edcmidia.init();
});
