 $(function() {
     "use strict";

     $(".radioProgress").radioProgress();

     var $matricula = $(".select-matricula"),
         $secao = $(".select-secao"),
        $desempenhoTable = $(".desempenho-table");

     var categories = [];
     var seriesRaw = [];
     var series = [];
     var series2 = [];
     var total = [];

     var tableToChart = function() {
         var $groups = $(".grouper");
         categories = $groups.map(function() {
             return $(this).find("span.grouper-label").text()
         }).get();

         

         $("."+index+"-check").each(function(i, self) {
             seriesRaw[$(self).val()] = {
                 name: $(self).parent().find("span").text(),
                 data: [],
                 lineWidth: 2
             };
         });

         $groups.each(function(idx, self) {
             total[idx] = $(self).find('.radioProgress').data("value-now");
             for (var k in seriesRaw) {
                 var $row = $(".inner-group[data-parent='#" + $(self).attr('id') + "'][data-id='" + k + "']");
                 seriesRaw[k].data[idx] = !!$row.length ? $row.find(".radioProgress").data("value-now") : null;
             }


         });

         for (var k in seriesRaw) {
             series.push(seriesRaw[k]);
         }
         series2.push({
             name: 'Total',
             data: total,
             lineWidth: 2,
             color: "#2E3C4A"
         });
     };

     tableToChart();
     if(categories.length && seriesRaw.length){
         $('#desempenho-chart').highcharts({
             chart: {
                 height: 600,
                 type: 'line'
             },
             title: {
                 text: '',
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
             series: series
         });
    }
     if(categories.length && total.length && seriesRaw.length){
        $('#desempenho-chart2').highcharts({
            chart: {
                polar: true,
                type: 'area',
                height:600
            },

            title: {
                text: '',
                x: -80
            },

            pane: {
                size: '80%'
            },

            xAxis: {
                categories: categories,
                tickmarkPlacement: 'on',
                lineWidth: 0,
                labels:{enabled:false}
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
               enabled:false
            },

            series: series2
        });
    }
    if(!seriesRaw.length && total.length){
        $('#desempenho-chart-default').highcharts({
             chart: {
                 height: 600,
                 type: 'area'
             },
             title: {
                 text: '',
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
             series: series2
         });
    }


     var $groupLabel = $desempenhoTable.find(".group-label");

     $groupLabel.text($(".group.active").text());

     if (!listEdc) $(".conteudo-check").attr('checked', 'true');
     for (var k in listEdc) {
         $(".conteudo-check[value='" + listEdc[k] + "']").attr('checked', 'true');
     }

     if (!listDescritor) $(".descritor-check").attr('checked', 'true');
     for (var k in listDescritor) {
         $(".descritor-check[value='" + listDescritor[k] + "']").attr('checked', 'true');
     }

     $matricula.on("change", function() {
         if (window.confirm("Tem certeza que deseja sair da pagina?")) {
             window.location.href = url + $(this).val();
         }
     });

     $("#pesquisar-desempenho").on('click', function(e) {
         e.preventDefault();
         var conteudos = utf8_to_b64($(".conteudo-check").map(function() {
             if (this.checked) return $(this).val();
         }).get().join('-'));
         var descritores = utf8_to_b64($(".descritor-check").map(function() {
             if (this.checked) return $(this).val();
         }).get().join('-'));
         var queryString = getSecao();
         if (conteudos.length && $(".conteudo-check:checked").length != $(".conteudo-check").length) queryString += "/conteudo/" + conteudos;
         if (descritores.length && $(".descritor-check:checked").length != $(".descritor-check").length) queryString += "/descritores/" + descritores;
         queryString += '/group/' + $(".select-group").val();
         if($(".inicial-date").length)
            if ($(".inicial-date").val().length) queryString += "/inicial/" + $(".inicial-date").val();
         if($(".final-date").length)
            if ($(".final-date").val().length) queryString += "/final/" + $(".final-date").val();
         window.location.href = queryString;
     });

     var getSecao = function() {
         if($secao.val() === 'estude' || $secao.val() === 'pratique')
         {
             return url + $matricula.val() + "/secao/" + $secao.val();
         }

         return url + $matricula.val();
     }
    

 });