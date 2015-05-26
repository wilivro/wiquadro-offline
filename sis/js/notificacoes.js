$(document).ready(function(){
	var $acceptParentButton = $("#acceptParentNotify");
    var $refuseParentButton = $("#refuseParentNotify");
    var $closeNotification = $(".closeNotify");
    var $notificacao = $('.w-notificacao');
    var $wNotify = $(".notify");

    var $btnAccept = $("a[data-role='w-accept']");

    var toggleNotify = function(e){
        e.stopPropagation();
        $(".w-ct-notificacoes").toggle();
    }

    var hideNotify = function(){
        $(".w-ct-notificacoes").hide();
    }

    var checkNotificacoes = function(){
        var qtd = $(".w-notificacao:not('.empty')").length;
        $wNotify.find(".w-badge").text(qtd);
        if(!qtd){
            $(".w-notificacao.empty").removeClass('hide').show();
            $wNotify.addClass('empty');
            $wNotify.find(".w-badge").hide();
        }
        else{
            $(".w-notificacao.empty").hide();   
        }
    }

    var onClickAcceptParentButton = function(){
        var $self = $(this);
        var $notify = $(this).closest(".notificacao").data("responsavel");
        $.post('/plataforma/AceitarResponsavel',{id:$notify},function(res){
            var res = JSON.parse(res);
            if(res.success){
               window.WiAlert('success',res.msg);
               $self.closest(".notificacao").fadeOut(function(){$(this).remove();});
            }
        })
    }
    var onClickRefuseParentButton = function(){
        var $self = $(this);
        var $notify = $(this).closest(".notificacao").data("responsavel");
        if(window.confirm("Tem certeza que não é seu responsavel?")){
            $.post('/plataforma/RecusarResponsavel',{id:$notify},function(res){
                var res = JSON.parse(res);
                if(res.success){
                   window.WiAlert('warning',res.msg);
                   $self.closest(".notificacao").fadeOut(function(){$(this).remove();});
                }
            });    
        }
        
    }

    var vanishNotification = function($notify){
        $notify.animate({left:"+=450"},function(){
            $(this).remove();
            checkNotificacoes();
        });
    }

    var onClickCloseNotification = function(e){
        e.stopPropagation();
        var $self = $(this);
        var $notify = $(this).closest(".w-notificacao");
        var notifyId = $notify.attr("id");
        $.post('/site/DesativarNotificacao',{id:notifyId},function(res){
            var res = JSON.parse(res);
            if(res.success){
               $self.closest(".w-notificacao").animate({left:"+=450"},function(){
                    $(this).remove();
                    checkNotificacoes();
                    vanishNotification($notify);
                });
            }
        });
    }

    var onClickToAccept = function(e){
        var $self = $(this);
        var $notify = $self.closest(".w-notificacao");
        var id = $notify.attr('data-parent');
        var idn = $notify.attr('id');
        console.log($self.attr('data-action'));
        if($self.attr('data-action')=='accept'){
            $.post('/usuario/AcceptParent',{IdResponsavel:id,IdNotificacao:idn})
            .done(function(r){
                var json = JSON.parse(r);
                if(json.success){
                    window.WiAlert('success',json.msg);
                    vanishNotification($notify);
                }
                window.WiAlert('warning',json.msg);
            });
            return true;
        }
        $.post('/usuario/refuseParent',{IdResponsavel:id,IdNotificacao:idn})
        .done(function(r){
            var json = JSON.parse(r);
            if(json.success){
                window.WiAlert('success',json.msg);
                vanishNotification($notify);
            }
            window.WiAlert('warning',json.msg);
        });
        return false;
    }

    var onClickNotify = function(e){
        e.stopPropagation();
    }

    $acceptParentButton.on('click',onClickAcceptParentButton);
    $refuseParentButton.on('click',onClickRefuseParentButton);
    $closeNotification.on('click',onClickCloseNotification);
    $wNotify.on('click',toggleNotify);
    $notificacao.on('click',onClickNotify);
    $btnAccept.on('click',onClickToAccept);
    $(window).on('click',hideNotify);
});