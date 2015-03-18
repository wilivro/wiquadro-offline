/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function()
{
    var Formulario = (function()
    {
        var $clientes = $('#Formulariodinamico_IdCliente'),
            $projetos = $('#Formulariodinamico_IdProjeto'),
            optionDefault = $('<option value="0">Todos</option>'),
            checkboxDefault = $('<input type="checkbox" class="form-control" name="disciplina[]" style="height: 20px; margin: -2px 3px 0 0" />'), 
            $disciplinas = $('#disciplinas');
            
        var getProjetos = function()
        {
            $.post(
                '/projeto/getAllByCliente/idCliente/'+$clientes.val(),
                {},
                function(resposta)
                {
                    var spanSelectCuston = $('.SelectProjeto span.customSelectInner'),
                        idprojeto = $projetos.attr('data-id-atual'),
                        option = $('<option>');
                
                    $projetos.find('option').remove();
                    $projetos.append(optionDefault);
                    spanSelectCuston.text('Todos');
                    
                    $.each(resposta.o.projetos, function(id, nome)
                    {
                        option.text(nome).val(id);
                        var newOption = option.clone();
                        $projetos.append(newOption);
                        
                        if(idprojeto === id)
                        {
                            newOption.attr('selected', true);
                            spanSelectCuston.text(nome);
                        }
                    });
                    
                    getDisciplinas();
                },
                'json'
            );
        };
        
        var getDisciplinas = function()
        {
            $disciplinas.html('');
            
            if($projetos.val() === '0')
                return;
            
            var $idFormulario = $('#Formulariodinamico_Id');
            $.post(
                '/formulario/getProjetoDisciplinas/idprojeto/'+$projetos.val(),
                {
                    formulario : $idFormulario.val()
                },
                function(resposta)
                {
                    if(resposta.o)
                    {
                        $disciplinas.html('<p>Selecione a baixo os cursos em que deseja que este formulário seja obrigatório.</p>');
                        $.each(resposta.o, function(id, disciplina)
                        {
                            var div = $('<div style="margin:0 3px 0 0">');
                            var divcheckbox = div.clone();
                            divcheckbox.addClass('checkbox btn btn-default');
                            var $span = $('<label>');
                            var $input = checkboxDefault.clone();
                            
                            if(disciplina.Assoc && disciplina.Assoc === $idFormulario.val())
                            {
                                $input.attr('checked', true);
                                divcheckbox.attr('class', 'checkbox btn alert-success');
                            }
                            
                            $input.val(disciplina.Id);
                            $span.html($input).append(disciplina.Titulo);
                            divcheckbox.html($span);
                            $disciplinas.append(divcheckbox);
                        });
                    }
                    else
                    {
                        $disciplinas.html(resposta.m);
                    }
                    
                    $('div#disciplinas input[type="checkbox"]').on('change', checkCheckbox);
                },
                'json'
            );
        };
        
        var checkCheckbox = function()
        {
            var $check = $(this);
            
            if($check.is(':checked'))
                $check.closest('div').attr('class', 'checkbox btn alert-success');
            else
                $check.closest('div').attr('class', 'checkbox btn btn-default');
        };
        
        return {
            init: function()
            {
                getProjetos();
                
                $clientes.on('change', getProjetos);
                $projetos.on('change', getDisciplinas);
            }
        };
    })();
    
    Formulario.init();
});