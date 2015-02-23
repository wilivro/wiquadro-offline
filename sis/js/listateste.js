$(document).ready(function()
{
    var ListaTestes = (function()
    {
        var $showModalResultado = $('.showResultados');

        var showResultados = function(e)
        {
            e.preventDefault();
            var $a = $(this), id = $a.attr('href').substr(1);

            $('#modalShowResultados'+id).modal('show');
        };

        return {
            init: function()
            {
                $showModalResultado.on('click', showResultados);
            }
        }
    })();

    ListaTestes.init();
});
