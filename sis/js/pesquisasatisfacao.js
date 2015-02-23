$(function(){
    "use strict";

    var PesquisaSatisfacao = (function(){
        var $alternativeAddButton = $('#alternativeAddButton'),
            $alternative = $('#alternative'),
            $alternativesContainer = $('#alternativesContainer'),
            $saveQuestionButton = $('#saveQuestionButton'),
            $errorMessagesContainer = $('.alert-error ul'),
            $modal = $('#modalRecordQuestion'),
            questionToggleButton = '.questionToggleButton',
            $openModalButton = $('#openModalButton'),
            $modalFormInputs = $(':input', $modal),
            alternativeRemoveButton = '.alternativeRemoveButton',
            questionEditButton = '.questionEditButton',
            questionRemoveButton = '.questionRemoveButton',
            alternativeIndex = 1;

        var addAlternativeToTheList = function(description, id){
            if(description === '')
            {
                window.WiAlert('warning', 'Informe a descrição da alternativa.');
                return false;
            }

            var template = alternativeHTMLTemplate(alternativeIndex),
            alternative = $(template).appendTo($alternativesContainer);
            alternative.find('#Alternativasatisfacao_Descricao').val(description);
            alternative.find('#Alternativasatisfacao_Id').val(id);
            alternativeIndex += 1;
        },
        openModal = function(){
            $modal.modal('show');
        },
        resetModalForm = function(){
            $modalFormInputs.not('#Perguntasatisfacao_IdCliente').val('');
            $errorMessagesContainer.html('');
            $alternativesContainer.html('');
        },
        alternativeHTMLTemplate = function(index){
            return [
                '<div class="row">',
                    '<div class="col-md-12">',
                        '<div class="input-group">',
                            '<input type="hidden" id="Alternativasatisfacao_Id" name="Alternativasatisfacao[' + index + '][Id]">',
                            '<input type="text" class="form-control" maxlength="500" id="Alternativasatisfacao_Descricao" name="Alternativasatisfacao[' + index + '][Descricao]" class="span12">',
                            '<span class="input-group-btn">',
                                '<a title="Remover" class="btn btn-danger awesome-tooltip alternativeRemoveButton"><i class="fa fa-trash-o"></i></a>',
                            '</span>',
                        '</div>',
                    '</div>',
                '</div>'
            ].join("\n");
        },
        removeAlternativeFromTheList = function($element){
            if(window.confirm("Deseja excluir este item?"))
            {
                var $alternativeBlock = $element.closest('.row');
                var alternativeId = $alternativeBlock.find('#Alternativasatisfacao_Id').val();

                if(alternativeId !== '')
                {
                    $.ajax({
                        url: '/cliente/deleteSatisfactionSurveyAlternative',
                        type: 'post',
                        data: {alternativeId: alternativeId},
                        dataType: 'json'
                    }).done(function(data){
                        if(data.s === 'ok')
                        {
                            $alternativeBlock.remove();
                        }
                        window.WiAlert('success', data.m);
                    });
                }else
                {
                    $alternativeBlock.remove();
                }
            }
        },
        deleteQuestion = function(questionId){
            return $.ajax({
                type: 'post',
                url: '/cliente/deleteSatisfactionSurveyQuestion',
                data: {questionId: questionId},
                dataType: 'json'
            });
        },
        reloadPage = function(){
            window.location.reload();
        },
        getQuestionData = function(questionId){
            return $.ajax({
                data: {questionId: questionId},
                type: 'post',
                dataType: 'json',
                url: '/cliente/getSatisfactionSurveyQuestionData'
            });
        },
        fillOutModalForm = function(data){
            var $selector = function(inputName){
                return $('#Perguntasatisfacao_' + inputName);
            };

            // fill out question data
            for(var attr in data)
            {
                if(data.hasOwnProperty(attr))
                {
                    $selector(attr).val(data[attr]);
                }
            }

            // add alternatives
            for(var i=0;i<data.alternativas.length;i++)
            {
                addAlternativeToTheList(data.alternativas[i].Descricao, data.alternativas[i].Id);
            }
        },
        enableOrDisableQuestion = function(questionId){
            return $.ajax({
                url: '/cliente/toggleSatisfactionSurveyQuestion',
                data: {questionId: questionId},
                type: 'post',
                dataType: 'json'
            });
        },
        workaroundCodeForTooltipEvents = function(){
            //https://github.com/twbs/bootstrap/issues/6942
            $('[rel="tooltip"]','.modal').tooltip().on('show', function(e) {e.stopPropagation();}).on('hide', function(e) {e.stopPropagation();});
        };

        var onClickAlternativeAddButton = function(){
            var description = $alternative.val();
            addAlternativeToTheList(description);
            $alternative.val('').focus();
        },
        onKeyupAlternative = function(e){
            var ENTER_KEY = 13;
            if(e.keyCode === ENTER_KEY)
            {
                var description = $alternative.val();
                addAlternativeToTheList(description);
                $alternative.val('').focus();
            }
        },
        onClickAlternativeRemoveButton = function(){
            removeAlternativeFromTheList($(this));
        },
        onClickSaveQuestionButton = function(){
            var confirmMessage = 'Você tem uma alternativa escrita porém não adicionada, pressione OK para prosseguir sem adicionar e Cancel para para voltar e adicionar a alternativa.';

            if(($alternative.val() !== '') && (!window.confirm(confirmMessage)))
            {
                return false;
            }

            $.ajax({
                type: 'post',
                url: '/cliente/saveSatisfactionSurveyQuestion',
                dataType: 'json',
                data: $(':input', $modal).serialize()
            }).done(function(data){
                if(data.s === 'error')
                {
                    var message = '<ul>';
                    for(var attr in data.o)
                    {
                        if(data.o.hasOwnProperty(attr))
                        {
                            message += '<li>' + data.o[attr][0] + '</li>';
                        }
                    }
                    message += '</ul>';
                    window.WiAlert('warning', message);
                }else
                {
                    window.WiAlert('success', data.m);
                    reloadPage();
                }
            });

            return true;
        },
        onClickQuestionEditButton = function(e){
            e.preventDefault();

            var questionId = $(this).data('id');

            getQuestionData(questionId).done(function(object){
                resetModalForm();
                fillOutModalForm(object.o);
                openModal();
            });
        },
        onClickQuestionRemoveButton = function(e){
            e.preventDefault();

            if(window.confirm('Deseja excluir esta Pergunta?'))
            {
                var questionId = $(this).data('id');

                deleteQuestion(questionId).done(function(object){
                    window.WiAlert('success', object.m);

                    if(object.s === 'ok')
                    {
                        reloadPage();
                    }
                });
            }
        },
        onClickOpenModalButton = function(){
            resetModalForm();
            openModal();
        },
        onClickQuestionToggleButton = function(e){
            e.preventDefault();

            enableOrDisableQuestion($(this).data('id')).done(function(object){
                if(object.s === 'ok')
                {
                    reloadPage();
                }else
                {
                    window.WiAlert('warning', object.m);
                }
            });
        };

        return {
            init: function(){
                $alternativeAddButton.on('click', onClickAlternativeAddButton);
                $alternative.on('keyup', onKeyupAlternative);
                $saveQuestionButton.on('click', onClickSaveQuestionButton);
                $openModalButton.on('click', onClickOpenModalButton);
                $(document).on('click', alternativeRemoveButton, onClickAlternativeRemoveButton);
                $(document).on('click', questionEditButton, onClickQuestionEditButton);
                $(document).on('click', questionRemoveButton, onClickQuestionRemoveButton);
                $(document).on('click', questionToggleButton, onClickQuestionToggleButton);
                //workaroundCodeForTooltipEvents();
            }
        };
    })();

    PesquisaSatisfacao.init();
});