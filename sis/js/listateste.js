$(document).ready(function(){
  "use strict";

  var ListaTestes = (function(){
    var $showModalResultado = $('.showResultados'),
        $realizarProvaBtn = $('.btn-realizarprova');

    var showResultados = function(e){
      e.preventDefault();
      var $a = $(this), id = $a.attr('href').substr(1);

      $('#modalShowResultados' + id).modal('show');
    };

    var redirectToFazerProvaPage = function(e, link){
      window.location = link;
    };

    var debounceRedirect = _.debounce(redirectToFazerProvaPage, 500);

    return {
      init: function(){
        $showModalResultado.on('click', showResultados);
        $realizarProvaBtn.on('click', function(e) {
          e.preventDefault();
          debounceRedirect(e, $(this).attr('href'));
        });
      }
    };
  })();

  ListaTestes.init();
});
