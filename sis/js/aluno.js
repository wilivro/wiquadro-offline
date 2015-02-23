$(function(){
    var Aluno = (function(){
        var $projeto = $('#projeto'),
            $cliente = $('#cliente'),
            $disciplina = $('#disciplina'),
            $turma = $('#turma');

        var onChangeProjeto = function(){
                var projetoId = $(this).val();

                $disciplina.html('<option value="">Todas</option>').get(0).selectedIndex = 0;
                $disciplina.next('span.customSelect').find('.customSelectInner').text('Todas');

                $turma.html('<option value="">Todas</option>').get(0).selectedIndex = 0;
                $turma.next('span.customSelect').find('.customSelectInner').text('Todas');

                if(projetoId)
                {
                    $.ajax({
                        type: 'post',
                        url: '/aluno/getDisciplinaFromProjeto',
                        data: {projetoId: projetoId},
                        dataType: 'json'
                    }).done(function(data){
                        $.each(data, function(index, itemData){
                            $disciplina.append('<option value="' + index + '">' + itemData + '</option>');
                        });
                    });
                }
            },
            onChangeCliente = function(){
                var clienteId = $(this).val();

                $projeto.html('<option value="">Todos</option>').get(0).selectedIndex = 0;
                $projeto.next('span.customSelect').find('.customSelectInner').text('Todos');

                $disciplina.html('<option value="">Todas</option>').get(0).selectedIndex = 0;
                $disciplina.next('span.customSelect').find('.customSelectInner').text('Todas');

                $turma.html('<option value="">Todas</option>').get(0).selectedIndex = 0;
                $turma.next('span.customSelect').find('.customSelectInner').text('Todas');

                if(clienteId)
                {
                    $.ajax({
                        type: 'post',
                        url: '/aluno/getProjetoFromCliente',
                        data: {clienteId: clienteId},
                        dataType: 'json'
                    }).done(function(data){
                        $.each(data, function(index, itemData){
                            $projeto.append('<option value="' + index + '">' + itemData + '</option>');
                        });
                    });
                }
            },
            onChangeDisciplina = function(){
                var disciplinaId = $(this).val();

                $turma.html('<option value="">Todas</option>').get(0).selectedIndex = 0;
                $turma.next('span.customSelect').find('.customSelectInner').text('Todas');

                if(disciplinaId)
                {
                    $.ajax({
                        type: 'post',
                        url: '/aluno/getTurmaFromDisciplina',
                        data: {disciplinaId: disciplinaId},
                        dataType: 'json'
                    }).done(function(data){
                        $.each(data, function(index, itemData){
                            $turma.append('<option value="' + index + '">' + itemData + '</option>');
                        });
                    });
                }
            };

        return {
            init: function(){
                $projeto.on('change', onChangeProjeto);
                $cliente.on('change', onChangeCliente);
                $disciplina.on('change', onChangeDisciplina);
            }
        };
    })();

    Aluno.init();
});