$(document).ready(function()
{
    var $disciplinaDependencia =  $('#Disciplina_IdDisciplinaDependencia'),
        $modalListaDisciplina = $('#modalListDisciplina'),
        $inputDisciplina = $('#nameDisciplina'),
        $modalLabel = $("#modalAddDisciplinaLabel");


    $('a.editDisciplina').on('click', function()
    {
        $modalLabel.text("Editar Disciplina");
        var info = $.parseJSON($(this).parent().parent().attr('data-json'));

        $.each(info, function(index, value)
        {
            $('#Disciplina_' + index).val(value);

            switch(index)
            {
                case 'TipoCorrecao' :
                    $('[name="Disciplina[TipoCorrecao]"][value="'+value+'"]').attr('checked', true);
                break;
                case 'IdDisciplinaDependencia' :
                    $disciplinaDependencia.find('option[value="'+value+'"]').attr('selected', true);
                break;
                case 'Id' :
                    $disciplinaDependencia.find('option[value="'+value+'"]').hide();
                break;
            }
        });

        //$('#modalAddDisciplina span.labelAcao').text('Editar');
        $('#disciplina-form').attr("action","/disciplina/update");
        $('#modalAddDisciplina').modal('show');
    });

    $('#modalAddDisciplina').on('hide.bs.modal', function(){
        //$('#modalAddDisciplina span.labelAcao').text('Criar');
        resetAddDisciplinaForm();
    });

    var resetAddDisciplinaForm = function()
    {
        $('#disciplina-form').attr("action","/disciplina/create");
        $('form#disciplina-form input[type="number"], form#disciplina-form input[type="text"], form#disciplina-form input#Disciplina_Id, form#disciplina-form textarea').val('');
        $('[name="Disciplina[TipoCorrecao]"]').attr('checked', false);
        $disciplinaDependencia.find('option').show();
        
    };

    //Remove disciplina do projeto
    $('a.removeByProjeto').on('click', function(e)
    {
        e.preventDefault();

        var remove = confirm('Tem certeza que deseja remover esta Disciplina do Projeto?');

        if (remove)
        {
            $.post(
                    '/disciplina/removeByProjeto/id/' + $(this).attr('data-id'),
                    {},
                    function(r)
                    {
                        if (r.acao)
                        {
                            window.WiAlert('success', "Disciplina removida com sucesso!");
                            location.reload();
                        }
                        else
                        {
                            window.WiAlert('error', r.mensagem);
                        }
                    },
                    "json"
                    );
        }
    });

    $('#addDisciplina').on('click', function()
    {
        $modalLabel.text("Criar Disciplina");
        $modalListaDisciplina.modal('hide');
        resetAddDisciplinaForm();
    });

    //Deleta disciplina
    $('a.excluirDisciplina').on('click', function(e)
    {
        e.preventDefault();

        var disciplina = $.parseJSON($(this).parent().parent().attr('data-json'));
        var remove = confirm("Tem certeza que deseja excluir esta Disciplina?");

        if (remove)
        {
            $.post(
                    '/disciplina/delete/id/' + disciplina.Id,
                    {},
                    function(r)
                    {
                        if (r.acao)
                        {
                            window.WiAlert('success', "Disciplina excluída com sucesso!");
                            location.reload();
                        }
                        else
                        {
                            window.WiAlert('error', r.mensagem);
                        }
                    },
                    "json"
                    );
        }
    });

    //Preenche modal com disciplinas
    $('a.listDisciplinas').on('click', function(e)
    {
        e.preventDefault();
        $modalListaDisciplina.modal('show');

        $.post(
                '/projeto/getDisciplinasNotAssoc/id/' + $(this).data('idprojeto'),
                {},
                function(r)
                {
                    if (r.acao)
                    {
                        $('table#listDisciplinas tbody').html('');
                        $.each(r.disciplinas, function()
                        {
                            var tr = $('<tr>'),
                                    td = $(
                                            '<td>' +
                                            '<label class="checkbox">' +
                                            '<input type="checkbox" name="disciplina[]" value="' + this.Id + '" />' +
                                            '<span data-content="' + this.Descricao + '">' + this.Titulo + '</span>' +
                                            '</label>' +
                                            '</td>');

                            td.appendTo(tr);
//                  
                            tr.appendTo('table#listDisciplinas tbody');
                        });
//                location.reload();

                        $('table#listDisciplinas label > span').popover(
                                {
                                    placement: 'right',
                                    title: 'Descrição',
                                    trigger: 'hover'
                                });

                    }
                    else
                    {
                        window.WiAlert('error', r.mensagem);
                    }
                },
                "json"
                );
    });


    $('#listDisciplina-form').submit(function(e)
    {
        e.preventDefault();

        if ($('#listDisciplina-form input[type="checkbox"]:checked').length === 0)
        {
            window.WiAlert('warning', 'Selecione ao menos uma Disciplina.');
            return false;
        }
        else
        {
            $.post(
                    '/projeto/addDisciplinaProjeto/id/' + $('#listDisciplina-form input[type="hidden"][name="projeto"]').val(),
                    $(this).serialize()
                    ,
                    function(r)
                    {
                        if (r.acao)
                        {
                            window.WiAlert('success', "Disciplina(s) adicionada(s) com sucesso!");
                            location.reload();
                        }
                        else
                        {
                            window.WiAlert('error', r.mensagem);
                        }
                    },
                    "json"
                    );
        }
    });

    //Preenche o grid com as aulas associadas a disciplina
    $('a.viewAulas').on('click', function(e)
    {
        e.preventDefault();

        var tr = $(this).parent().parent(), trAulas = tr.next();

        var cleanAulas = function(tr)
        {
            tr.find('tbody').html('');
        };
        //Se as aulas da disciplina selecionada já estiverem listadas, o conteúdo da tr é limpo e escondido.
        if (tr.hasClass('selected'))
        {
            tr.removeClass('selected');
            trAulas.children('td').hide('slow', cleanAulas(trAulas));
            return false;
        }

        cleanAulas(trAulas);

        var infos = $.parseJSON(tr.attr('data-json'));

        $.post(
                '/disciplina/getAulas/id/' + infos.Id,
                {},
                function(r)
                {
                    if (r.acao)
                    {
                        if (r.aulas.length === 0)
                        {
                            trAulas.find('tbody').html(
                                    '<tr>' +
                                    '<td colspan="4">' +
                                    '<h3>Não Existem Aulas cadastradas para esta disciplina.</h3>' +
                                    '</td>' +
                                    '</tr>');
                        }
                        else
                        {
                            var i = 0;

                            $.each(r.aulas, function()
                            {
                                i++;
                                var trAula = $("<tr data-json='" + JSON.stringify(this) + "'>");
                                //Coluna Título
                                $('<td>' + this.Titulo + '</td>').appendTo(trAula);
                                //Coluna Descrição
                                $('<td class="descricao-column">' + this.Descricao + '</td>').appendTo(trAula);
                                //Colunas Ordem
                                //$('<td style="width:35px; text-align:right;"><a title="Ordem atual" rel="tooltip" class="badge badge-info">'+this.Numero+'</a></td>').appendTo(trAula);
                                $(
                                        '<td class="order-column">' +
                                        '<a title="Ordem atual" rel="tooltip" class="badge badge-info">' + this.Numero + '</a>' +
                                        '<input type="text" readonly="true" title="Nova ordem" rel="tooltip" style="width:10px; margin:0 0 0 5px" name="ordem[' + this.Id + ']" value="' + i + '" /> ' +
                                        '<!--<a class="badge badge-info" title="Nova ordem" rel="tooltip">' + i + '</a> -->' +
                                        '<i data-type="actionAula" data-action="ordem" title="Up" data-direction="up" class="icon-chevron-up"></i> ' +
                                        '<i data-type="actionAula" data-action="ordem" title="Down" data-direction="down" class="icon-chevron-down"></i>' +
                                        '</td>').appendTo(trAula);

                                //Verifica se a aula está está ativa ou não para exibir a opção correta
                                var ativo = this.Ativo === 'T' ?
                                        '<a href="/aula/changeStatus/id/' + this.Id + '" data-type="actionAula" class="label label-warning" data-action="status" title="Bloquear Aula" rel="tooltip"><i class="icon-white icon-ban-circle"></i></a>' :
                                        '<a href="/aula/changeStatus/id/' + this.Id + '" data-type="actionAula" class="label label-success" data-action="status" title="Ativar Aula" rel="tooltip"><i class="icon-white icon-ok"></i></a>';
                                //Coluna Ações
                                $(
                                        '<td class="button-column">' +
                                        '<a href="/aula/conteudo/id/' + this.Id + '" class="label label-violet" rel="tooltip" title="Gerenciar Conteúdo"><i class="icon-white icon-play"></i></a>' +
                                        '<a href="/aula/exercicio/id/' + this.Id + '" class="label label-gold" rel="tooltip" title="Gerenciar Exercício"><i class="icon-white icon-edit"></i></a>' +
                                        ativo +
                                        '<a href="#" data-type="actionAula" class="label" data-action="editar" title="Editar Aula" rel="tooltip"><i class="icon-white icon-pencil"></i></a>' +
                                        '<a href="/aula/delete/id/' + this.Id + '"" data-type="actionAula" class="label label-important" data-action="excluir" title="Excluir Aula" rel="tooltip"><i class="icon-white icon-trash"></i></a>' +
                                        '</td>').appendTo(trAula);

                                trAula.appendTo(trAulas.find('tbody'));
                            });
                        }

                        $('tr').removeClass('selected');
                        $('tr.viewAulas > td').hide(300);

                        tr.addClass('selected');
                        trAulas.children().slideToggle({duration: 300});
                    }
                    else
                    {
                        window.WiAlert('error', r.mensagem);
                    }
                },
                "json"
                );
    });

    //Criar e adicionar aula a disciplina
    $('a.addAula').on('click', function(e)
    {
        e.preventDefault();

        var tr = $(this).parent().parent(), infos = $.parseJSON(tr.attr('data-json'));

        $inputDisciplina.html(infos.Titulo);
        $inputDisciplina.val(infos.Id);

        $('#modalAddAula').modal('show');
    });

    var $modalAddDescritor = $('#modalAddDescritor');

    $('.addDescritor').on('click', function(e) {
        e.preventDefault();

        var tr = $(this).parent().parent(), infos = $.parseJSON(tr.attr('data-json'));
        var $disciplinaId = $('#Descritor_IdDisciplina');

        $disciplinaId.val(infos.Id);

        $.ajax({
            type: 'post',
            data: {IdDisciplina: $disciplinaId.val()},
            url: '/projeto/getDescritoresPorDisciplina'
        }).done(function(data){
            $('tbody', '#descritor-lista').html(data);
        });

        $('[id^="Descritor_"]').not('#Descritor_IdDisciplina').val('');

        $modalAddDescritor.modal('show');
    });

    $modalAddDescritor.on('click', '.deleteDescriptorButton', function(e){
        e.preventDefault();

        if (confirm('Deseja realmente excluir este item?'))
        {
            var $self = $(this);

            $.ajax({
                type: 'get',
                url: $self.attr('href')
            }).done(function(){
                $('#modalAddDescritor').modal('hide');
            }).fail(function(object){
                window.WiAlert('error', object.responseText);
            });
        }
    });

    $modalAddDescritor.on('click', '.alterDescriptorButton', function(e){
        e.preventDefault();

        $.ajax({
            type: 'get',
            url: $(this).attr('href'),
            dataType: 'json'
        }).done(function(attributes){
            for(var attr in attributes)
            {
                if(attributes.hasOwnProperty(attr))
                {
                    $('#Descritor_' + attr).val(attributes[attr]);
                }
            }
        });
    });

    //Ações das Aulas
    var actionsAulas =
            {
                status: function(element)
                {
                    $.post
                            (
                                    element.attr('href'),
                                    {},
                                    function(r)
                                    {
                                        if (r.acao)
                                        {
                                            window.WiAlert('success', 'Ação realizada com sucesso!');
                                            location.reload();
                                        }
                                        else
                                        {
                                            window.WiAlert('error', r.mensagem);
                                        }
                                    },
                                    'json'
                                    );
                },
                editar: function(element)
                {
                    var info = $.parseJSON(element.parent().parent().attr('data-json')),
                            disciplina = $.parseJSON($('tr.selected').attr('data-json'));

                    $inputDisciplina.html(disciplina.Titulo);
                    $inputDisciplina.val(disciplina.Id);

                    $.each(info, function(index, value)
                    {
                        $('#Aula_' + index).val(value);
                    });

                    $('#modalAddAula').modal('show');

                },
                excluir: function(element)
                {
                    if (confirm('Tem certeza que deseja excluir esta Aula?'))
                    {
                        $.post
                                (
                                        element.attr('href'),
                                        {},
                                        function(r)
                                        {
                                            if (r.acao)
                                            {
                                                window.WiAlert('success', 'Aula excluída com sucesso!');
                                                location.reload();
                                            }
                                            else
                                            {
                                                window.WiAlert('error', r.mensagem);
                                            }
                                        },
                                        'json'
                                        );
                    }
                },
                ordem: function(element)
                {
                    var tr = element.parent().parent();

                    switch (element.attr('data-direction'))
                    {
                        case 'up' :
                            var beforeTr = tr.prev();

                            if (typeof beforeTr.attr('data-json') === 'undefined')
                                return false;

                            var order = element.prev().val(),
                                    orderPrev = beforeTr.children('td.order-column').children('input').val();

                            element.prev().val(orderPrev);
                            beforeTr.children('td.order-column').children('input').val(order);
                            tr.insertBefore(beforeTr);
                            break;
                        case 'down':
                            var afterTr = tr.next();

                            if (typeof afterTr.attr('data-json') === 'undefined')
                                return false;

                            var order = element.prev().prev().val(),
                                    orderNext = afterTr.children('td.order-column').children('input').val();

                            element.prev().prev().val(orderNext);
                            afterTr.children('td.order-column').children('input').val(order);
                            tr.insertAfter(afterTr);
                            break;
                    }
                },
                saveOrdem: function(element)
                {
                    $.post
                            (
                                    element.attr('href'),
                                    element.closest('form').serialize(),
                                    function(r)
                                    {
                                        if (r.acao)
                                        {
                                            window.WiAlert('success', 'Ordem das aulas alterada com sucesso!');
                                            location.reload();
                                        }
                                        else
                                        {
                                            window.WiAlert('error', r.mensagem);
                                        }
                                    },
                                    'json'
                                    );
                }
            };

    $(document).on('click', '[data-type="actionAula"]', function(e)
    {
        e.preventDefault();

        var element = $(this);

        switch (element.attr('data-action'))
        {
            case 'status':
                actionsAulas.status(element);
                break;

            case 'editar':
                actionsAulas.editar(element);
                break;

            case 'excluir':
                actionsAulas.excluir(element);
                break;
            case 'ordem':
                actionsAulas.ordem(element);
                break;
            case 'saveOrdem':
                actionsAulas.saveOrdem(element);
                break;
        }

    });

});