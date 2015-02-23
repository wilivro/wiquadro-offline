$(document).ready(function()
{
    //Criação de turmas
    if($("#addAluno").length){
        if(capacidade>0)
        {
            $("#addAluno").append($("<span>").addClass("badge").text(qtdAlunos+" / "+capacidade));
        }else
        {
            $("#addAluno").append($("<span>").addClass("badge").text(qtdAlunos));
        }
    }
    $('#saveTurma').on('click', function(e)
    {
        e.preventDefault();
        var form = $(this).closest('form');
        $.post(
            form.attr('action'),
            form.serialize(),
            function(r)
            {
                if(r.status)
                {
                    window.WiAlert('success', 'Turma salva com sucesso.');
                    location.reload();
                }else
                {
                    var message = '<ul>';

                    for(var attr in r.mensagem)
                    {
                        if(r.mensagem.hasOwnProperty(attr))
                        {
                            message += '<li>' + r.mensagem[attr] + '</li>';
                        }
                    }
                    message += '</ul>';

                    window.WiAlert('warning', message);
                }
            },
            'json'
        );
    });
    
   
    //Alterar o status da turma
    $('a.changeStatus').on('click', function(e)
    {
        e.preventDefault();
        
        $.post
        (
            $(this).attr('href'),
            {},
            function(r)
            {
                if(r.status)
                {
                    location.reload();
                }else
                {
                    window.WiAlert('error', r.mensagem);
                }
            },
            'json'
        );
    });
    
    //excluir Turma
    $('.excluirTurma').on('click', function(e)
    {

        e.preventDefault();
        
        var excluir = confirm("ATENÇÃO!\nTem certeza que deseja excluir esta turma?");
        
        if(!excluir)
            return false;
        
        $.post
        (
            $(this).attr('href'),
            {},
            function(r)
            {
                if(r.status)
                {
                    window.WiAlert('success', 'Turma excluída com sucesso.');
                    location.reload();
                }
                else
                {
                    window.WiAlert('error', r.mensagem);
                }
            },
            'json'
        );
    });
    //limpa o formulário de cadastro de turma

    $('#modalNewTurma').on('hide.bs.modal',function(){
        $(this).find("form").attr("action","/turma/create").trigger('reset');
    });
    $('.closeTurma').on('click', function()
    {
        $('#Turma_Id').val('');
        $('#Turma_Nome').val('');
    });
    
    $('#addAluno').on('click', function(e)
    {
        e.preventDefault();
        var overflow = qtdAlunos>=capacidade && capacidade>0;
        if(overflow){
            if(window.confirm("A capacidade da turma é "+capacidade+" e estão matriculados "+qtdAlunos+" deseja adicionar outro aluno?")){
                $('#modalAddAluno').modal('show');        
            }
            return;
        }
        $('#modalAddAluno').modal('show');
    });
    
    $('.closeAluno').on('click', function()
    {
        console.log('limpa formulário de pesquisa do aluno!');
        $('#modalAddAluno').find('form').find('input').val('');
        $('#infoAluno').html('');
    });
    
    //Pesquisa aluno via e-mail
    $('#formSearchAluno').on('submit', function(e)
    {
        e.preventDefault();

        var $form = $(this).closest('form'),
            email = $.trim($form.find("input[name='email']").val()),
            $studentInfoContainer = $('#infoAluno'),
            $studentId = $('input.idAluno'),
            containerContent;

        if(email === '')
        {
            window.WiAlert('warning', 'Preencha o campo E-mail.');
            return false;
        }

        $studentId.val('');

        $.post(
            $form.attr('action'),
            $form.serialize(),
            function(r)
            {
                $studentInfoContainer.html('');

                if(r.status)
                {
                    $studentId.val(r.aluno.Id);
                    containerContent = $('<div>')
                        .addClass('alert alert-success')
                        .html('<p><strong>' + r.aluno.Nome + '</strong></p><p>' + r.aluno.Cidade + '/' + r.aluno.UF + '</p>');
                }else
                {
                    var sendEmail = function(email){
                        $.ajax({
                            type: 'post',
                            beforeSend: function(){
                                $("#btnConvider").attr('disabled', true);
                            },
                            data: {email: email},
                            url: '/cartoes/enviarCartaoPorEmail'
                        }).done(function(message){
                            if(message)
                            {
                                window.WiAlert('success', message);
                                location.reload();
                            }
                        }).fail(function(object){
                            if(object)
                            {
                                window.WiAlert('error', 'Não foi possível fazer o envio do e-mail.');
                            }
                        });
                    };

                    containerContent = $("<div>")
                    .addClass(" ")
                    .append($("<span class='text-error'>").html('<strong>' + r.mensagem + "</strong><br>"));

                    if(!r.found)
                    {
                        containerContent.append($("<span>").html("Deseja convidar esta pessoa a participar do Wiquadro?<br><br>"));
                        var sendCard = $("<button>")
                            .attr("id","btnConvider")
                            .addClass("btn btn-info")
                            .text("Convidar")
                            .appendTo(containerContent)
                            .click(function(e){
                                e.preventDefault();

                                var $disciplinaLabel = $('.disciplinaLabel'),
                                    disciplinaId = $disciplinaLabel.data('id'),
                                    clienteId = $disciplinaLabel.data('clienteid');

                                $.ajax({
                                    type: 'post',
                                    data: {Cartoes:{
                                        IdDisciplina:disciplinaId,
                                        IdCliente:clienteId,
                                        IdTurma:parseInt($("[name='Alunoturma[IdTurma]']").val()),
                                        quantidade:1,
                                        Email:email
                                    }},
                                    url: '/cartoes/create',
                                    dataType:'json'
                                }).done(function(message){
                                    if(message.acao)
                                    {
                                        sendEmail(email);
                                    }
                                }).fail(function(object){
                                    if(object)
                                    {
                                        window.WiAlert('error', object.responseText);
                                    }
                                });
                            });
                    }
                }

                $studentInfoContainer.append(containerContent);
            },
            'json'
        );
    });
    //associar aluno a turma
    $('form.addAluno').submit(function(e)
    {
        e.preventDefault();
        if($(this).children('input.idAluno').val() === '')
        {
            $('#infoAluno').html("<div class='alert alert-error'><h3>Primeiro, use o campo de pesquisa acima para selecionar o aluno.</h3><br></div>");
            return false;
        }

        var $addBtn = $('.addBtn');
        $addBtn.attr('disabled', true);
            
        $.post
        (
            $(this).attr('action'),
            $(this).serialize(),
            function(r)
            {
                $addBtn.attr('disabled', false);

                if(r.status)
                {
                    window.WiAlert('success', 'Aluno adicionado com sucesso!');
                    location.reload();
                }else
                {
                    window.WiAlert('error', r.mensagem);
                }
            },
            'json'
        );
    });
    
    $('.removeByTurma').click(function(e)
    {
        e.preventDefault();
        var $element = $(this), aluno = $element.closest('tr').find('.nome').text(), turma = $('#nameTurma').text(), 
            remover = confirm("ATENÇÃO!\nDeseja realmente excluir a matricula do aluno "+aluno+" na turma "+turma+"?\nTodos os dados referentes a esta matrícula serão excluídos e esta ação não poderá ser revertida.");
        
        if(!remover)
            return false;
        
        $.post
        (
            $(this).attr('href'),
            {},
            function(r)
            {
                if(r.status)
                {
                    window.WiAlert('success', 'Aluno removido com sucesso.');
                    location.reload();
                }
                else
                {
                    window.WiAlert('error', r.mensagem);
                }
            },
            'json'
        );
    });

    var getStudentName = function(id){
        return $.ajax({
            type: 'post',
            url: '/turma/getStudentName',
            data: {studentId: id},
            dataType: 'json'
        });
    };

    var $changePasswordModal = $('#changePasswordModal');

    var openChangePasswordModal = function(){
        $(':input', $changePasswordModal).val('');
        $changePasswordModal.modal('show');
    };

    var closeChangePasswordModal = function(){
        $changePasswordModal.modal('hide');
    };

    var changeStudentPassword = function(){
        var senha = $('#senha').val(), repitaSenha = $('#repitaSenha').val(), id = $(this).data('id');

        if(!senha || !repitaSenha)
        {
            window.WiAlert('warning', 'Preencha os dois campos com a nova senha.');
            return false;
        }

        if(senha !== repitaSenha)
        {
            window.WiAlert('warning', 'As senhas digitadas não correspondem.');
            return false;
        }

        $.ajax({
            type: 'post',
            url: '/turma/changeStudentPassword',
            data: {studentId: id, password: senha}
        }).done(function(){
            window.WiAlert('success', 'Senha alterada com sucesso.');
            closeChangePasswordModal();
        });
    };

    $('.changeStudentPasswordButton').on('click', function(e){
        e.preventDefault();

        var id = $(this).data('id');

        getStudentName(id).done(function(object){
            $('.studentName').text(object.o.name);
            $('#changePasswordButton').data('id', id);
            openChangePasswordModal();
        });
        
        return false;
    });
    
    var nomeAluno, urlTransferencia;
    /**
     * Exibe modal com turmas disponíveis para transferência.
     * @param event e
     * @returns Boolean
     */
    var showTurmas = function(e)
    {
        e.preventDefault();
        var element = $(this);
        urlTransferencia = element.attr('href');
        nomeAluno = element.closest('tr').find('td.nome').text();
        $('#modalShowTurmas').modal('show');
        return false;
    },
    /**
     * Executa a requisição de transferência do aluno.
     * @param Event e
     * @returns Boolean
     */
    transferir = function(e)
    {
        e.preventDefault();
        var $a = $(this), $tr = $a.closest('tr'), turmaAntiga = $('#nameTurma').text(), turmaNova = $tr.find('td.turma').text(),
        transferir = confirm('Deseja transferir o aluno "'+nomeAluno+'" da turma "'+turmaAntiga+'" para a turma "'+turmaNova+'"?');
        
        if(!transferir)
            return false;
        
        $.post(
            urlTransferencia,
            {
                turma:$tr.attr('idturma')
            },
            function(resposta)
            {
                window.WiAlert(resposta.s, resposta.m);
                
                if(resposta.s === 'success')
                    window.location.reload();
            },
            'json'
        );
    };
    
    $('#modalShowTurmas').on('hide.bs.modal', function()
    {
        nomeAluno = urlTransferencia = null;
    });
    $('a.transferencia').on('click', showTurmas);
    $('a.turmaTransferir').on('click', transferir);
    
    $('#changePasswordButton').on('click', changeStudentPassword);
});