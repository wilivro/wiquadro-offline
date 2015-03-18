$(function(){
    var $userMessage = $("#mensagens .panel-heading .message-author"),
        $listUsers = $(".list-users span"),
        $msgTo = $("#msgTo"),
        $sendButton = $("#novaMensagem button[type='submit']"),
        $userList = $(".w-user-msg"),
        $reply = $(".mensagem-reply"),
        $modal = $("#novaMensagem");
    var inputTimeout = null;

    var findUsersLike = function(text){

    }

    var onHoverUserMessage = function(e){
      var $self = $(this);
      //$self.popover('show');
      $.get('/mensagem/getAutorInfo/idAutor/'+$self.attr("data-user-id"), function(r) {
        r = JSON.parse(r);
        if(r['status']){
          var $userInfo = $("#genericUser").clone();
          $userInfo.find(".user").html(r['Nome']);
          $userInfo.find(".permissao").html(r['Tipo']);
          $userInfo.find(".img-circle").html(r['Image']);
          $self.attr("data-content",$userInfo.html());
          $userInfo.remove();
         //$self.popover('show');
         //$self.mouseover();
        }
      });
    }

    var onChangeInputMsgTo = function(e){
      var $self = $(this);
      if($self.val().length >= 3)
      {
        $(".dropdown-menu-msgTo").show();
        clearTimeout(inputTimeout);
        inputTimeout = setTimeout(function(){
          findUsersLike($self.val());
        },1000);
        return;
      }
      $(".dropdown-menu-msgTo").hide();
    }

    var onClickSendButton = function(e){
      e.preventDefault();
      var list = $(".w-user-msg").map(function(){
        return $(this).attr("data-user-id");
      })
      .get().join();
      console.log(list);
      $.ajax({
        type: "POST",
        url:'/mensagem/enviar',
        data:{
          usersTo:list,
          sub:$("#msgSub").val(),
          text:$("#msg").val()
        }
      })
      .done(function(r){
        r = JSON.parse(r);
        if(r.status){
          window.WiAlert('success','Sua mensgem foi enviada com sucesso')
        }
      })
    }

    var onClickReplyMessage = function(e){
      e.preventDefault();
      var $self = $(this);
      
      // $self = $(this);
      //  $.ajax({
      //   type: "POST",
      //   url:'/mensagem/enviar',
      //   data:{
      //     usersTo:$self.closest('.mensagem').find('.message-author').attr('data-user-id'),
      //     sub:"RE - "+$self.closest('.mensagem').find(".message-title").text(),
      //     text:$self.closest('.mensagem').find(".reply-text").val()
      //   }
      // })
      // .done(function(r){
      //   r = JSON.parse(r);
      //   if(r.status){
      //     window.WiAlert('success','Sua mensgem foi respondida com sucesso')
      //   }
      // });

      $userTo = $(".message-author[data-user-id='"+$self.data("user-id")+"']").first();
      $msgTo.before(
        $("<span>")
          .attr("data-user-id",$self.data("user-id"))
          .addClass("trim w-user-msg")
          .css({verticalAlign:"middle"})
          .html($userTo.text()+"&nbsp")
          .popover({
            trigger:"hover",
            placement:"bottom",
            html:true,
            content: function(){
              var $self = $(this);
              var response = "";
              $.ajax({
                url:"/mensagem/getAutorInfo/idAutor/"+$self.attr("data-user-id"),
                success: function(r) {
                    r = JSON.parse(r);
                    if(r["status"]){
                      var $userInfo = $("#genericUser").clone();
                      $userInfo.find(".user").html(r["Nome"]);
                      $userInfo.find(".permissao").html(r["Tipo"]);
                      $userInfo.find(".img-circle").html(r["Image"]);
                      response = $userInfo.html();
                    }
                },
                async: false
              });
              return response;
            }

          })
          .append($("<i>").addClass("fa fa-times pull-right close").css({fontSize:15}).click(function(){$(this).parent().popover("hide").remove()}))
      );
      $modal.find("#msgSub").val("RE - "+$self.closest(".mensagem").find(".message-title").text());
      $modal.modal('show');

    }
    $reply.on('click',onClickReplyMessage);
    $userMessage.on('mouseover',onHoverUserMessage);
    
    $msgTo.on('keydown',function(e){
      if(e.keyCode == 8 && !$(this).val().length){
        $(".w-user-msg").last().popover('hide').remove();
      }
    });

    $(".list-users").on('click',function(){
      $(this).find("input").focus();
    })
    $sendButton.on('click',onClickSendButton);

    $('.panel-collapse').on('shown.bs.collapse', function () {
        var $self = $(this);
        $.get('mensagem/setRead/id/'+$self.attr('id'),{},function(data){
          var r = JSON.parse(data);
          if(r.success)
            $self.closest(".panel-default").find(".panel-heading").removeClass("un-read");
        })
    })


    $modal.on('hidden.bs.modal', function () {
        var $self = $(this);
        $(".w-user-msg").remove();
        $self.find("form").each (function(){
          this.reset();
        });
    })

  });