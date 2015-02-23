$(document).ready(function()
{
    var Filtro = (function()
    {
        //Propiedades
        var $projeto = $('#projeto'),
            $disciplina = $('#disciplina'),
            $edc = $('#edc'),
            $btnSetEdc = $('#setEdc'),
            $secao = $('#secao');
        /**
         * Requisição AJAX para resgatar as Disciplinas de acordo com o projeto selecionado.
         */
        var getDisciplinas = function()
        {
            $.get('/disciplina/getbyprojeto/idprojeto/'+$projeto.val(),{},function(data)
            {
                showOptions(data, $disciplina, true);
            },'json');
        },
        /**
         * Requisição AJAX para resgatar os EDCs de acordo com a disciplina selecionada.
         */
        getEdcs = function()
        {
            $.get('/edc/getbydisciplina/iddisciplina/'+$disciplina.val(),{},function(data)
            {
                showOptions(data, $edc);
            },'json');
        },
        /**
         * Exibe os dados trazidos pela requesição
         * @param array   data       Dados a serem tratados.
         * @param Jquery  alvo       Objeto Jquery onde será exibidos os dados.
         * @param boolean changeAlvo Gatilho para ação change no objeto alvo.
         */
        showOptions = function(data, alvo, changeAlvo)
        {
            alvo.html('');

            if(data.s !== 'ok')
            {
                window.WiAlert(data.s, data.m);
                alvo.next().show();

                if(changeAlvo)
                    alvo.change();

                return false;
            }
            alvo.next().hide();
            var $option = $('<option>');

            $.each(data.o, function()
            {
                $option.clone().val(this.Id).html(this.Titulo).appendTo(alvo);
            });

            if(changeAlvo)
                alvo.change();
        },

        reload = function(e)
        {
            e.preventDefault();

            if(!$disciplina.val() || !$edc.val())
                return false;

            window.location.href = '/edc/exercicio/secao/'+$secao.val()+'/edcid/'+$edc.val();
        };

        return {
            init: function()
            {
                $projeto.on('change', getDisciplinas);
                $disciplina.on('change', getEdcs);
                $btnSetEdc.on('click', reload);
                $projeto.change();
            }
        };
    })();

    Filtro.init();
});
