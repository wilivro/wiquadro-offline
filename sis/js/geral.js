$(document).ready(function()
{
    //Ativa a aba do primeiro elemento que deu erro no formulário
    var errorMessage = $('.errorMessage');
    var aba = errorMessage.closest('.tab-pane');
    var abaId = aba.attr('id');
    
    var link = $('a[href=#'+abaId+']');
    
    if(link.length > 0)
    {
        link.click();
    }
    
    /*Validação formulário de cadastro*/

    $('#send-form-aluno').click(function(e)
    {
        e.preventDefault();
        var retorno = true;

        /*Valida se campos estão vazios*/
        $('[data-required="1"]').each(function()
        {
            var element = $(this), val = $.trim(element.val());

            if (val.length === 0 || val === '0')
            {
                element.tooltip({placement: 'bottom', title: 'Este campo precisa ser preenchido.'});
                element.tooltip('show');
                element.focus();
                destaqueErro(element);
                return retorno = false;
            }
        });
        
        /*Valida peculiaridades*/
        if(!retorno || !validaEmail($('#Aluno_Email')) || !validaData() || !validaSenha())
            return false;
        
        var form = $('#aluno-form');
        $('#mensagem').hide();
        $.post
        (
            form.attr('action'),
            form.serialize(),
            function(r)
            {
                if(r.status)
                {
                    if(r.redirect)
                        location.href = r.redirect;
                    else
                        window.WiAlert('success', 'Cadastro efetuado com sucesso!');
                }
                else
                {
                    Recaptcha.reload();
                    //var mensagem = $('<div>').addClass('alert alert-error').css('text-align', 'center').html('<h4>'+r.mensagem+'</h4>').show();
                    $('#mensagem').addClass('alert alert-error').html('<h4>' + r.mensagem + '</h4>').show();
                    $('html, body').animate({ scrollTop: 0 }, 'slow');
                }
            },
            'json'
        );        
    });
});

/*
 * Funções para validação dos campos do formulário de cadastro de aluno
 */

/*Retorna true caso o e-mail seja válido*/
function validaEmail(element)
{
    var filter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    if (!filter.test(element.val()))
    {
        element.tooltip({placement: 'bottom', title: 'Digite um e-mail válido.'});
        element.tooltip('show').focus();
        destaqueErro(element);
        return false;
    }
    
    return true;
}
/*Valida as informações da data de nascimento*/
function validaData()
{
    var ano = $('#Aluno_ano'), mes = $('#Aluno_mes'), dia = $('#Aluno_dia'), data = new Date();
    
    if(ano.val() >= data.getFullYear() || (data.getFullYear() - ano.val()) <= 6)
    {
        ano.tooltip({placement: 'bottom', title: 'Você precisa ter no mínimo 6 anos para criar sua conta.'});
        ano.tooltip('show');
        ano.focus();
        destaqueErro(ano);
        return false;
    }
    
    var valDia = parseInt(dia.val());
    var diasMes = parseInt(mes.children('option:selected').attr('data-dias'));
    
    if((valDia < 1) || valDia > diasMes)
    {
        dia.tooltip({placement: 'bottom', title: 'Informe uma data válida compatível com o mês selecionado.'});
        dia.tooltip('show');
        dia.focus();
        destaqueErro(dia);
        return false;
    }
    
    return true;
}
/*Valida a confirmação da senha*/
function validaSenha()
{
    var password = $('#Aluno_Senha'), confirmPassword = $('#Aluno_ConfirmarSenha');
    
    if(confirmPassword.val() !== password.val())
    {
        confirmPassword.tooltip({placement: 'bottom', title: 'Confirme sua senha.'}).tooltip('show').focus();
        destaqueErro([password, confirmPassword]);
        return false;
    }
    
    return true;
}
/*Destaca o campo que contem erros de validação*/
function destaqueErro(element)
{
    if(element instanceof Array)
    {
        for(var i = 0; i < element.length; i++)
        {
            element[i].css('border-color', '#b94a48')
                .css('-webkit-box-shadow', 'inset 0 1px 1px rgba(0, 0, 0, 0.075')
                .css('-moz-box-shadow', 'inset 0 1px 1px rgba(0, 0, 0, 0.075')
                .css('box-shadow', 'inset 0 1px 1px rgba(0, 0, 0, 0.075)');
        }
    }
    else
    {
        element.css('border-color', '#b94a48')
            .css('-webkit-box-shadow', 'inset 0 1px 1px rgba(0, 0, 0, 0.075')
            .css('-moz-box-shadow', 'inset 0 1px 1px rgba(0, 0, 0, 0.075')
            .css('box-shadow', 'inset 0 1px 1px rgba(0, 0, 0, 0.075)');
    }
} 