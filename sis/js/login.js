(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

window.fbAsyncInit = function(){
    FB.init({
        appId: '1578463135713236',
        cookie: true,
        xfbml: true,
        version: 'v2.2'
    });
};

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

                $('.facebookLoginButton').on('click', function(){
                    FB.login(function(response){
                        if(response.authResponse)
                        {
                            window.location = '/site/login';
                        }
                    }, {scope: 'public_profile,email,user_birthday,user_location'});
                });
            }
        };
    })();

    Login.init();
});