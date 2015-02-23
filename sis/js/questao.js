$(document).ready(function()
{
    if ($('input.radioSecao:checked').val() === 'T')
    {
        //$('#aba-alternativas').addClass('hidden');
        $('#aba-dicas').hide();
        $('#aba-midia').hide();
    }

    if ($('input.radioTipo:checked').val() === 'DIS')
    {
        $('#aba-alternativas').hide();
    }

    if (window.location.pathname.indexOf('createQuestao') !== -1 || window.location.pathname.indexOf('updateQuestao') !== -1)
    {
        new nicEditor(
                {
                    //iconsPath : '/js/nicEdit/nicEditorIcons.gif',
                    fullPanel: true,
                }).panelInstance('Questao_Texto');
    }

    $('input[name="Questao[Secao]"]').on('click', function() {
        var $element = $(this),
                tabs = $('#aba-dicas, #aba-midia');

        tabs.hide();

        if ($element.val() === 'P')
        {
            tabs.show();
        }
    });

    $('input[name="Questao[Tipo]"]').on('click', function() {
        var $element = $(this),
                tab = $('#aba-alternativas'),
                resposta = $('.resposta-subjetiva');

        tab.hide();
        resposta.show();

        if ($element.val() === 'OBJ')
        {
            tab.show();
            resposta.hide();
        }


    });

    $('textarea[id*="alternativa"]').each(function()
    {
        var id = $(this).attr('id');
        new nicEditor(
                {
                    fullPanel: true
                }).panelInstance(id);
    });

    $('textarea[id*="dica"]').each(function()
    {
        var id = $(this).attr('id');
        new nicEditor(
                {
                    fullPanel: true
                }).panelInstance(id);
    });

    var alfabeto = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];

    /*Ações das Questões*/
    var actionsQuestoes =
            {
                /*Simula ação do radio group*/
                radioGroup: function()
                {
                    $(document).on('click', 'table#alternativas input[type="radio"]', function()
                    {
                        $('table#alternativas input[type="radio"]').not(this).attr('checked', false);
                    });
                },
                newAlternativa: function(element)
                {
                    var tabela = $('table#alternativas'), tr = tabela.find('tbody tr:first').clone(),
                            ordem = tabela.find('tbody tr').length;

                    tr.find('td.editor').html('<textarea id="alternativa' + ordem + '" name="alternativa[' + ordem + '][Texto]" class="form-control texto"></textarea>');

//            tr.find('textarea.texto').attr('name', 'alternativa['+ordem+'][Texto]');
//            tr.find('textarea.texto').attr('id', 'alternativa'+ordem);
//            tr.find('textarea.texto').val('');

                    tr.find('input.id').val('').attr('name', 'alternativa[' + ordem + '][Id]');
                    tr.find('span.badge').html(alfabeto[ordem]);

                    tr.find('input.numero').attr('name', 'alternativa[' + ordem + '][Numero]');
                    tr.find('input.numero').val(ordem + 1);

                    tr.find('input.correta').attr('name', 'alternativa[' + ordem + '][Correta]').attr('checked', false);
//            tr.find('input.correta').attr('checked', false);
                    tr.appendTo(tabela.find('tbody'));
                    new nicEditor(
                            {
                                fullPanel: true
                            }).panelInstance('alternativa' + ordem);
                },
                newDica: function(element)
                {
                    var tabela = $('table#dicas'), tr = tabela.find('tbody tr:first').clone(),
                            ordem = tabela.find('tbody tr').length;

                    tr.find('td.editor').html('<textarea id="dica' + ordem + '" name="Dica[' + ordem + '][Texto]" class="form-control texto"></textarea>');
//            tr.find('textarea').val('');

                    tr.find('input.numero').attr('name', 'Dica[' + ordem + '][Numero]');
                    tr.find('input.numero').val(ordem + 1);
                    tr.find('input.id').attr('name', 'Dica[' + ordem + '][Id]');
                    tr.find('input.id').val('');

                    tr.appendTo(tabela.find('tbody'));
                    new nicEditor(
                            {
                                fullPanel: true,
                            }).panelInstance('dica' + ordem);
                },
                newMidia: function(element)
                {
                    var div = $('#tabMidia').find('div.divMidia:first').clone();
                    var num = $('#tabMidia').find('div.divMidia').length;
                    div.find('select.tipoMidia').attr('name', 'respostaMidia[' + num + '][IdTipoMidia]');
                    div.find('input.url').attr('name', 'respostaMidia[' + num + '][Url]').val('');
                    div.find('input.id').attr('name', 'respostaMidia[' + num + '][id]').val('');

                    div.appendTo($('#tabMidia'));
                },
                removeLineMidia: function(element)
                {
                    if ($('div.divMidia').length > 1)
                        element.closest('div.divMidia').remove();

                },
                removeLine: function(element)
                {
                    var tbody = element.closest('tbody');

                    if (tbody.find('tr').length === 1)
                        return false;

                    element.closest('tr').remove();

                    tbody.find('input.numero').each(function(index, input)
                    {
                        var tr = $(this).closest('tr');

                        $(this).val(index + 1);

                        if (element.is('.alternativa'))
                        {
                            $(this).attr('name', 'alternativa[' + index + '][Numero]');
                            tr.find('input.texto').attr('name', 'alternativa[' + index + '][Texto]');
                            tr.find('input.correta').attr('name', 'alternativa[' + index + '][Correta]');
                            var letras = $('span.badge');
                            $(letras[index]).html(alfabeto[index]);
                        }
                        else
                        {
                            $(this).attr('name', 'Dica[' + index + '][Numero]');
                            tr.find('textarea.texto').attr('name', 'Dica[' + index + '][Texto]');
                        }
                    });
                },
                ordem: function(element)
                {
                    var tr = element.closest('tr');

                    switch (element.attr('data-direction'))
                    {
                        case 'up' :
                            var beforeTr = tr.prev();

                            if (typeof beforeTr.attr('class') === 'undefined')
                                return false;

                            var order = tr.find("input.numero").val(),
                                    orderPrev = beforeTr.find('input.numero').val();

                            tr.find("input.numero").val(orderPrev);
                            beforeTr.find('input.numero').val(order);
                            tr.insertBefore(beforeTr);
                            break;
                        case 'down':
                            var afterTr = tr.next();

                            if (typeof afterTr.attr('class') === 'undefined')
                                return false;

                            var order = tr.find('input.numero').val(),
                                    orderNext = afterTr.find('input.numero').val();

                            tr.find('input.numero').val(orderNext);
                            afterTr.find('input.numero').val(order);
                            tr.insertAfter(afterTr);
                            break;
                    }

                    if (element.closest('table').is('#alternativas'))
                    {
                        element.closest('table').find('tbody').find('span.badge').each(function(index, span)
                        {
                            $(this).html(alfabeto[index]);
                        });
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
                                window.WiAlert('success', 'Ordem das questões alterada com sucesso!');
                                //location.reload();
                            }
                            else
                            {
                                window.WiAlert('error', r.mensagem);
                            }
                        },
                        'json'
                    );
                },
                /*Caso o registro esteja sendo editado, */
                deleteItem: function(element)
                {
                    var tipo = element.closest('table').attr('id'), deletar;
                    deletar = confirm("Tem certeza que deseja deletar esta " + tipo.substr(0, tipo.length - 1) + '?');

                    if (!deletar)
                        return false;

                    if (element.closest('tr').find('input.id').val().length === 0)
                    {
                        actionsQuestoes.removeLine(element);
                        return false;
                    }

                    var i = tipo[0].toUpperCase();
                    tipo = i + tipo.substr(1, tipo.length - 2);
                    $.post(
                            '/questao/delete' + tipo + '/id/' + element.closest('tr').find('input.id').val(),
                            {},
                            function(r)
                            {
                                if (r.acao)
                                {
                                    actionsQuestoes.removeLine(element);
                                    location.reload();
                                }
                                else
                                {
                                    window.WiAlert('error', r.mensagem);
                                }
                            },
                            "json"
                            );
                },
                validate: function()
                {
                    /*
                     * Validar Dicas:
                     *  - É necessário ter no minimo uma dica relacionada a questão
                     */
                    var continuar = true, tbodyDicas = $("table#dicas tbody");

                    tbodyDicas.children("tr").each(function()
                    {
                        var dicaTxt = $.trim($(this).find("textarea").val());

                        if (dicaTxt.length === 0)
                        {
                            window.WiAlert('warning', 'O campo dica é obrigatório.');
                            $("#aba-dicas a").tab("show");
                            $(this).focus();
                            return continuar = false;
                        }
                    });

                    if (!continuar)
                        return false;
                    /*
                     * Validar Alternativas:
                     *  - É necessário no mínimo 2 alternativas.
                     *  - É preciso que uma esteja marcada como correta.
                     */

                    if ($("div.opcoes-tipo").find("input:checked").val() === "OBJ")
                    {

                        var tbodyAlternativas = $("table#alternativas tbody");

                        if (tbodyAlternativas.children("tr").length < 2)
                        {
                            window.WiAlert('warning', "Você precisa ter no mínimo duas alternativas.");
                            $("#aba-alternativas a").tab("show");
                            return false;
                        }

                        tbodyAlternativas.children("tr").each(function()
                        {
                            var id = $(this).find("textarea.texto").attr('id');
                            var alternativaTxt = $.trim(nicEditors.findEditor(id).getContent());

                            if (alternativaTxt.length === 0)
                            {
                                window.WiAlert('warning', "As alternativas são obrigatórias.");
                                $("#aba-alternativas a").tab("show");
                                $(this).focus();
                                return continuar = false;
                            }
                            else
                            {
                                $(this).find("textarea.texto").val(nicEditors.findEditor(id).getContent());
                            }
                        });

                        if (!continuar)
                            return false;

                        if (!tbodyAlternativas.find('input.correta').is(':checked'))
                        {
                            window.WiAlert('warning', "Você precisa informar qual alternativa é correta.");
                            $("#aba-alternativas a").tab("show");
                            return false;
                        }
                    }
                },
                deleteQuestao: function(element)
                {
                    var id = element.closest('tr').attr('data-id');
                    var deletar = confirm("Tem certeza que deseja deletar esta Questão?");

                    if (!deletar)
                        return false;

                    $.post(
                            element.attr('href'),
                            {},
                            function(r)
                            {
                                if (r.acao)
                                {
                                    window.WiAlert('success', 'Questão excluída com sucesso!');
                                    location.reload();
                                }
                                else
                                {
                                    window.WiAlert('error', r.mensagem);
                                }
                            },
                            "json"
                            );
                },
                status: function(element)
                {
                    $.post(
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
                            "json"
                            );
                }
            };

    /*Executa ações da questão.*/
    $(document).on('click', '[data-type="actionQuestao"]', function(e)
    {
        e.preventDefault();

        var element = $(this);

        switch (element.attr('data-action'))
        {
            case 'newAlternativa' :
                actionsQuestoes.newAlternativa(element);
                break;
            case 'newDica' :
                actionsQuestoes.newDica(element);
                break;
            case 'newMidia':
                actionsQuestoes.newMidia(element);
                break;
            case 'removeLineMidia':
                actionsQuestoes.removeLineMidia(element);
                break;
            case 'removeLine' :
                var url = window.location.href;

                if (url.indexOf('updateQuestao') === -1)
                    actionsQuestoes.removeLine(element);
                else
                    actionsQuestoes.deleteItem(element);
                break;
            case 'ordem' :
                actionsQuestoes.ordem(element);
                break;
            case 'deleteQuestao' :
                actionsQuestoes.deleteQuestao(element);
                break;
            case 'status' :
                actionsQuestoes.status(element);
                break;
            case 'saveOrdem':
                actionsQuestoes.saveOrdem(element);
                break;
        }
    });


});

function salvarQuestao(form, data, hasError)
{
    /**
     * Valida campo Enunciado
     */
    var enunciado = $.trim(nicEditors.findEditor('Questao_Texto').getContent());
    if(enunciado.length === 0 || enunciado === '<br>')
    {
        window.WiAlert("warning", "Você precisa preencher o enunciado.");
        return false;
    }
    /**
     * Valida a resposta caso o tipo da questão seja discursiva
     */
    var respostaDiscursiva = $.trim($('#Questao_Resposta').val());
    if(respostaDiscursiva.length === 0 && $("div.opcoes-tipo").find("input:checked").val() === "DIS")
    {
        window.WiAlert("warning", "Esta questão é discursiva, você precisa preencher a resposta.");
        return false;
    }
    /*
     * Validar Dicas:
     *  - É necessário ter no minimo uma dica relacionada a questão
     */
    /*var continuar = true, tbodyDicas = $("table#dicas tbody");

    tbodyDicas.children("tr").each(function()
    {
        var id = $(this).find("textarea.texto").attr("id");
        var dicaTxt = $.trim(nicEditors.findEditor(id).getContent());

        if (dicaTxt.length === 0 || dicaTxt === '<br>')
        {
            window.WiAlert("warning", "O campo dica é obrigatório.");
            $("#aba-dicas a").tab("show");
            $(this).focus();
            return continuar = false;
        }
        else
        {
            $(this).find("textarea.texto").val(nicEditors.findEditor(id).getContent());
        }
    });

    if (!continuar)
        return false;*/
    /*
     * Validar Alternativas:
     *  - É necessário no mínimo 2 alternativas.
     *  - É preciso que uma esteja marcada como correta.
     */

    if ($("div.opcoes-tipo").find("input:checked").val() === "OBJ")
    {
        var continuar = true;
        var tbodyAlternativas = $("table#alternativas tbody");

        if (tbodyAlternativas.children("tr").length < 2)
        {
            window.WiAlert("warning", "Você precisa ter no mínimo duas alternativas.");
            $("#aba-alternativas a").tab("show");
            return false;
        }

        tbodyAlternativas.children("tr").each(function()
        {
            var id = $(this).find("textarea.texto").attr("id");
            var alternativaTxt = $.trim(nicEditors.findEditor(id).getContent());

            if (alternativaTxt.length === 0 || alternativaTxt === '<br>' )
            {
                window.WiAlert("warning", "As alternativas são obrigatórias.");
                $("#aba-alternativas a").tab("show");
                $(this).focus();
                return continuar = false;
            }
            else
            {
                $(this).find("textarea.texto").val(nicEditors.findEditor(id).getContent());
            }
        });

        if (!continuar)
            return false;

        if (!tbodyAlternativas.find("input.correta").is(":checked"))
        {
            window.WiAlert("warning", "Você precisa informar qual alternativa é correta.");
            $("#aba-alternativas a").tab("show");
            return false;
        }
    }

    if (!hasError)
    {
        $("#Questao_Texto").val(nicEditors.findEditor("Questao_Texto").getContent());
        var form = jQuery("#questao-form");
        $.post(
                form.attr("action"),
                form.serialize() + "&saveAjax=true",
                function(r)
                {
                    window.WiAlert(r.s, r.m);

                    if(r.o.redirect)
                        window.location = r.o.redirect;
                },
                "json"
                );
    }
}
