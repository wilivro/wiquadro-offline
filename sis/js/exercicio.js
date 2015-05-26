$(document).ready(function()
{

    var acoesExercicio =
    {
        dicas: function(element)
        {
            element.attr('disabled', true);
            var nDica = $('#qtdDicasPedidas').val() === '0' ? 0 : parseInt($('#qtdDicasPedidas').val());
            $.post
            (
                element.attr('href'),
                {qtdDicasPedidas: nDica},
                function(r)
                {
                    if (r.acao)
                    {
                        var dica = r.dica.Texto.replace(/(\r\n|\n\r|\r|\n)/g, "<br>");

                        var $dica = $("<div>").addClass('col-md-6 dica')
                            .append(
                                $("<div>")
                                    .append(
                                        $("<div>")
                                            .addClass("headerDica")
                                            .append($("<div>")
                                                    .addClass("headerDicaIcon")
                                                    .html("<i class='fa fa-question'></i>")
                                            )
                                            .append($("<div>")
                                                    .addClass("headerDicaText")
                                                    .html("DICA")
                                            )
                                    )
                                    .append(
                                        $("<div>")
                                            .addClass("dicaText")
                                            .html(dica)
                                    )
                            );

                        $('div.exibi-dicas').removeClass('hide').append($dica);
                        $('#qtdDicasPedidas').val(nDica+1);

                        var countDicas = parseInt($('#getDica').data('dicas'));
                        var dicasRestantes = countDicas - 1;
                        if (dicasRestantes > 0)
                        {
                            $('#getDica').data('dicas', dicasRestantes);
                            $('#getDica').text("Dicas Restantes: "+ dicasRestantes).change();
                        }
                        else
                        {
                            $('#getDica').text("Acabaram as dicas").change();
                            $('#midia').removeClass('hide');
                        }

                        if(r.dica.tipoQuestao !== 'DIS_POS' || dicasRestantes === 0)
                            $('#getDica').attr('disabled', true);
                        else
                            $('#getDica').attr('disabled', false);
                    }
                    else
                    {

                    }
                },
                'json'
                );
        },
        resposta: function(element)
        {
            var resultado = $('#resultado'),
                $formResposta = $('#form-resposta'),
                $labelChecked = $formResposta.find('input:radio:checked').parent();

                resultado.attr('class', '');
                resultado.html('');
            $.post
            (
                $formResposta.attr('action'),
                $formResposta.serialize(),
                function(r)
                {
                    if(r.type == "respondida"){
                        window.WiAlert('warning', r.mensagem);
                        return;
                    }
                    if (r.acao)
                    {
                        $labelChecked.css('color', '#3C763D');
                        resultado.fadeIn(200);
                        var $icon = $("<i>")
                                .addClass("fa fa-smile-o")
                                .css({
                                    color:"#3C763D",
                                    fontSize:"72px"
                                })
                            //resultado.addClass('alert alert-danger');
                            resultado
                                .css({
                                    textAlign:"center"
                                })
                                .prepend($icon);

                        if(r.type && r.type === 'questao_pos')
                            resultado.html("<h3>"+r.mensagem+"</h3>");
                        else
                            resultado.prepend("<h4 style='color:#3C763D'>MUITO BOM!</h4>");

                        $('#form-resposta input[type="radio"]').attr('disabled', true).off();
                        $('#verifyResposta').off();
                        $('#Resposta, #confirmAnswer, #getDica').attr('disabled', true);
                        $('#midia').removeClass('hide');
                        window.location.hash = 'midias';
                        $('a.acaoAlternativa').remove();
                        
                        if(r.finished)
                        {
                            $('#publishFacebook').modal('show');
                        }
                    }
                    else
                    {
                        if(r.type === 'sql')
                            window.WiAlert('error', r.mensagem);
                        else
                        {
                            if(r.mensagem)
                                window.WiAlert('warning', r.mensagem);
                            $labelChecked.css('color', '#A94442');
                            resultado.fadeIn(200);

                            var $icon = $("<i>").addClass("fa fa-frown-o").css({color:"#A94442",fontSize:"72px"});
                            resultado.css({textAlign:"center"}).prepend($icon).prepend("<h4 style='color:#A94442'>TENTE OUTRA VEZ!</h4>");
                            $formResposta.find('input:radio:checked').attr('disabled', true);
                            element.attr('disabled', false);
                        }
                        
                    }
                    window.location.href = "#resultado";
                },
                'json'
            );
        }
    };

    $('#confirmAnswer').on('click', function(){
        
        $(this).attr('disabled', true);
        $('#getDica').removeAttr('disabled');
        var $answer = $('#form-resposta input[type="radio"]:checked');
        
        if($answer.is(':disabled'))
        {
            window.WiAlert('warning', 'Responda a questão.');
            $(this).attr('disabled', false);
            return false;
        }
        
        if(!$answer.length)
        {
            $answer = $.trim($('#Resposta').val());
        }

        if($answer.length)
        {
            acoesExercicio.resposta($(this));
        }else
        {
            window.WiAlert('warning', 'Responda a questão.');
            $(this).attr('disabled', false);
        }



    });

    $('#getDica').on('click', function(e)
    {
        e.preventDefault();
        acoesExercicio.dicas($(this));
    });

    $('#nextQuestao').click(function(e)
    {
       e.preventDefault();
       //Liberado para passar para uma próxima questão mesmo sem ter feito a atual
       //if($('#form-resposta input[type="radio"]').is(':disabled') || $('#Resposta').is(':disabled'))
           window.location = $(this).attr('href');
    });



    var Exercicio = (function()
    {
        var $modalConteudoAssociado = $('#modalConteudoAssociado'),
            $bodyModal = $modalConteudoAssociado.find('.modal-body');

        var showConteudoAssociado = function(e)
        {
            //console.log(e.relatedTarget);
            var $a = $(e.relatedTarget), $container = $a.closest('.containerConteudo'), $body = $modalConteudoAssociado.find('.modal-body'), conteudo;

            switch($a.data('tipo'))
            {
                case 'TEXT' :
                    conteudo = $container.find('.textoConteudo').html();
                    console.log($container);
                    $body.html(conteudo);
                break;
                case 'VIDEO' :
                    conteudo = $container.find('.urlConteudo').html();
                    showVideo(conteudo);
                break;
                case 'AUDIO' :
                    var gg = $container.find('.urlConteudo').html();
                    var isHttp = gg.substr(0, 7);
                    if(isHttp !== 'http://')
                        gg = 'http://'+gg;
                    conteudo = gg;
                    showAudio(conteudo);
                break;
                default :
                    var gg = $container.find('.urlConteudo').html();
                    var isHttp = gg.substr(0, 7);
                    if(isHttp !== 'http://')
                        gg = 'http://'+gg;
                    conteudo = $('<iframe></iframe>');
                    conteudo.attr('src',  gg);
                    conteudo.attr('style', 'width:100%; height:100%');
                    $body.html(conteudo);
                break;
            }
        };

        var showVideo = function(conteudo)
        {
            conteudo = $.trim(conteudo);
            var iframe = '<iframe width="100%" height="400px" src="'+conteudo+'"></iframe>';
            
            $modalConteudoAssociado.find('.modal-body').html(iframe);
        };

        var showAudio = function(conteudo)
        {
            var audio = $('<audio></audio>');
            audio.attr('src', conteudo);
            audio.attr('controls', 'controls');
            $modalConteudoAssociado.find('.modal-body').html(audio);
        };

        var resetModal = function()
        {
            $bodyModal.html('');
        };

        var discardAnswer = function(e)
        {
            e.preventDefault();
            
            var $self = $(this), idAlunoTurma = $('#IdAlunoTurma').val(),
                idAlternativa = $self.closest('.row').find('.radio>:radio').val(),
                acaoAlternativa = $self.data('acao'), opacity;
            
            if($self.data('acao') === 'D')
            {
                if($('.acaoAlternativa:visible').length > 1)
                {
                    opacity = 0.5;
                    $self.data('acao', 'R').attr('data-original-title', 'Reverter ação').find('i').removeClass('fa-trash-o').addClass('fa-history');
                }
            }
            else
            {
                opacity = 1;
                $self.data('acao', 'D').attr('data-original-title', 'Descartar alternativa').find('i').removeClass('fa-history').addClass('fa-trash-o');
            }
            
            $.ajax({
                url: '/plataforma/acaoAlternativa',
                data: {idAlunoTurma: idAlunoTurma, idAlternativa: idAlternativa, acaoAlternativa: acaoAlternativa},
                type: 'post',
                success: function (data)
                {
                    if(data.length === 0)
                        return;
                    
                    window.WiAlert('warning', data.mensagem);
                    $('.acaoAlternativa').remove();
                },
                dataType: 'json'
            });
            
            $self.closest('.row').find('.radio').css({opacity: opacity});
            
            $self.tooltip();
        };

        return {
            init : function()
            {
                $modalConteudoAssociado.on('show.bs.modal', showConteudoAssociado);
                //$('.showConteudo').on('click', showConteudoAssociado);
                $modalConteudoAssociado.on('hide.bs.modal', resetModal);
                $('.showTooltip').tooltip({placement: 'right'});
                $('.acaoAlternativa').on('click', discardAnswer);

            }
        };
    })();

    Exercicio.init();
});
