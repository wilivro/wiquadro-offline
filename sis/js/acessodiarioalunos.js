$(function(){
    var Acessodiarioalunos = (function(){
        var $table = $('#acessoDiarioAlunos'),
            $cliente = $('#cliente'),
            $projeto = $('#projeto'),
            $chartContainer = $('#chartContainer');

        var buildGrid = function(){
            $table.DataTable({
                language: {
                    "emptyTable": "Nenhum registro encontrado",
                    "info": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                    "infoEmpty": "Mostrando 0 até 0 de 0 registros",
                    "infoFiltered": "(Filtrados de _MAX_ registros)",
                    "infoPostFix": "",
                    "infoThousands": ".",
                    "lengthMenu": "_MENU_ resultados por página",
                    "loadingRecords": "Carregando...",
                    "processing": "Processando...",
                    "zeroRecords": "Nenhum registro encontrado",
                    "search": "Pesquisar",
                    "paginate": {
                        "next": "Próximo",
                        "previous": "Anterior",
                        "first": "Primeiro",
                        "last": "Último"
                    },
                    "aria": {
                        "sortAscending": ": Ordenar colunas de forma ascendente",
                        "sortDescending": ": Ordenar colunas de forma descendente"
                    }
                }
            });
        },
        buildChart = function(){
            $chartContainer.highcharts({
                chart: {zoomType: 'x', spacingRight: 20},
                title: {text: 'Evolução de acesso dos alunos', x: -20},
                subtitle: {text: 'analítico', x: -20},
                xAxis: {
                    categories: [
                        '01','02','03','04','05','06','07','08','09','10',
                        '11','12','13','14','15','16','17','18','19','20',
                        '21','22','23','24','25','26','27','28','29','30','31'
                    ]
                },
                yAxis: [
                    {
                        title: {text: 'Alunos Acessando'},
                        plotLines: [{value: 0, width: 1, color: '#808080'}],
                        min: 0
                    },
                    {
                        title: {text: 'Total'},
                        plotLines: [{value: 0, width: 2, color: '#808080'}],
                        opposite: true,
                        min: 0
                    }
                ],
                plotOptions: {
                    series: {fillOpacity: 0.5}
                },
                tooltip: {
                    valueSuffix: 'Aluno(s)'
                },
                series: chartData
            });
        },
        loadProjectsByClientId = function(clientId){
            return $.ajax({
                type: 'get',
                url: '/relatorio/getProjetoByCliente',
                dataType: 'html',
                data: {clienteId: clientId}
            });
        };

        var onChangeCliente = function(){
            var clientId = $(this).val();
            if(clientId)
            {
                loadProjectsByClientId(clientId).done(function(options){
                    $projeto.html(options);
                    var projetoHiddenId = $('#projeto_hidden').val();
                    if(projetoHiddenId)
                    {
                        $projeto.val(projetoHiddenId);
                        $projeto.change();
                    }
                });
            }
        };

        return {
            init: function(){
                buildGrid();
                buildChart();

                if($cliente.length)
                {
                    $cliente.on('change', onChangeCliente);
                    if($cliente.val())
                    {
                        $cliente.change();
                    }
                }


            }
        };
    })();

    Acessodiarioalunos.init();
});