$(function(){
    var Quadrogeral = (function(){
        var $table = $('#quadroGeral'),
            $cliente = $('#cliente'),
            $projeto = $('#projeto'),
            $disciplina = $('#disciplina');

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
                },
                footerCallback: function(tfoot, data, start, end, display){
                    var api = this.api(),
                    insertFooterTotal = function(columnIndex){
                        var total = api.column(columnIndex).data().reduce(function(a, b){
                                if(typeof a === 'string' && a.indexOf('a') !== -1)
                                    a = $(a).text();

                                if(typeof b === 'string' && b.indexOf('a') !== -1)
                                    b = $(b).text();

                                return +a + +b;
                        }),
                        totalOfCurrentPage = api.column(columnIndex, {page: 'current'}).data().reduce(function(a, b){
                            if(typeof a === 'string' && a.indexOf('a') !== -1)
                                a = $(a).text();

                            if(typeof b === 'string' && b.indexOf('a') !== -1)
                                b = $(b).text();

                            return +a + +b;
                        });

                        $(api.column(columnIndex).footer()).html('<strong>' + totalOfCurrentPage + ' <br><h4>' + total + '</h4></strong>');
                    };

                    api.columns().each(function(indexes){
                        $.each(indexes, function(index){
                            if($(api.column(index).header()).is('.matriculados, .frequentando, .nuncaAcessaram, .evadidosSempre, .evadidosDias, .evadidosTotal, .concluidos'))
                                insertFooterTotal(index);
                        });
                    });

                }
            });
        };

        var onChangeCliente = function(){
                var clienteId = $(this).val();
                if(clienteId > 0)
                {
                    $.ajax({
                        url: 'getProjetoByCliente',
                        data: {clienteId: clienteId},
                        type: 'get',
                        dataType: 'html'
                    }).done(function(projetos){
                        $projeto.html(projetos);

                        var projetoHiddenId = $('#projeto_hidden').val();
                        if(projetoHiddenId)
                        {
                            $projeto.val(projetoHiddenId);
                            $projeto.change();
                        }
                    });
                }
            },
            onChangeProjeto = function(){
                var projetoId = $(this).val();
                if(projetoId > 0)
                {
                    $.ajax({
                        url: 'getDisciplinaByProjeto',
                        data: {projetoId: projetoId},
                        type: 'get',
                        dataType: 'html'
                    }).done(function(disciplinas){
                        $disciplina.html(disciplinas);

                        var disciplinaHiddenId = $('#disciplina_hidden').val();
                        if(disciplinaHiddenId)
                        {
                            $disciplina.val(disciplinaHiddenId);
                        }
                    });
                }
            };

        return {
            init: function(){
                buildGrid();

                if($cliente.length)
                {
                    $cliente.on('change', onChangeCliente);

                    if($cliente.val())
                    {
                        $cliente.change();
                    }
                }

                if($projeto.length)
                {
                    $projeto.on('change', onChangeProjeto);
                }
            }
        };
    })();

    Quadrogeral.init();
});