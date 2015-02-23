$(function(){
    var Tarefascomplementares = (function(){
        var $tipoRadiobutton = $(':radio', '#Edcmidia_TarefaDestinadaPara'),
            $alunosContainer = $('#alunosContainer'),
            $tarefaComlementarForm = $('#tarefaComlementarForm'),
            $conteudoTextField = $('#Edcmidia_Conteudo'),
            $saveButton = $('.tarefaDataSaveButton'),
            $listaCursos = $('.w-lista-cursos'),
            activateButton = 'a.ativar',
            deactivateButton = 'a.desativar',
            $novaTurmaBtn = $('.novaTurmaBtn');

        var showStudentsCheckboxList = function(event, taskType){
            if(taskType === 'T')
            {
                $alunosContainer.hide();
            }

            if(taskType === 'A')
            {
                if(!$(':checkbox', $alunosContainer).length)
                {
                    event.preventDefault();
                    window.WiAlert('warning', 'Não há alunos para essa turma.');
                    return false;
                }

                $alunosContainer.show();
            }
        },
        saveTarefaComplementarData = function(data){
            return $.ajax({
                url: '/tarefascomplementares/saveTarefaComplementarData',
                type: 'post',
                data: data,
                dataType: 'json'
            });
        },
        showErrorMessages = function(validationErrors){
            var errorMessage = "<ul>";
            $.each(validationErrors, function(index, value){
                errorMessage += "<li>" + value + "</li>";
            });
            errorMessage += "</ul>";

            window.WiAlert('warning', errorMessage);
        },
        activateDeactivateTask = function(id){
            return $.ajax({
                url: '/edcmidia/activateDeactivate',
                data: {id: id},
                type: 'post'
            });
        };

        var onClickRadiobuttonTipo = function(e){
            var taskType = $(this).val();
            showStudentsCheckboxList(e, taskType);
        },
        onClickSaveButton = function(e){

            var editorContent = new nicEditors.findEditor('Edcmidia_Conteudo').getContent();
            if(editorContent != '<br>') // se n tiver conteudo algum, o nicEdit sempre coloca um "<br>", se tiver só isso o campo tá vazio
            {
                $conteudoTextField.val(editorContent);
            }else
            {
                $conteudoTextField.val('');
            }

            var formData = $(':input', $tarefaComlementarForm).serialize();

            saveTarefaComplementarData(formData)
            .done(function(data, textStatus, jqXHR){
                location.reload();
            }).fail(function(jqXHR, textStatus, errorThrown){
                showErrorMessages(JSON.parse(jqXHR.responseText));
            });
        },
        onClickActivateButton = function(e){
            e.preventDefault();

            activateDeactivateTask($(this).attr('href')).done(function(){
                location.reload();
            });
        },
        onClickDeactivateButton = function(e){
            e.preventDefault();

            activateDeactivateTask($(this).attr('href')).done(function(){
                location.reload();
            });
        };

        return {
            init: function(){
                $tipoRadiobutton.on('click', onClickRadiobuttonTipo);
                if($(':radio:checked', '#Edcmidia_TarefaDestinadaPara').is('[value="A"]'))
                {
                    $alunosContainer.show();
                }else
                {
                    $alunosContainer.hide();
                }
                $saveButton.on('click', onClickSaveButton);

                $listaCursos.on('click', activateButton, onClickActivateButton);
                $listaCursos.on('click', deactivateButton, onClickDeactivateButton);
                $novaTurmaBtn.on('click', function(){
                    window.WiAlert('warning', 'Selecione uma turma.');
                });
            }
        };
    })();

    Tarefascomplementares.init();
});