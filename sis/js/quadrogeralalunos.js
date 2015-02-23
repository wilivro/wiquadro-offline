/**
 * Created by root on 11/18/14.
 */
$(function(){
    var Quadrogeralalunos = (function(){
        var $table = $('#quadroGeralAlunos'),
            $dataTableApi,
            $alunosMaster = $('.alunosMaster'),
            $gerarBoletim = $('.gerarBoletim');

        var buildGrid = function(){
            $dataTableApi = $table.DataTable({
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
        checkAllVisibleRows = function($element){
            var checked = $element.is(':checked'),
                info = $dataTableApi.page.info();

            for(var i=info.start; i<info.end; i++)
            {
                $($dataTableApi.row(i).nodes()).find('.alunos').attr('checked', checked);
            }
        };

        var onClickAlunosMaster = function(e){
            e.stopPropagation();
            checkAllVisibleRows($(this));
        },
        onClickGerarBoletim = function(){
            var ids = [];
            $('.alunos:checked').each(function(){
                ids.push($(this).val());
            });

            if(ids.length)
            {
                location.href =  '/relatorio/boletim?id=' + ids.join(',');
            }else
            {
                window.WiAlert('warning', 'Selecione pelo menos um aluno.');
            }
        };

        return {
            init: function(){
                buildGrid();

                $alunosMaster.on('click', onClickAlunosMaster);
                $gerarBoletim.on('click', onClickGerarBoletim);
            }
        };
    })();

    Quadrogeralalunos.init();
});