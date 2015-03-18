/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var Campos;

$(document).ready(function()
{
    Campos = (function()
    {
        var $btnNovo = $('#novoCampo');
        var $ulCampos = $('#campos');
        var $li = $('<li></li>').addClass('newCampo');
        var $divsParaClonar = $('#divsParaClonar');
        
        var mostrarNovoCampo = function(e)
        {
            e.preventDefault();
            var $liClone = $li.clone();
            var $configCampo = $divsParaClonar.find('.ConfigCampo').clone();
            var ordem = $ulCampos.children('li').length + 1;
            $configCampo.find('input.ordem').val(ordem);
            $liClone.html($configCampo);
            $ulCampos.append($liClone);
            init();
        };
        
        var newFieldMult = function($element)
        {
            var Mult =  $divsParaClonar.find('.Mult').clone();
            var $input = Mult.find('input');
            if($element.closest('li').find('ul.opcoes').length === 0)
            {
                $element.closest('li').find('div.extras').html(Mult);
                Mult.find('.addOpcao').on('click', addOpcao);
                init();
            }
        };
        
        var newFieldText = function($element)
        {
            var Text =  $divsParaClonar.find('.Text').clone();
            $element.closest('li').find('div.extras').html(Text);
        };
        
        var newFieldTextarea = function($element)
        {
            var Textarea =  $divsParaClonar.find('.Textarea').clone();
            $element.closest('li').find('div.extras').html(Textarea);
        };
        
        var changeTipoPergunta = function(e)
        {
            var $element = $(this);
            
            switch($element.val())
            {
                case '2':
                    newFieldTextarea($element);
                break;
                case '3':
                    newFieldMult($element);
                break;
                case '4':
                    newFieldMult($element);
                break;
                case '5':
                    newFieldMult($element);
                break;
                default:
                    newFieldText($element);
                break;
            }
        };
        
        var addOpcao = function()
        {
            var $lista = $(this).next();
            var ordem = $lista.find('li').length + 1;
            var $li = $lista.find('li:first').clone().appendTo($lista);
            var $input = $li.find('input');
            $input.val('').attr('data-ordem', ordem).attr('placeholder', 'Digite a opção '+ordem);
            
            $('.deleteOpcao').on('click', deleteOpcao);
        };
        
        var deleteOpcao = function()
        {
            var $element = $(this);
            var $lista = $element.closest('ul');
            if($lista.find('li').length > 1)
                $element.closest('li').remove();
            
        };
        
        var saveForm = function(e)
        {
            e.preventDefault();
            var data = serializeCampos();
            var disciplinas = serializeDisciplinas();
            var geral = serializeGeral();
            
            if(!data)
                return false;
            
            $.post(
                '/formulario/saveForm/idform/'+$('#Formulariodinamico_Id').val(),
                {
                    campos: data,
                    geral: geral,
                    disciplinas: disciplinas
                },
                function(r)
                {
                    if(r.s === 'ok')
                    {
                        window.WiAlert('success', 'Formulário salvo com sucesso!');
                        location.reload();
                    }
                    else
                    {
                        window.WiAlert('error', r.m);
                        return false;
                    }
                },
                'json'
            );
        };
        
        var serializeGeral = function()
        {
            var geral = {}, $divGeral = $('#InfoGeral');
            
            geral.Id = $divGeral.find('#Formulariodinamico_Id').val();
            geral.Nome = $divGeral.find('#Formulariodinamico_Nomw').val();
            geral.IdUsuario = $divGeral.find('#Formulariodinamico_IdUsuario').val();
            geral.IdCliente = $divGeral.find('#Formulariodinamico_IdCliente').val();
            geral.IdProjeto = $divGeral.find('#Formulariodinamico_IdProjeto').val();
            geral.IdGrupoUsuario = $divGeral.find('#Formulariodinamico_IdGrupoUsuario').val();
            
            return geral;
        };
        var serializeDisciplinas = function()
        {
            var disciplinas = {};
            $('#disciplinas input').each( function(i, disciplina){
                disciplina = $(disciplina);
                
                if(disciplina.is(':checked'))
                    disciplinas[i] = disciplina.val();
            });
            
            return disciplinas;
        };
        
        var serializeCampos = function()
        {
            var campos = {}, $ul = $('#campos');
            //Validação do campos
            if($ul.find(':input[value=""]').not('.id').length > 0)
            {
                window.WiAlert('warning', "Todos os campos precisam ser preenchidos.");
                return false;
            }
            
            $ul.find('li.newCampo').each(function(i, li)
            {
                var campo = {}, opcoesCampo = {}, li = $(li);
                
                campo.Id = li.find('input.id').val();
                campo.Ordem = li.find('input.ordem').val();
                campo.Label = li.find('input.titulo').val();
                campo.Tipo = li.find('select.tipoPergunta').val();
                if(li.find('input.obrigatorio').is(':checked'))
                    campo.Obrigatorio = 'T';
                else
                    campo.Obrigatorio = 'F';
                
                li.find('input.opcao').each(function(h, opcao)
                {
                    opcao = $(opcao);
                    opcoesCampo['opcao'+h] = opcao.val();
                });
                campo.Opcoes = opcoesCampo;
                            
                campos['campo'+i] = campo;
            });
            
            return campos;
        };
        
        var reordenar = function()
        {
            $ulCampos.find('li.newCampo').each(function(i, li)
            {
                $(li).find('input.ordem').val(i+1);
            });
        };
        
        var deletarCampo = function(e)
        {
            e.preventDefault();
            var $a = $(this), $li = $a.closest('li');
            
            var excluir = confirm('Tem certeza que deseja excluir esse campo?');
            
            if(!excluir)
                return false;
            
            if($li.find('input.id').val().length === 0)
            {
                $li.remove();
                return true;
            }
            
            $.post(
                '/formulario/deleteCampo/idcampo/'+$li.find('input.id').val(),
            {},
            function(r)
            {
                if(r.s === 'ok')
                {
                    location.reload();
                }
                else
                {
                    window.WiAlert('error', r.m);
                    return false;
                }
            },
            'json');
            
        };
        
        var copyCampo = function(e)
        {
            e.preventDefault();
            var $li = $(this).closest('li').clone(), qtdLi = $ulCampos.find('li').length;
            $li.find('input.id').val('');
            $li.find('input.ordem').val(qtdLi + 1);
            $ulCampos.append($li);
            $li.find('input.titulo').focus();
        };
        
        var init = function()
        { 
            $('#campos li.newCampo').on('change', 'select.tipoPergunta', changeTipoPergunta);
            $('.deleteOpcao').on('click', deleteOpcao);
            $('ul.opcoes').sortable();
            $('a.deleteCampo').on('click', deletarCampo);
            $('a.copyCampo').on('click', copyCampo);
        };
        
        return{
            init: function()
            {
                $btnNovo.on('click', mostrarNovoCampo);
                $('.addOpcao').on('click', addOpcao);
                $ulCampos.sortable(
                {
                    stop: function(event, ui)
                    {
                        reordenar();
                    }
                });
                $('#saveForm').on('click', saveForm);
                init();
            }
        };
    })();
    
    Campos.init();
});