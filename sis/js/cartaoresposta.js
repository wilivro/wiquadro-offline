$(function(){
    "use strict";

    var Cartaoresposta = (function(){
        var flow,
            $cartaoRespostaCamposContainer = $('.cartaoRespostaCamposContainer'),
            btnRemoverCartaoResposta = '.btnRemoverCartaoResposta',
            buttoncolumn  = '.buttoncolumn',
            $tableCartaoResposta = $('.tableCartaoResposta');

        var bootstrapFlowJs = function(){
            flow = new Flow({
                target: '/provaturma/cartaorespostaupload',
                chunkSize: (1024*1024)*5,
                simultaneousUploads: 1,
                testChunks: false,
                query: {provaturma: $('#provaturma').val()}
            });
            if(!flow.support)
            {
                window.WiAlert('error', 'Seu navegador não possui suporte para enviar os cartões de resposta.');
            }
            flow.assignBrowse(document.getElementById('cartaoResposta'), false, false, {accept: 'image/jpg'});
        },
        addNewTableRow = function(data){
            $cartaoRespostaCamposContainer.append('<tr class="cartaoRespostaRow-' + data.fileId + '">' +
                '<td class="col-md-11" colspan="3">' +
                '<div class="progress">' +
                '<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>' +
                '</div>'+
                '</td>' +
                '<td class="col-md-1">' +
                '<a href="#" data-id="" class="btn btn-sm btn-danger btnRemoverCartaoResposta awesome-tooltip" title="Remover"><i class="fa fa-trash-o"></i></a>' +
                '</td>' +
                '</tr>');
        },
        startUpload = function(){
            flow.upload();
        },
        cancelUpload = function(uniqueid){
            flow.removeFile(flow.getFromUniqueIdentifier(uniqueid));
        };

        var onFlowFileAdded = function(file, event){
            addNewTableRow({fileId: file.uniqueIdentifier});
        },
        onFlowFileProgress= function(file, event){
            setTimeout(function(){
                var progress = Math.floor(file.progress()*100),
                    progressPercent = progress + '%',
                    $row = $('.cartaoRespostaRow-' + file.uniqueIdentifier);

                if(progress === 100)
                {
                    $row.find('.progress-bar').removeClass('active');
                }

                $row.find('.progress-bar').css({width: progressPercent}).text(progressPercent);
            }, 100);
        },
        onFlowFilesSubmitted = function(file){
            startUpload();
        },
        onFlowFileSuccess = function(file, message, chunk){
            message = $.parseJSON(message);
            var type = message.success ? 'success' : 'warning';
            window.WiAlert(type, message.message);
            var $row = $('.cartaoRespostaRow-' + file.uniqueIdentifier);

            if(!message.success)
            {
                $row.remove();
            }

            if(message.data)
            {
                var htmlRow = '<td class="col-md-2">' + message.data.alunoTurmaId + '</td>' +
                            '<td class="col-md-7">' + message.data.aluno + '</td>' +
                            '<td class="col-md-2">' + message.data.nota + '</td>' +
                            '<td class="col-md-1">' +
                            '<a href="/uploads/cartoesresposta/images/' + message.data.imagem + '" target="_blank" class="btn btn-sm btn-blue awesome-tooltip" title="Visualizar Cartão">' +
                            '<i class="fa fa-file-o"></i></a>' +
                            ' <a href="#" data-id="' + message.data.cartaoRespostaId + '" data-uniqueid="" class="btn btn-sm btn-danger btnRemoverCartaoResposta awesome-tooltip" title="Remover">' +
                            '<i class="fa fa-trash-o"></i></a>' +
                            '</td>';
                $row.html(htmlRow);
            }
        },
        onClickBtnRemoverCartaoResposta = function(e){
            e.preventDefault();

            if(window.confirm('Deseja realmente excluir este cartão de resposta?'))
            {
                var $self = $(this),
                    id = $self.data('id'),
                    uniqueid = $self.data('uniqueid'),
                    removeRow = function(){
                        $self.closest('tr').remove();
                        window.WiAlert('success', 'Cartão de resposta removido com sucesso.');
                    };

                if(id && !uniqueid)
                {
                    $.ajax({
                        type: 'post',
                        data: {id: id},
                        url: '/provaturma/removercartaoresposta'
                    }).done(function(){
                        removeRow();
                    });
                }else
                {
                    cancelUpload(uniqueid);
                    removeRow();
                }
            }
        };

        return {
            init: function(){
                bootstrapFlowJs();
                flow.on('fileAdded', onFlowFileAdded);
                flow.on('fileProgress', onFlowFileProgress);
                flow.on('filesSubmitted', onFlowFilesSubmitted);
                flow.on('fileSuccess', onFlowFileSuccess);
                $tableCartaoResposta.on('click', btnRemoverCartaoResposta, onClickBtnRemoverCartaoResposta);
            }
        };
    }());

    Cartaoresposta.init();
});