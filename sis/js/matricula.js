$(document).ready(function()
{
    var $form = $('#checkCodigo');
    var $baseTurma = $('#baseTurma');
    var $labelTurmas = $('#labelTurmas');
    var $body = $('body');
        
    var Matricula = (function()
    {
        var checkCodigo = function(e)
        {
            e.preventDefault();
            
            $.post($form.attr('action'), $form.serialize(),
            function(r)
            {

                if(!r.acao)
                {
                    window.WiAlert('error', r.mensagem);
                    //location.reload();
                    return false;
                }

                showturmas(r.turmas);
            },
            'json');
        };
        
        var showturmas = function(turmas)
        {
            $labelTurmas.show();
            //$baseTurma.show();

            $('div.turma').remove();
            
            $.each(turmas, function(i, turma)
            {
                console.log(turma);

                var capacidade = "";
                if(turma.Capacidade==="0"){
                    capacidade = "";
                }
                else{
                    capacidade = "de "+ turma.Capacidade;  
                } 
                var $divPai = $baseTurma.clone();
                $divPai.removeAttr('style');
                $divPai.find('a').attr('data-id', turma.Id);
                $divPai.find('.titulo').html(turma.Nome+' - '+turma.DiscTitulo);
                $divPai.find('.escola').html(turma.ENome);
                $divPai.find('.horario').html(turma.Horario);
                $divPai.find('span.professor').html(turma.Professor);
                $divPai.find('.qtdAlunos').prepend($("<span>").text(turma.qtdAlunos)).append($("<span>").text(capacidade))
                $divPai.removeClass('hide').addClass('turma').attr('id', '');
               
                $('#baseTurma').after($divPai);
            });
        };
        
        var validateCodigo = function(e)
        {
            e.preventDefault();
            var $a = $(this);
            $.post($a.attr('href'), {idturma : $a.attr('data-id'), codigo : $('#codigo').val()},
            function(r)
            {
                if(!r.acao)
                {
                    window.WiAlert('error', r.mensagem);
                }else
                {
                    window.WiAlert('success', "Matrícula Realizada com sucesso!");
                    location.href = '/plataforma/cursos';
                }

                
            },
            'json');
        };
       
        var resetModal = function()
        {
            var $modal = $(this);
            $modal.find('.turma').remove();
            $modal.find('#labelTurmas').hide();
            $modal.find('form')[0].reset();
            
        };

        var hideElements = function(){
            $labelTurmas.hide();
            $baseTurma.hide();
        };
        
        return{
            init : function()
            {
                hideElements();

                $form.on('submit', checkCodigo);
                $body.on('click', 'a.matricular', validateCodigo);
                $body.on('hide', resetModal);
            }
        }
    })();
    
    Matricula.init();
});