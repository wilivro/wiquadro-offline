/**
 * Created by David Figueiredo on 13/02/14.
 */

var Edc;
$(document).ready(function()
{
    Edc = (function()
    {
        var $status = {
            'T' : {label:'warning', icon:'remove', title:'Bloquear EDC'},
            'F': {label:'success', icon:'ok', title:'Ativar EDC'}};
        var $tableTree = $('table.treetable');
        var $modalEdc = $('#modalAddEdc');
        var $modalConfigEdc = $('#modalConfigEdc');
        var $edcForm = $('#edc-form');

        var $isEdcParaTodasAsTurmas = $('#Edc_isEdcParaTodasAsTurmas');
        var $turmasList = $('.turmas');
        var $addTurmasEspecificas = $('.addTurmasEspecificas');

        var preventDefault = function(e){e.preventDefault();};

        /**
         * Função generica para tratar retorno via AJAX
         * Padrão: r = {acao: [true, false], mensagem: [String, undefined]}
         */
        var genericReturnAJAX = function(r)
        {
            if (r.acao)
            {
                if(r.mensagem !== undefined)
                {
                    window.WiAlert('success', r.mensagem);
                }

                location.reload();
            }else
            {
                window.WiAlert('error', r.mensagem);
            }

        };

        var getIdEdc = function($obj)
        {
            return $obj.closest('tr').attr('data-tt-id');
        };
        /**
         * Edição dos EDCs
         */
        var editEDC = function()
        {
            var $a = $(this);
            $.post($a.attr('href'),{},_editEDC,'json');
        };

        var _editEDC = function (r)
        {
            if(r.acao)
            {
                $.each(r.Edc, function(index, value)
                {
                    $('#Edc_'+index).val(value);

                    if(index === 'LiberaAvaliacao')
                    {
                        $(':radio[name="Edc[LiberaAvaliacao]"][value='+value+']').attr('checked', true);
                    }
                });

                $modalEdc.modal().find('form').attr("action",'/edc/update');
            }else
            {
                window.WiAlert('error', r.mensagem);
            }
        };

        var openConfigEdcModal = function(element, edcTitle, edcId){
            var href = element;
            if(typeof element === 'object')
            {
                href = element.attr('href');
                edcId = element.data('edc');
            }

            $.post(href, {}, showConfigs, 'json');
            $('#idEdcConfig').val(edcId);
            $('h4.nameEdc').text(edcTitle);
            $modalConfigEdc.modal('show');
        };

        /**
         * Configuração dos EDCs
         */
        var configEdc = function()
        {
            var element = $(this), $tr = element.closest('tr'), //idEdc = $tr.attr('data-tt-id'), idDisciplina = $('#disciplinaId').val(),
                edcTitle = $tr.find('.title:first').text();
            openConfigEdcModal(element, edcTitle);
        };

        var showConfigs = function(r)
        {
            if(!r.acao)
            {
                window.WiAlert('error', r.mensagem);
                $modalConfigEdc.modal('hide');
                return false;
            }

            var divPrerequisitos = '#dependencias', divInit = '.init', $div = $('<div>'), $span = $('<span>');
            $div.addClass('element');
            $span.addClass('not');

            // Exibe os EDCS
            var titulo = '';
            $.each(r.edcs, function(){
                var edc = this, $container = $div.clone(), $text = $span.clone();

                titulo = '';
                if(edc.EdcPaiTitulo)
                {
                    titulo = edc.EdcPaiTitulo + ' > ';
                }

                $text.text(edc.Ordem + ' - ' + titulo + edc.Titulo);
                $container.attr('data-id', edc.Id).html($text).appendTo(divInit);
            });

            // Exibe os pré-requisitos.
            $.each(r.dependencias, function()
            {
                var dependencia = this, $container = $div.clone(), $text = $span.clone();
                titulo = '';
                if(dependencia.IdEdcPreRequisito.EdcPaiTitulo)
                {
                    titulo = dependencia.IdEdcPreRequisito.EdcPaiTitulo + ' > ';
                }
                $text.text(dependencia.IdEdcPreRequisito.Ordem + ' - ' + titulo + dependencia.IdEdcPreRequisito.Titulo);
                $container.addClass('sortable');

                if(dependencia.Grupo == 0)
                    $container.attr('data-id', dependencia.IdEdcPreRequisito.Id).html($text).appendTo(divPrerequisitos);
                else
                {
                    var $element = $div.clone(), $group = $('div[data-grupo="'+dependencia.Grupo+'"]');
                    $element.attr('data-id', dependencia.IdEdcPreRequisito.Id).html($text);
                    $container.addClass('equi');

                    if($group.length > 0)
                        $group.append($element);
                    else
                        $container.attr('data-grupo', dependencia.Grupo).append($element).appendTo(divPrerequisitos);
                }
            });

            initSortable();
        };

        var changeAtivo = function()
        {
            var $a = $(this);
            $.post($a.attr('href'),{},genericReturnAJAX,'json');
        };

        var deleteEdc = function()
        {
            var deletar = confirm('Tem certeza que deseja excluir este EDC?');

            if(!deletar)
                return false;

            var $a = $(this);
            $.post($a.attr('href'),{},genericReturnAJAX,'json');
        };

        var saveEdc = function (form, data, hasError)
        {
            if (hasError)
                return false;

            var $form = $(form);
            $.post($form.attr('action'),$form.serialize(),genericReturnAJAX,'json');
        };

        var addEdcChild = function()
        {
            var $a = $(this);

            $('#Edc_IdEdc').val(getIdEdc($a));

            $modalEdc.modal('show');
        };

        var viewChildEdcs = function()
        {
            var $a = $(this), idEdc = getIdEdc($a), $li = $('#'+idEdc), $ulChild = $li.children('ul');

            if($ulChild.length > 0)
            {
                if($ulChild.is(':visible'))
                {
                    $li.find('i:first').removeClass('icon-chevron-down').addClass('icon-chevron-right');

                    $ulChild.addClass('hide');
                }
                else
                {
                    $li.find('i:first').removeClass('icon-chevron-right').addClass('icon-chevron-down');

                    $ulChild.removeClass('hide');
                }

                return false;
            }

            $.get('/edc/getChildEdcs/id/'+idEdc,{},_viewChildEdcs,'json');
        };

        var _viewChildEdcs = function(r)
        {
            if(r.acao)
            {
                var $li, liParent, $liParent, $ul = $('<ul>');
                $ul.addClass('tree ul-table sortable');
                $.each(r.Edcs, function(index, obj)
                {
                    $li = $('ul.tree li:first').clone();

                    if(obj.qtdChildren == 0)
                        $li.find('a.childEdcs').addClass('hide');

                    liParent = obj.IdEdc;
                    $ul.attr('data-idparent', obj.IdEdc);
                    $li.removeClass('hide');
                    $li.attr('id', obj.Id);
                    $li.find('.items').val(obj.Id);
                    $li.find('.titulo').html(obj.Titulo);
                    $li.find('.descricao').html(obj.Descricao);
                    $li.find('.midia').attr('href', $li.find('.midia').attr('href')+obj.Id);
                    $li.find('.exercicio').attr('href', $li.find('.exercicio').attr('href')+obj.Id);
                    var $aAtivo = $li.find('a[data-action="Ativo"]');
                    $aAtivo.attr('title', $status[obj.Ativo].title)
                        .attr('class', 'label label-'+$status[obj.Ativo].label)
                        .children('i').attr('class', 'icon-white icon-'+$status[obj.Ativo].icon);

                    $ul.append($li);
                });

                $liParent = $('#'+liParent);
                $liParent.find('i:first').removeClass('icon-chevron-right').addClass('icon-chevron-down');
                $ul.addClass('child-'+$liParent.parents('ul').length);
                $liParent.append($ul);
                $ul.sortable({
                    stop: saveNewEdcOrdem
                });
            }
            else
            {
                window.WiAlert('error', r.mensagem);
            }
        };

        var resetForm = function()
        {
            $modalEdc.find("form").attr("action",'/edc/create');
            $edcForm.find('input').not('#Edc_IdDisciplina, :radio, input[type="submit"]').val('');
            $edcForm.find('textarea').val('');
            $edcForm.find(':radio').attr('checked', false);
        };

        var showEquivalent = function()
        {
            $a = $(this);
            $a.closest('li').find('ul').show();
        };


        var _receive = function(event, ui)
        {
            $divpai = $(this);
            $element = ui.item;

            //Equivalência
            if($divpai.hasClass('element'))
            {
                $span = $divpai.children('span');
                if($span.length > 0)
                {
                    $div = $('<div>');
                    $div.addClass('element').html($span.clone());
                    $div.attr('data-id', $divpai.attr('data-id'));
                    $divpai.removeAttr('data-id');
                    $span.remove();
                    $divpai.prepend($div);
                }
                $divpai.addClass('equi');
                $divpai.find('div').removeClass('sortable');
            }
            else if($divpai.hasClass('init'))
            {
                if($element.find('div').length > 0)
                    $element.after($element.html()).remove();
            }

            var $deOndeVeio = $(ui.sender);
            if($deOndeVeio.hasClass('element') && $deOndeVeio.find('div').length === 1)
            {
                $deOndeVeio.after($deOndeVeio.find('div'));
                $deOndeVeio.remove();
            }

            $('.init').find('div').removeClass('sortable');
            $('.dependencias').children('div').addClass('sortable');

            initSortable();
        };

        var initSortable = function()
        {
            $('.sortable').sortable({
                helper: 'clone',
                cancel: '.not',
                connectWith: '.sortable',
                receive: _receive
            });
        };


        var checkModalConfig = function(e)
        {
            $modal = $(this), $dependencias = $modal.find('.dependencias'), $init = $('.init');

            if($dependencias.find('.element').length > 0)
            {
                var fechar = confirm("Existem informações não salvas.\n\nDeseja realmente fechar essa janela?");

                if(!fechar)
                {
                    e.preventDefault();
                    return false;
                }
            }

            $('.init, #dependencias').html('');
        };

        var saveConfigEdc = function(e)
        {
            e.preventDefault();

            var dependencias = $('.dependencias').sortable('toArray', {attribute: 'data-id'});

            $('.dependencias > .element.equi').each(function()
            {
                var equi = $(this).sortable('toArray',{attribute: 'data-id'});
                if(equi.length > 0)
                    dependencias.push(equi);
            });

            $.post($(this).attr('action')+'/'+$('#idEdcConfig').val(),{dependencias: dependencias},genericReturnAJAX,'json');
        };

        var saveNewEdcOrdem = function(e, ui){
            var $element = $(ui.item),
            $tbody = $element.closest('tbody'),
            $parentId = $element.attr('data-tt-parent-id'),
            data;

            if(($element.prev().data('tt-id') === $element.data('tt-parent-id')) || ($element.prev().data('tt-parent-id') === $element.data('tt-parent-id')))
            {
                if(!$parentId)
                {
                    data = $tbody.find(':not([data-tt-parent-id]) .items');
                }else
                {
                    data = $tbody.find('[data-tt-parent-id="' + $parentId + '"] .items');
                }

                $.ajax({
                    type: 'post',
                    url: '/edc/saveNewEdcOrdem',
                    data: data.serialize(),
                    dataType: 'json'
                }).done(function(){
                    window.WiAlert('success', 'Ordem alterada com sucesso.');
                    window.location.reload();
                });
            }else
            {
                $(this).sortable("cancel");
                window.WiAlert('warning', 'A ordenação só pode ocorrer entre EDCs do mesmo nível hierárquico.');
            }
        };

        var onChangeIsEdcParaTodasAsTurmas = function(){
            toggleTurmasList($(this).val());
            $('.modal-body').scrollTop(9999);
        };

        var toggleTurmasList = function(flag)
        {
            $turmasList.hide();
            if(flag === 'T')
            {
                $turmasList.show();
            }
        };

        return {
            init : function()
            {
                $tableTree.on('click', 'a[data-action!="free"]', preventDefault);
                $tableTree.on('click', 'a[data-action="Edit"]', editEDC);
                $tableTree.on('click', 'a[data-action="Deletar"]', deleteEdc);
                $tableTree.on('click', 'a[data-action="Ativo"]', changeAtivo);
                $tableTree.on('click', 'a[data-action="Add"]', addEdcChild);
                $tableTree.on('click', 'a.childEdcs', viewChildEdcs);
                $tableTree.on('click', 'a[data-action="Config"]', configEdc);
                $('#dependencias').on('click', 'a[data-action="AddEquivalent"]', showEquivalent);
                $('#formConfigEdc').on('submit', saveConfigEdc);

                if($isEdcParaTodasAsTurmas && $turmasList)
                {
                    $isEdcParaTodasAsTurmas.on('change', onChangeIsEdcParaTodasAsTurmas);
                    toggleTurmasList($isEdcParaTodasAsTurmas.val());
                }

                $('.edcsortable').sortable({
                    update: saveNewEdcOrdem,
                    helper: function(e, ui){
                        ui.children().each(function(){
                            $(this).width($(this).width());
                        });
                        return ui;
                    }
                });

                $modalEdc.on('hide.bs.modal', resetForm);
                $modalEdc.on('show.bs.modal', function(){
                    $addTurmasEspecificas.show();
                    if($('#Edc_IdEdc').val() !== '')
                    {
                        $addTurmasEspecificas.hide();
                    }
                });
                $modalConfigEdc.on('hide.bs.modal', checkModalConfig);
                initSortable();
            },
            saveEdc: saveEdc,
            openConfigEdcModal: openConfigEdcModal
        };
    })();

    Edc.init();
});
