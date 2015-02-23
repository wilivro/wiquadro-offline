$(document).ready(function()
{
    var ProvaTurma = (function()
    {
        var $modalAddProva = $('#modalAddProva'),
            $btnAddProva = $('.addprova'),
            $formAddProva = $('#form-provaturma'),
            $editar = $('.editar'),
            $inputPeso = $('input.peso'),
            $openModalGerarProvaAlunos = $('.btnOpenModalGerarProvaAlunos'),
            $gerarProvaAlunos = $('#btnGerarProvaAlunos'),
            $modalGerarProvaAlunos = $('#modalGerarProvaAlunos');

        var showForm = function(e)
        {
            e.preventDefault();
            $modalAddProva.modal('show');
        };

        var saveProvaturma = function(e)
        {
            e.preventDefault();
            
            var $inputProva = $('#Provaturma_IdProva'), $inputTentativas = $('#Provaturma_Tentativas');
            
            if((!$inputProva.is(':disabled') && !$inputProva.val()) || $inputTentativas.val().length === 0)
            {
                $formAddProva.find('.required').css('border-color', '#d9534f');
                window.WiAlert('error', 'Preencha todos os campos obrigatórios');
                return false;
            }
            
            $.post(
                $formAddProva.attr('action'),
                $formAddProva.serialize(),
                function(resposta)
                {
                    window.WiAlert(resposta.s, resposta.m);

                    if(resposta.s === 'success')
                        location.reload();
                },
                'json'
            );
        };

        var getForEdit = function(e)
        {
            e.preventDefault();
            var $a = $(this);
            $.post(
                $a.attr('href'),
                {},
                function(resposta)
                {
                    if(resposta.s === 'success')
                        setProvaTurma(resposta.o);
                    else
                    {
                        window.WiAlert(resposta.s, resposta.m);
                    }
                },
                'json'
            );
        };

        var setProvaTurma = function($dados)
        {
            $('#Provaturma_IdProva').attr('disabled', true).hide();
            $('#showProvaSelected').html($dados.Prova).removeClass('hidden');

            $.each($dados, function(index, val)
            {
                $('#Provaturma_'+index).val(val);
            });

            $btnAddProva.click();
        };

        var resetForm = function()
        {
            $('#Provaturma_IdProva').attr('disabled', false).show();
            $('#showProvaSelected').html('').addClass('hidden');
            $formAddProva.find(':input').not('#Provaturma_IdTurma').val('');
        };

        var isVazio = function()
        {
            var $input = $(this);

            if($input.val().length === 0)
                $input.css('border-color', '#d9534f');
            else
                $input.css('border-color', '#e8e7e3');

        };

        var savePeso = function()
        {
            var $input = $(this);

            if($input.attr('data-peso') == $input.val() || !validatePeso($input))
                return false;

            $.post(
                '/provaturma/savepeso',
                {
                    Id : $input.data('idprovaturma'),
                    Peso : $input.val()
                },
                function(resposta)
                {
                    if(resposta.s === 'error')
                    {
                        window.WiAlert('error', resposta.m);
                        $input.css('border-color', '#d9534f');
                        return;
                    }

                    $input.attr('data-peso', $input.val());
                },
                'json'
            );
        };

        var validatePeso = function($input)
        {
            var totalPeso = 0, isValido = true;

            $inputPeso.css('border-color', '#e8e7e3');

            $inputPeso.each(function(index)
            {
                var peso = parseInt($(this).val());
                totalPeso += peso;

                if(totalPeso > 10)
                {
                    $input.val('0').css('border-color', '#d9534f');
                    window.WiAlert('error', 'A soma dos pesos de todas as provas não pode passar de 10.');
                    isValido = false;
                    return;
                }
            });

            return isValido;
        };

        var onClickOpenModalGerarProvaAlunos = function(e){
            e.preventDefault();

            var url = $(this).attr('href');

            $.ajax({
                type: 'get',
                url: url,
                dataType: 'html'
            }).done(function(data){
                $modalGerarProvaAlunos.find('.modal-body').html(data);
                $modalGerarProvaAlunos.modal('show');
            });
        },
        onClickGerarProvaAlunos = function(e){
            var $alunos = $('#modalGerarProvaAlunos').find('.alunoIdCheckbox:checked:enabled'),
                $self = $(this);

            if($alunos.length)
            {
                $self.attr('disabled', true);

                var alunoturma = [],
                    provaTurmaId = $('#provaTurmaId').val();
                $.each($alunos, function(){
                    alunoturma.push($(this).val());
                });

                $.ajax({
                    type: 'post',
                    data: {provaTurmaId: provaTurmaId, alunosTurma: alunoturma},
                    url: '/provaturma/registraralunoprovas',
                    dataType: 'json'
                }).done(function(data){
                    var type = (data.success === true) ? 'success' : 'warning';
                    window.WiAlert(type, data.message);
                    $self.attr('disabled', false);
                    $modalGerarProvaAlunos.modal('hide');
                });
            }else
            {
                window.WiAlert('warning', 'Selecione o(s) aluno(s).');
            }
        };

        return{
            init: function()
            {
                $('.date').mask('99/99/9999');
                $openModalGerarProvaAlunos.on('click', onClickOpenModalGerarProvaAlunos);
                $gerarProvaAlunos.on('click', onClickGerarProvaAlunos);
                $btnAddProva.on('click', showForm);
                $modalAddProva.on('hidden.bs.modal', resetForm);
                $formAddProva.on('submit', saveProvaturma);
                $editar.on('click', getForEdit);
                $formAddProva.find('.required').on('blur', isVazio);
                $inputPeso.on('blur', savePeso);
            }
        };
    })();

    ProvaTurma.init();
});
