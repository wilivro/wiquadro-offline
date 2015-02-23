$(function(){
    "use strict";

    var Login = (function(){
        var $email = $('#Usuario_Email');

        var focusOnEmailInput = function(){
            $email.focus();
            window.scrollTo(0, 0);
        };

        return {
            init: function(){
                focusOnEmailInput();
            }
        };
    })();

    Login.init();
});