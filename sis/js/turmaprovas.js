$(function(){
    var Provas = (function(){
        var TEST_ID,
            $testModal = $('#testModal'),
            $openTestModalButton = $('.openProvaModal'),
            $testSaveButton = $('#testSaveButton'),
            $teacherComment = $('#teacherComment'),
            $studentScore = $('#studentScore');

        var openTestModal = function(testId){
                getTestQuestionsAndAnswers(testId).done(function(data){
                    insertContentInTestModal(data.o);
                    showTestModal();
                    TEST_ID = testId;
                });
            },
            showTestModal = function(){
                $testModal.modal('show');
            },
            insertContentInTestModal = function(data){
                $('.modal-body .questionsAndAnswersList', $testModal).html(data.listagem);

                $studentScore.attr('disabled', true);
                if(data.tipoCorrecao === 'P')
                {
                    $studentScore.attr('disabled', false);
                }

                $teacherComment.val(data.comentario);
                $studentScore.val(data.nota);
            },
            getTestQuestionsAndAnswers = function(testId){
                return $.ajax({
                    url: '/turma/getTestQuestionsAndAnswers',
                    data: {testId: testId},
                    type: 'post',
                    dataType: 'json'
                });
            },
            saveTestCommentAndScore = function(){
                var score = $studentScore.val(), comment = $teacherComment.val();

                $.ajax({
                    url: '/turma/saveTestCommentAndScore',
                    data: {testId: TEST_ID, score: score, comment: comment},
                    dataType: 'json',
                    type: 'post'
                }).done(function(data){
                    window.WiAlert('success', data.m);
                });
            };

        var onClickOpenTestModalButton = function(e){
                e.preventDefault();

                var testId = $(this).data('id') ? $(this).data('id') : $(this).attr('href');
                openTestModal(testId);
            },
            onClickTestSaveButton = function(){
                saveTestCommentAndScore();
            };

        return {
            init: function(){
                $openTestModalButton.on('click', onClickOpenTestModalButton);
                $testSaveButton.on('click', onClickTestSaveButton);
            }
        };
    })();

    Provas.init();
});