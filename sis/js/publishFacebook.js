$(document).ready(function()
{
   var PublishFacebook = (function()
   {
        var $modalFacebook = $('#publishFacebook'),
            $formFacebook = $('#formFacebook'),
            get;
        
        var queryStrings = function()
        {
            var querys = [];

            location.search.substring(1).split('&').forEach(function(query){
                var q = query.split('=');
                querys[q[0]] = q[1];
            });

            return querys;
        };
        var sendMessage = function(e)
        {
            e.preventDefault();
            
            $.post(
                $formFacebook.attr('action'),
                $formFacebook.serialize(),
                function(r)
                {
                    WiAlert(r.s, r.m);
                    
                    if(r.s === 'success')
                        $modalFacebook.modal('hide');
                    //location.href = '/pratique/questoes/alunoturma/'+get.alunoturma+'/edc/'+get.edc;
                },
                'json'
            );
        };
        
        var closeModal = function(e)
        {
            e.preventDefault();
            $modalFacebook.modal('hide');
        };
        
        return {
            init: function()
            {
                get = queryStrings();
                $formFacebook.on('submit', sendMessage);
                $('#modalFacebookClose').on('click', closeModal);
            }
        };
   })(); 
   
   PublishFacebook.init();
});