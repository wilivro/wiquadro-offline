/**
 * Created by David Figueiredo on 17/04/14.
 */

var cartoes;

$(document).ready(function()
{
    cartoes = (function()
    {
        var $modalCartoes = $('#modalGeraCartoes');
        var $disciplinas = $('#Cartoes_IdDisciplina');
        var $projetos = $('.projeto');
        var $clientes = $('.cliente');
        var $sendCardByEmailButton = $('.sendCardByEmailButton');
        var $modalSendCardByEmail = $('#modalSendCardByEmail');
        var $emailTextField = $('#email');
        var $cardIdHiddenField = $('#cartaoid');
        var $sendEmailButton = $('#sendEmailButton');
        var $formFiltercards = $('#filterCards');
        var $exportarCartaoButton = $('.exportarCartaoButton');
        var queryString;

        var getDisciplinas = function()
        {
            var $projeto = $(this), idprojeto = $projeto.val(),
                $alvo = $projeto.closest('form').find('select.disciplina');

            if($projeto.val() == 0)
            {
                setTodos($alvo);
                return false;
            }

            $.post('/cartoes/getdisciplinas/idprojeto/'+idprojeto,{},
            function(data){
                showDisciplinas(data, $alvo);
            },'json').done(function()
            {
                if(queryString.iddisciplina != '0')
                {
                    var disciplina = $formFiltercards.find('.disciplina');
                    disciplina.val(queryString.iddisciplina);
                    disciplina.change();
                }
            });
        };

        var getProjetos = function()
        {
            var $cliente = $(this), $alvo = $cliente.closest('form').find('select.projeto');
            var projeto = $formFiltercards.find('.projeto');

            if($cliente.val() == 0)
            {
                setTodos($alvo);
                projeto.change();
                return false;
            }

            $.post('/cartoes/getprojetos/idcliente/'+$cliente.val(),{},
            function(data){
                showProjetos(data, $alvo);
            },'json').done(function()
            {
                if(queryString.idprojeto && queryString.idprojeto != '0')
                {
                    projeto.val(queryString.idprojeto);
                    projeto.change();
                }
            });
        };

        var setTodos = function($alvo)
        {
            $alvo.html('').attr('disabled',true);
            var $option = $('<option>');
            $option.val(0).html('Todos...').attr('selected', true);
            $alvo.html($option).attr('disabled',false);
            $alvo.next('span.customSelect').find('.customSelectInner').text('Todos...');
        };

        var showProjetos = function(data, $alvo)
        {
            $alvo.html('').attr('disabled',true);
            var $option;
            if($alvo.closest('form').attr('id') === 'filterCards' && data.projetos.length > 1)
            {
                $option = $('<option>');
                $option.val(0).html('Todos...');
                $alvo.append($option);
            }

            if(!data.acao || data.projetos.length === 0)
            {
                if(typeof data.mensagem !== 'undefined')
                    window.WiAlert('error', data.mensagem);
                return false;
            }

            //console.log(data.projetos);

            $.each(data.projetos, function(key,nome)
            {
                $option = $('<option>');
                $option.val(key).html(nome);
                $alvo.append($option).attr('disabled',false);
            });

            $alvo.change();
        };

        var showDisciplinas = function(data, $alvo)
        {
            $alvo.html('').attr('disabled',true);
            var $option;
            if($alvo.closest('form').attr('id') === 'filterCards' && data.disciplinas.length > 1)
            {
                $option = $('<option>');
                $option.val(0).html('Todas...');
                $alvo.append($option);
            }

            if(!data.acao || data.disciplinas.length === 0)
            {
                if(typeof data.mensagem !== 'undefined')
                    window.WiAlert('error', data.mensagem);

                return false;
            }
            //console.log(data.disciplinas);
            $.each(data.disciplinas, function(key,obj)
            {
                $option = $('<option>');
                $option.val(obj.Id).html(obj.Titulo);
                $alvo.append($option).attr('disabled',false);
            });
        };

        var gerarCartoes = function(form, data, hasError)
        {
            var $form = $(form);
            $.post($form.attr('action'),$form.serialize(),_gerarCartoes,'json');
        };

        var _gerarCartoes = function(r)
        {
            if(!r.acao)
            {
                window.WiAlert('error', r.mensagem);
                return false;
            }

            window.WiAlert('success', "Cartões gerados com sucesso.");
            location.reload();
        };

        var changeAtivo = function(e)
        {
            e.preventDefault();
            var $a = $(this);

            $.post($a.attr('href'),{},
            function(r)
            {
                if(!r.acao)
                {
                    window.WiAlert('error', r.mensagem);
                    return false;
                }

                location.reload();
            },'json');
        };

        var sendCardByEmail = function(){
            if(window.confirm('Confirma o envio do cartão por e-mail?'))
            {
                var email = $emailTextField.val();
                var cardId = $cardIdHiddenField.val();

                if(email === '')
                {
                    window.WiAlert('warning', "O campo de e-mail não pode ser vazio.");
                }else
                {
                    $.ajax({
                        type: 'post',
                        beforeSend: function(){
                            $emailTextField.after('<span class="help-block">Enviando...</span>');
                            $sendEmailButton.attr('disabled', true);
                        },
                        data: {email: email, cardId: cardId},
                        url: '/cartoes/enviarCartaoPorEmail'
                    }).done(function(message){
                        if(message)
                        {
                            $emailTextField.next('span.help-block').remove();
                            $sendEmailButton.attr('disabled', false);
                            window.WiAlert('success', message);
                            location.reload();
                        }
                    }).fail(function(object){
                        if(object)
                        {
                            $emailTextField.next('span.help-block').remove();
                            $sendEmailButton.attr('disabled', false);
                            window.WiAlert('error', object.responseText);
                        }
                    });


                }
            }
        };

        var openModalSendCardByEmail = function(cardId){
            $emailTextField.val('');
            $cardIdHiddenField.val(cardId);
            $modalSendCardByEmail.modal('show');
        };

        var onClickSendCardByEmailButton = function(e){
            e.preventDefault();
            var cardId = $(this).attr('href');
            openModalSendCardByEmail(cardId);
        };

        var onClickSendEmailButton = function(){
            sendCardByEmail();
        };

        var initFiltro = function()
        {
            queryString = function()
            {
                var querys = [];

                location.search.substring(1).split('&').forEach(function(query){
                    var q = query.split('=');
                    querys[q[0]] = q[1];
                });

                return querys;
            }();

            if(queryString.idcliente != '0')
            {
                var cliente = $formFiltercards.find('.cliente');
                cliente.val(queryString.idcliente);
                cliente.change();
            }

            if(queryString.status != '0')
            {
                var status = $formFiltercards.find('.status');
                status.val(queryString.status);
            }

            if(queryString.datauso != '0')
            {
                var datauso = $formFiltercards.find('.datauso');
                datauso.val(queryString.datauso);
            }

        };

        var gerarRelatorioEmExcel = function(campos, cartoes){

        };

        return {
            init : function()
            {
                $clientes.on('change', getProjetos);
                $projetos.on('change', getDisciplinas);
                $sendCardByEmailButton.on('click', onClickSendCardByEmailButton);
                $sendEmailButton.on('click', onClickSendEmailButton);
                $('.viewCartoes').on('click', 'a.changeAtivo', changeAtivo);
                $('#Cartoes_IdCliente').change();

                $exportarCartaoButton.on('click', function(e){
                    e.preventDefault();

                    if($('#cartaoCodigoCheckbox').val())
                    {
                        $('#exportarCartaoForm').submit();
                    }else
                    {
                        window.WiAlert('warning', 'Selecione cartões para exportar.');
                    }
                });

                $('#modalExportarExcel').on('show.bs.modal', function(){
                    var $cartoes = $('.cartaoCodigoCheckbox:checked'), cartoesIds = [], $codigosCartao = $('#cartaoCodigoCheckbox');
                    $codigosCartao.val('');

                    $cartoes.each(function(){
                        cartoesIds.push($(this).val());
                    });

                    $codigosCartao.val(cartoesIds.join(','));
                });

                initFiltro();

            },
            gerarCartoes: gerarCartoes
        };
    })();

    cartoes.init();
});
