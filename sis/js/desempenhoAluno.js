$(function () {
    "use strict";

    $(".radioProgress").radioProgress();

    var $matricula = $(".select-matricula"),
        $desempenhoTable = $(".desempenho-table");

    var categories = [];
    var seriesRaw = [];
    var series = [];
    var series2 = [];
    var total = [];

    var tableToChart = function () {
            var $groups = $(".grouper");

            seriesRaw = [];
            series = [];
            series2 = [];
            total = [];

            categories = $groups.map(function(){
                return $(this).find("span.grouper-label").text();
            }).get();

            $("." + index + "-check").each(function(i, self){
                seriesRaw[$(self).val()] = {
                    name: $(self).closest('li').text(),
                    data: [],
                    lineWidth: 2
                };
            });

            $groups.each(function (idx, self) {
                total[idx] = $(self).find('.radioProgress').data("value-now");
                for (var k in seriesRaw) {
                    if (seriesRaw.hasOwnProperty(k)) {
                        var $row = $(".inner-group[data-parent='#" + $(self).attr('id') + "'][data-id='" + k + "']");
                        seriesRaw[k].data[idx] = !!$row.length ? $row.find(".radioProgress").data("value-now") : null;
                    }
                }
            });

            for (var k in seriesRaw) {
                if (seriesRaw.hasOwnProperty(k)) {
                    series.push(seriesRaw[k]);
                }
            }

            series2.push({
                name: 'Total',
                data: total,
                lineWidth: 2,
                color: "#2E3C4A"
            });
        },
        evolucaoAlunoChart = function () {
            if (categories.length && seriesRaw.length) {
                $('#desempenho-chart').highcharts({
                    chart: {
                        height: 600,
                        type: 'line'
                    },
                    title: {
                        align: 'right',
                        useHTML: true,
                        text: '<span title="" class="label label-info">?</span>',
                        x: -20 //center
                    },
                    tooltip: {
                        valueSuffix: '%',
                    },
                    xAxis: {
                        categories: categories
                    },
                    yAxis: {
                        title: {
                            text: 'Aproveitamento (%)'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }],
                    },
                    exporting: {
                        enabled: false
                    },
                    series: series
                });
            }
            if (categories.length && total.length && seriesRaw.length) {
                $('#desempenho-chart2').highcharts({
                    chart: {
                        polar: true,
                        type: 'area',
                        height: 600
                    },

                    title: {
                        align: 'right',
                        useHTML: true,
                        text: '<span title="" class="label label-info">?</span>',
                        x: -60,
                        y: 100
                    },

                    pane: {
                        size: '80%'
                    },

                    xAxis: {
                        categories: categories,
                        tickmarkPlacement: 'on',
                        lineWidth: 0,
                        labels: {enabled: false}
                    },

                    yAxis: {
                        lineWidth: 0,
                        min: 0,
                        max: 100
                    },

                    tooltip: {
                        shared: true,
                        pointFormat: '<span style="color:{series.color}">{series.name}: <b>{point.y:,.0f}%</b><br/>'
                    },

                    legend: {
                        enabled: false
                    },
                    exporting: {
                        enabled: false
                    },
                    series: series2
                });
            }
            if (!seriesRaw.length && total.length) {
                $('#desempenho-chart-default').highcharts({
                    chart: {
                        height: 600,
                        type: 'area'
                    },
                    title: {
                        align: 'right',
                        useHTML: true,
                        text: '<span title="" class="label label-info">?</span>',
                        x: -20 //center
                    },
                    tooltip: {
                        valueSuffix: '%',
                    },
                    xAxis: {
                        categories: categories
                    },
                    yAxis: {
                        title: {
                            text: 'Aproveitamento (%)'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }],
                    },
                    exporting: {
                        enabled: false
                    },
                    series: series2
                });
            }
        };

    $desempenhoTable.find(".group-label").text($(".group.active").text());

    var loadCharts = function(){
        var conteudos = utf8_to_b64($(".conteudo-check").map(function(){
            if (this.checked) {
                return $(this).val();
            }
        }).get().join('-'));

        var descritores = utf8_to_b64($(".descritor-check").map(function(){
            if (this.checked) {
                return $(this).val();
            }
        }).get().join('-'));

        var data = {};

        if (conteudos.length && $(".conteudo-check:checked").length !== $(".conteudo-check").length) {
            data.conteudo = conteudos;
        }

        if (descritores.length && $(".descritor-check:checked").length !== $(".descritor-check").length) {
            data.descritores = descritores;
        }

        data.group = $(".select-group:checked").val();
        data.alunoturma = $matricula.val();
        data.secao = 'pratique';

        var $initialDate = $(".inicial-date"), $finalDate = $(".final-date");

        if ($initialDate.length && $initialDate.val()) {
            data.inicial = $initialDate.val();
        }

        if ($finalDate.length && $finalDate.val()) {
            data.final = $finalDate.val();
        }

        $.ajax({
            type: 'get',
            beforeSend: function(){
                $('#desempenhoAlunoTabs').html('<h3>Os dados estão sendo carregados...</h3>');
            },
            url: '/desempenho/desempenhoAlunoTabs',
            data: data
        }).done(function (html) {
            $('#desempenhoAlunoTabs').html(html);

            index = data.group === 'descritor' ? 'conteudo' : 'descritor';

            tableToChart();
            evolucaoAlunoChart();
        });
    };

    loadCharts();

    $(".form-filtro-desempenho :input").change($.debounce(750, function(e){
        e.preventDefault();
        loadCharts();
    }));

    $matricula.on("change", function(){
        if (window.confirm("Tem certeza que deseja sair da pagina?")) {
            window.location.href = url + $(this).val();
        }
    });
});