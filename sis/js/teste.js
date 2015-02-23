$(document).ready(function() {

    var $wItem = $(".w-item"),
        $tempoRestantePopOver = $(".tempoRestante"),
        $popOverTimeContent = $("#popOverTimeContent"),
        $questao = $(".questao"),
        $gabarito = $('.gabarito');

    $wItem.first().addClass('active');

    var onShowTempoRestantePopOver = function() {
        var qtd = $(".w-item.respondido").length;
        var qtdT = $("#popOverTimeContent .totalQuest").text();
        var percent = Math.floor(qtd * 100 / qtdT);

        $popOverTimeContent.find(".respQuest").text(qtd);
        $(".progress .progress-bar")
            .css("width", percent + "%")
            .find("span").text(percent + "%")
        
        $(this).attr("data-content", $popOverTimeContent.html());

    }

    var onShowGabaritoModal = function(e) {
        $gabarito.find('.gabaritoItem').remove();
        $gabarito.append(
            $(".w-aulas").find('.w-item').clone()
            .removeClass("col-md-4 w-item past")
            .addClass('gabaritoItem')
            .attr('id', '')
        );
        $gabarito.find('.tRestante').text($popOverTimeContent.find('.tRestante').text());
        var qtd = $(".w-item.respondido").length;
        var qtdT = $popOverTimeContent.find('.totalQuest').text();
        var result = parseInt(qtdT) - qtd;
        $gabarito.find('.questRestantes').text(result);

        if(result == 0){
            $gabarito.find("#concluido").show();
            $gabarito.find("#emAndamento").hide();
            return;
        }
        $gabarito.find("#concluido").hide();
    }

    
    var onClickNextQuestRight = function(e) {
        e.preventDefault();
        var questIndex = $(".questao:visible").attr("id").replace("questao_", "");
        $(".questoes.container .right").css("color", "rgba(133,133,133,.3)");
        var quest = parseInt(questIndex);
        if (quest + 1 <= $questao.length) {
            $questao.hide();
            $("#questao_" + (quest + 1)).fadeIn();

            $wItem.removeClass("active");
            $("#questIcon_" + (quest + 1)).addClass("active");
            $(".actualQuest").text(quest + 1);
        }
        
    }
    var onClickNextQuestLeft = function(e) {
        e.preventDefault();
        var questIndex = $(".questao:visible").attr("id").replace("questao_", "");
        $(".questoes.container .right").css("color", "rgba(133,133,133,.3)");
        var quest = parseInt(questIndex);
        if (quest - 1 > 0) {
            $questao.hide();
            $("#questao_" + (quest - 1)).fadeIn();

            $wItem.removeClass("active");
            $("#questIcon_" + (quest - 1)).addClass("active");
            $(".actualQuest").text(quest - 1);
        }
        
    }
    var onQuestionSelect = function() {
        var $self = $(this);
        $wItem.removeClass("active");
        $(".questoes.container .right").css("color", "rgba(133,133,133,.3)");
        $self.addClass("active");
        if ($self.hasClass("disabled")) return;
        var questIndex = $self.attr("id").replace("questIcon_", "#questao_");
        $(".actualQuest").text(questIndex.replace("#questao_", ""));
        $questao.hide();
        $(questIndex).fadeIn();
    }

    var onChangeInputQuestion = function() {
        var $self = $(this);
        $("label.radio").css("font-weight", "normal");
        $self.parent().css("font-weight", "bold");
        var questIndex = $self.closest(".questao").attr("id").replace("questao_", "#questIcon_");
        $(".questoes.container .right").css("color", "#13a4e2");
        $(questIndex).addClass("respondido");
        $(questIndex).find("span").css({
            color: "orange"
        });

    }

    $wItem.on('click',onQuestionSelect);
    $questao.find("input").on("change", onChangeInputQuestion);
    $questao.find("textArea").on("keyup", onChangeInputQuestion);
    $(".w-passador .right").on('click',onClickNextQuestRight);
    $(".w-passador .left").on('click',onClickNextQuestLeft);
    $tempoRestantePopOver.on('mouseenter', function() {
        $(this).popover('show');
    });
    $tempoRestantePopOver.on('mouseleave', function() {
        $(this).popover('hide');
    });
    $tempoRestantePopOver.on('show.bs.popover', onShowTempoRestantePopOver);
    $('#gabarito').on('show.bs.modal', onShowGabaritoModal);

    

});