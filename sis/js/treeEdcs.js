
$(document).ready(function()
{
    if($("[data-type='radio-progress']").length > 0)
        $("[data-type='radio-progress']").radioProgress();
    var EdcTree = (function()
    {   var $alunoTurmaId = $('#alunoTurmaId'),
        $tree = $('ul.tree'),
        $treeTable = $('section.edc-tree'),
        $listFavorits = $('#listFavorits');

        var getChildren = function()
        {
           
            var $a = $(this),
                idPai = $a.closest('.panel-default').attr('id'),
                parentTrElement = $a.closest(".panel-default").find('[data-pai="'+idPai+'"]');

            var $collapse = $a.closest(".panel-default").children(".panel-collapse");

            if ($a.closest('li').find('ul').length > 0 || parentTrElement.length > 0)
            {

            
                var $i = $a.children('i');

                if($i.hasClass('fa-chevron-down'))
                {
                    //parentTrElement.removeClass('hide');
                    $i.closest('li').find('ul').removeClass('hide');
                    $i.removeClass('fa-chevron-down').addClass('fa-chevron-up');
                    $collapse.collapse('show');
                }else
                {
                    //parentTrElement.addClass('hide');
                    $i.closest('li').find('ul').addClass('hide');
                    $i.removeClass('fa-chevron-up').addClass('fa-chevron-down');
                    $collapse.collapse('hide');
                }

            return false;
        }   

        $collapse.collapse('show');


            var getDataAndDisplayChildren = function(strategyFunction){
                $.get($a.attr('href'), {}, strategyFunction, 'json');
            };
            
            if($a.closest('.tree').is('ul'))
            {
                getDataAndDisplayChildren(showChildrenUl);
            }else
            {
                getDataAndDisplayChildren(showChildrenTable);
            }

            return false;
        };

        var showChildrenTable = function(r)
        {
            
            if(!r.acao)
            {
                window.WiAlert("error", r.mensagem);
                return false;
            }
            
            var $trPai, $trAfter = 0;

            var getOnlyDatePart = function(datetime){
                return datetime !== null ? datetime.split(' ')[0] : datetime;
            };

            $.each(r.Edcs, function(index, obj)
            {
                obj.UltimoAcesso = getOnlyDatePart(obj.UltimoAcesso);
                obj.DataConclusao = getOnlyDatePart(obj.DataConclusao);

                obj.LastEdcMidia = parseInt(obj.LastEdcMidia);
                obj.qtdMidias = parseInt(obj.qtdMidias);
                $trPai = $('div#'+obj.IdEdc);
                
                var $tr = $trPai.clone();
                $tr.children('.panel-collapse').children().remove();
                var $collapse = $trPai.children(".panel-collapse");

                var $progress = obj.LastEdcMidia > 0 ? Math.round((obj.LastEdcMidia * 100) / obj.qtdMidias, -2) : obj.LastEdcMidia;
                var $aGetChildren = $tr.find('a.getChildren');
                
                $trAfter = $trAfter === 0 ? $trPai : $trAfter.next();
                
                if(obj.qtdChildren > 0)
                {
                    $aGetChildren.removeClass('hide').attr('href', '/plataforma/getChildrenEdc/alunoturma/'+$('#alunoturmaid').val()+'/idedc/'+obj.Id)
                    .find('i')
                    .removeClass('fa fa-chevron-up')
                    .addClass('fa fa-chevron-down');
                }else
                {
                    $aGetChildren.addClass('hide');
                }
                
                $tr.attr('id', obj.Id).attr('data-pai', obj.IdEdc);
                $tr.find('.edc-row-container').css({
                    marginTop:5,
                    marginBottom:0
                });
                $tr.find('td.licao').prepend('&nbsp;');
                $tr.find('a.viewEdc').attr('href', '/plataforma/conteudo/alunoturma/' + $('#alunoturmaid').val() + '/edcid/' + obj.Id).text(obj.Titulo);
                $tr.find(".edc-row").attr("title",obj.Titulo);
                
                if(obj.Titulo.length > 30){
                    $tr.find(".edc-row").tooltip();
                } 
                    
                $tr.find('div.radioProgress.success')
                    .attr('data-value-now',$progress)
                    .radioProgress()
                    .tooltip();

                $tr.find('span.pagina').text(obj.LastEdcMidia+'/'+obj.qtdMidias);
                $tr.find('span.ultimoAcesso').text(dateBR(obj.UltimoAcesso));
                $tr.find('span.termino').text(dateBR(obj.DataConclusao));
                //show EDC
                //$trAfter.after($tr);
                $tr.appendTo($collapse)
                // $tr.find('.edc-text-container').css({
                //     width:$tr.find('.edc-text-container').outerWidth() - 26,
                //     marginLeft:"+=25"
                // });
            });
            
            $trPai.find('i').first().removeClass('fa-chevron-down').addClass('fa-chevron-up');
        };

        // assuming the format yyyy-mm-dd
        var dateBR = function(date)
        {
            if(date === null)
                return '-';
            
            date = new Date(date);
            var mes = date.getMonth()+1;
            mes = mes < 10 ? '0'+mes : mes;
            
            return date.getUTCDate()+'/'+mes+'/'+date.getFullYear();
        };
        
        var showChildrenUl = function(r,callBack)
        {
           
            if (!r.acao)
            {
                window.WiAlert("error", r.mensagem);
                return false;
            }

            var $li, liParent, $liParent, $ul = $('<ul>'), $aGetChildren, $aTitulo;
            $ul.addClass('tree sb-submenu sb-submenu-active');
            $.each(r.Edcs, function(index, obj)
            {
                $li = $('ul.tree li:first').clone();
                liParent = obj.IdEdc;
                $ul.attr('data-idparent', obj.IdEdc);
                $li.removeClass('hide');
                $li.attr('data-id', obj.Id);

                $aGetChildren = $li.find('a.getChildren');
                if(obj.qtdChildren > 0)
                    $aGetChildren.removeClass('hide').attr('href', $aGetChildren.attr('href')+obj.Id).find('i').attr('class', 'icon-chevron-down');
                else
                    $aGetChildren.addClass('hide');
                
                //$aGetChildren.attr('href', $aGetChildren.attr('href') + obj.Id);
                $aTitulo = $li.find('a.titulo');
                $aTitulo.addClass('viewEdc').attr('href', '/plataforma/conteudo/alunoturma/' + $('#alunoturmaid').val() + '/edcid/' + obj.Id).text(obj.Titulo);
                $ul.append($li);
                
            });

            $liParent = $('[data-id="' + liParent + '"]');
            $liParent.append($ul);
            $liParent.children('div').find('i').removeClass('fa-chevron-down').addClass('fa-chevron-up');
            

            if(callBack){
                callBack();
            }
        },
        findParent = function(child,crumb,_default){
            if(!child.filhoDe){
                $li = $("<li>")
                    .addClass("active")
                    .html(_default);
                crumb.append($li);
                return;
            }
            $.ajax({
                type:'post',
                url:'/plataforma/getParentEdc',
                data:{idFilho:child.filhoDe},
                dataType:'html'
            }).done(function(data){
                value = JSON.parse(data);
                $li = $("<li>")
                    .addClass("active")
                    .html(value[0].tituloEdc+"&nbsp;/&nbsp;");
                crumb.prepend($li);
                findParent(value[0],crumb,_default)
            })


        }
        var getIconEdcMidia = function(icon){
            
            var out;
            switch (icon)
            {
               case '1':
                out = 'icon-font';
                break;
               case '2':                
                out = 'icon-font';
                break;
               case '3':
                out = 'icon-font';
                break;
               case '4':
                out = 'icon-facetime-video';
                break;
               case '5':
                out = 'icon-headphones';
                break;
            }
            
            return out;
        },
        getFavorits = function(){
            $listFavorits.find(".modal-body > table").remove();
            $.ajax({
                type:'post',
                url:'/plataforma/listAllFavorits',
                data:{alunoTurmaId: $alunoTurmaId.val()},
                dataType:'html'
            }).done(function(data){
                
                values = JSON.parse(data);
                
                for(var i=0;i<values.length;i++){
                    classIcon = getIconEdcMidia(values[i].tipo);
                    
                    $icon = $("<span>").append($('<i>').addClass(classIcon)).addClass("span1");
                    $link = $("<a>")
                        .attr("href","/plataforma/conteudo/alunoturma/"+$alunoTurmaId.val()+"/edcid/"+values[i].edcId+"/edcMidiaId/"+values[i].IdMidia)
                        .html(values[i].tituloMidia);
                    $cell = $("<td>")
                        .append($icon)
                        .append($("<span>").append($link));
                    $row = $("<tr>").append($cell)
                    
                    
                    if(!$("#EDC_"+values[i].edcId).length){
                        $breadCrumb = $("<ol>").addClass("breadcrumb");
                        $head = $("<thead>").append($breadCrumb);
                        $body = $("<tbody>")
                            .append($row)
                        $table = $("<table>")
                            .attr("id","EDC_"+values[i].edcId)
                            .addClass("table table-hover")
                            .append($head)
                            .append($body);                        
                        $listFavorits.find(".modal-body").append($table);
                        findParent(values[i],$breadCrumb,values[i].tituloEdc);
                        continue;
                    }
                    $("#EDC_"+values[i].edcId+" > tbody").append($row);
                    
                }

            });

        },
        copyTreeEdc = function(){
            if(!$("#listFavorits").find(".modal-body > div").length) {
                $treeEdcBody = $(".sb-slidebar").html();
                $("#listFavorits").find(".modal-body").html($treeEdcBody);
                $("#listFavorits").find($('[data-id="'+target+ '"]')).find('div').first().css('background-color','#5AB45A');
            }
                
        },
        findChild = function(_child)
        {
            if (_child.length)
            {

                var _url = $('[data-id="' + _child[_child.length - 1]+ '"]').find('.getChildren').attr('href');

                $.ajax({
                    url: _url,
                }).done(function(data) {
                    var callBack = function(){                        
                        _child.pop();                        
                        findChild(_child);
                    }                  
                    showChildrenUl(JSON.parse(data),callBack);                    
                });
                return;
            }
            $('[data-id="'+target+ '"]').find('div').first().css('background-color','#5AB45A');
            
        }         

        return{
            init: function()
            {
                $tree.on('click', 'a.getChildren', getChildren);
                //$listFavorits.on('click', 'a.getChildren', getChildren);
                $listFavorits.on('show.bs.modal',getFavorits);
                $treeTable.on('click', 'a.getChildren', getChildren);
                //Verificar
                //findChild(parents);
                $("#edc-accordion").on("click",".edc-row",function(e){
                    window.location.href = $(this).find("a:not('.getChildren')").attr("href");
                });
            }
        }
    })();

    EdcTree.init();

});