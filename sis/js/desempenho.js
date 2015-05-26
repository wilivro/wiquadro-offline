/**
 * 
 * @param {type} param
 */
$(document).ready(function()
{
    var Desempenho = (function()
    {
        var $linha = $('div.linha');
        
        /**
         * Teste de documentação.
         * @param {type} e
         * @returns {undefined}
         */
        var showInfo = function(e)
        {
            e.preventDefault();
            var $a = $(this), $div = $($a.attr('href'));
            
            $a.closest('li').find('div.Show').slideUp('slow');
            $a.closest('div').find('a.acao').removeClass('active');
            
            if($a.hasClass('interacao'))
                getInteracao($div);
            
            if(!$div.hasClass('Show'))
            {
                $a.closest('li').find('div.Show').removeClass('Show');
                $a.addClass('active');
                $div.addClass('Show').slideDown('slow');
            }
            else
            {
                $a.closest('li').find('div.Show').removeClass('Show');
            }    
        };
        
        var getInteracao = function($element)
        {
            var id = $element.closest('li').attr('data-id');
            $.post
            (
                '/aluno/getInteracaoEdcMidia/alunoturmaedcmidia/'+id,
                {},
                _getInteracao,
                'json'
            );
        };
        
        var _getInteracao = function(r)
        {
            if(r.s === 'error')
            {
                window.WiAlert('error', r.m);
                return false;
            }
            
            var totalInteracoes = r.o.interacoes.length;
            var erros  = 0, acertos = 0;
            
            $.each(r.o.interacoes, function(index, obj)
            {
                if(obj.Acertou === 'T')
                    acertos++;
                else if(obj.Acertou === 'F')
                    erros++;
            });
            
            $saida = "Quantidade de interações: <span class='label label-info'>"+totalInteracoes+"</span><br/>";
            $saida += "Erros: <span class='label label-danger'>"+erros+"</span> ";
            $saida += "Acertos: <span class='label label-success'>"+acertos+"</span>";
            
            $('#detalhes-midia-'+r.o.alunoturmaedcmidia).find('.conteudo-interacao').html($saida);
            console.log(r.o.interacoes);
        };
        
        return {
            /**
             * Responsável por iniciar a variável.
             * @returns {undefined}
             */
            init : function()
            {
                $linha.on('click', 'a.acao', showInfo);
            }
        };
    })();
    
    Desempenho.init();
});

$(function(){

    $('#UlDescritores').children('li').each(function(i, li){

        var $li = $(li), $container = $li.find('.firstDiv'),
        //valores referentes as interações
        acertosInt = $li.find('input.interacaoT').length > 0 ? parseInt($li.find('input.interacaoT').val()) : 0,
        errosInt = $li.find('input.interacaoF').length > 0 ? parseInt($li.find('input.interacaoF').val()) : 0,
        totalInt = acertosInt + errosInt,
        porcAcertosInt =acertosInt === 0 ? 0 : ((100*acertosInt) / totalInt), porcErrosInt = porcAcertosInt === 0 ? 0 : (100 - porcAcertosInt),
        //Valores referentes as questões
        acertosQues = $li.find('input.questaoT').length > 0 ? parseInt($li.find('input.questaoT').val()) : 0,
        errosQues = $li.find('input.questaoF').length > 0 ? parseInt($li.find('input.questaoF').val()) : 0,
        totalQues = acertosQues + errosQues,
        porcAcertosQues = acertosQues === 0 ? 0 : ((100*acertosQues) / totalQues), porcErrosQues = porcAcertosQues === 0 ? 0 : (100 - porcAcertosQues);
        //Debug
        /*console.log('Acertos:'+acertosQues);
        console.log('Erros:'+errosQues);
        console.log('Total:'+totalQues);
        console.log('acertos%:'+porcAcertosQues);
        console.log('Erros%:'+porcErrosQues);
        console.log('PorcentagemAcertosArredondado:'+decimalAdjust('round', porcAcertosQues, -2));
        console.log('PorcentagemErrosArredondado:'+decimalAdjust('round', porcErrosQues, -2));*/
        
        $container.highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: $li.find('input.descritor').val()
            },
            subtitle: {
                text: $li.find('input.descritor').data('descricao')
            },
            xAxis: {
                categories: ['Interações', 'Questões'],
                title: {
                    text: null
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Interações (%) / Questões (%)',
                    align: 'high'
                },
                labels: {
                    overflow: 'justify'
                }
            },
            tooltip: {
                valueSuffix: '%'
            },
            plotOptions: {
                bar: {
                    dataLabels: {
                        enabled: true
                    }
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -40,
                y: 100,
                floating: true,
                borderWidth: 1,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor || '#FFFFFF'),
                shadow: true
            },
            credits: {
                enabled: false
            },
            series: [{
                name: 'Acertos',
                data: [decimalAdjust('round', porcAcertosInt, -2), decimalAdjust('round', porcAcertosQues, -2)],
                color: 'green'
            },
            {
                name: 'Erros',
                data: [decimalAdjust('round', porcErrosInt, -2), decimalAdjust('round', porcErrosQues, -2)],
                color: 'red'
            }]
        });
    });

    /**
     * Arredonda as casas decimais do valor passado.
     *
     * @param string type  tipo de arredondamento (round, floor, ceil).
     * @param integer value valor a ser arredondado.
     * @param integer exp Quantidade de casas decimais que deve permanecer. Colocar numero negativo.
     */
    function decimalAdjust(type, value, exp)
    {
        // If the exp is undefined or zero...
        if (typeof exp === 'undefined' || +exp === 0)
            return Math[type](value);

        value = +value;
        exp = +exp;
        // If the value is not a number or the exp is not an integer...
        if (isNaN(value) || !(typeof exp === 'number' && exp % 1 === 0)) {
            return NaN;
        }
        // Shift
        value = value.toString().split('e');
        value = Math[type](+(value[0] + 'e' + (value[1] ? (+value[1] - exp) : -exp)));
        // Shift back
        value = value.toString().split('e');
        return +(value[0] + 'e' + (value[1] ? (+value[1] + exp) : exp));
    }

    var $modal = $('#materiaisReforcoModal'),
        hasAccessedLink = [],
        hasReportedLink = [];

    $modal.on('show.bs.modal', function(e){
        var id = $(e.relatedTarget).data('id');

        $.ajax({
            url: '/desempenho/getLinksByDescritor',
            type: 'get',
            dataType: 'json',
            data: {id: id}
        }).done(function(response){
            var $container = $modal.find('tbody'),
                row;
                $container.html('');

            if(response)
            {
                for(var attr in response)
                {
                    if(response.hasOwnProperty(attr))
                    {
                        row = '<tr>' +
                            '<td><a href="' + response[attr].url + '" class="link" data-id="' + response[attr].idlink + '" target="_blank">' + response[attr].descricao + '</a></td>' +
                            '<td><button class="btn btn-danger report" data-id="' + response[attr].idlink + '">Reportar</button></td>' +
                            '</tr>';
                        $container.append(row);
                    }
                }
            }
        });
    });

    var $groupBy = $(".group-by");

	$groupBy.on('click',function(e){
		e.preventDefault();
        $groupBy.removeClass("active");
		$(this).addClass('active');
	});

    $modal.on('click', '.link', function(e){
        var id = $(this).data('id');

        if(id)
        {
            if($.inArray(id, hasAccessedLink) === -1)
            {
                $.ajax({
                    url: '/desempenho/registerLinkAccess',
                    data: {id: id},
                    type: 'post'
                });

                hasAccessedLink.push(id);
            }
        }
    });

    $modal.on('click', '.report', function(e){
        var id = $(this).data('id');

        if(id)
        {
            if($.inArray(id, hasReportedLink) === -1)
            {
                $.ajax({
                    url: '/desempenho/registerLinkReport',
                    data: {id: id},
                    type: 'post'
                });

                hasReportedLink.push(id);
            }
        }
    });
});