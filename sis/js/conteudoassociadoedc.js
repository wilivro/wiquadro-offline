/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var ConteudoAssociadoEdc;

$(document).ready(function()
{
   ConteudoAssociadoEdc = (function()
   {
       var $modalConteudoAssociado = $('#modalFormConteudoAssociado'),
            $modalListConteudo = $('#modalConteudoAssociado'),
            $inputId = $('#Conteudoassociadoedc_Id'),
            $inputTitulo = $('#Conteudoassociadoedc_Titulo'),
            $tipoMidia = $('#Conteudoassociadoedc_IdTipoMidia'),
            $inputConteudo = $('#Conteudoassociadoedc_Conteudo'),
            $inputUrl = $('#Conteudoassociadoedc_Url'),
            $inputIdEdc = $('#Conteudoassociadoedc_IdEdc'),
            $inputAddAQuestao = $('#Conteudoassociadoedc_addAQuestao'),
            $btnUpload = $('#file_upload'),
            $btnSaveConteudo = $('.conteudoAssociadoDataSaveButton'),
            $btnAssociaConteudo = $('.conteudoAssociadoSaveButton'),
            $camposForm = $modalConteudoAssociado.find('input, textarea, select').not($btnSaveConteudo);
       
       
       var esconderCamposDeConteudo = function()
       {
           $('div.conteudo').hide();
       };
       
       var mudarCampoConteudo = function()
       {
            var $self = $tipoMidia.children('option:selected'), TIPO = $self.text();
            
            esconderCamposDeConteudo();
            
            if(TIPO === 'TEXT')
            {
                $inputConteudo.closest('div.conteudo').show();
            }
            else if(TIPO === 'HTML' || TIPO === 'EDI' || TIPO === 'VIDEO')
            {
                $inputUrl.closest('div.conteudo').show();
            }
            else
            {
                var ext = $self.data('extupload');
                uploadArquivo(ext);
                $btnUpload.closest('div.conteudo').show();
            }
       };
       
       var initEditor = function()
       {
            var Editor = new nicEditor(
            {
                //iconsPath : '/js/nicEdit/nicEditorIcons.gif',
                fullPanel: true
            }).panelInstance('Conteudoassociadoedc_Conteudo');
            
            Editor.addEvent('blur', function()
            {
                $inputConteudo.val(Editor.instanceById('Conteudoassociadoedc_Conteudo').getContent());
                console.log($inputConteudo.val());
            });
       };
       
       var uploadArquivo = function(accepted_ext)
       {
           var timestamp = new Date().getTime();
           
           var uploadObject = new AjaxUpload($btnUpload,
           {
                action: '/conteudoassociadoedc/uploadfile?time=' + timestamp,
                name: 'file_upload',
                onSubmit: function(file, ext){
                    $btnUpload.next('span.help-block').remove();
                    console.log(ext);
                    if (!(ext && new RegExp('^('+accepted_ext+')$').test(ext)))
                    {
                        // extension is not allowed
                        $btnUpload.after('<span class="help-block">Só é aceito arquivo do(s) tipo(s): ' + accepted_ext.split('|').join(', ') + '.</span>');
                        return false;
                    }

                    $btnUpload.after('<span class="help-block"><em>Carregando...</em></span>');
                },
                onComplete: function(file, response){
                    var fileName = timestamp + '_' + file;
                    
                    if(!response)
                    {
                        $btnUpload.next('span.help-block').text('O Arquivo '+fileName+' não pode ser enviado! Tente novamente.');
                        return false;
                    }
                    
                    var hostname = document.location.hostname;
                    var url = hostname + '/uploads/conteudoassociadoedc/' + fileName;
                    $inputUrl.val(url);
                    $btnUpload.next('span.help-block').text('Arquivo '+fileName+' enviado com sucesso.');
                }
            });
       };
       
       var salvarConteudoAssociado = function()
       {
            var url = $inputId.val().length === 0 ? '/conteudoassociadoedc/saveconteudoassociado' : '/conteudoassociadoedc/updateconteudoassociado';
                    
            $.post(
                url,
                $camposForm.serialize(),
                function(r)
                {
                    if(r.s === 'error')
                    {
                        window.WiAlert('error', r.m);
                        return false;
                    }

                    window.WiAlert('success', r.m);
                    $modalConteudoAssociado.modal('hide');
                    updateGridViews();
                },
                'json'
            );
       };
       
       var updateGridViews = function()
       {
            $.fn.yiiGridView.update('conteudoAssociadoGridView');
            $.fn.yiiGridView.update('conteudoAssociadoNotAssocGridView');
            //initAcoesGridView();
       };
       
       var associarConteudoAssociado = function(e)
       {
           e.preventDefault();
           
           $.post(
                '/conteudoassociadoedc/associarconteudoaquestao',
                $modalListConteudo.find('input').serialize(),
                function(r)
                {
                    if(r.s === 'error')
                    {
                        window.WiAlert('error', r.m);
                        return false;
                    }
                    
                    //$modalListConteudo.modal('hide');
                    updateGridViews();
                },
                'json'
            );
       };
       var limparModal = function()
       {
            $camposForm.not($inputIdEdc).not($inputAddAQuestao).val('');
            nicEditors.findEditor('Conteudoassociadoedc_Conteudo').setContent('');
            esconderCamposDeConteudo();
       };
       
       var getConteudoAssociadoEdcData = function(e)
       {
            e.preventDefault();
            
            var id = $(this).attr('href');
            
            $.post(
                '/conteudoassociadoedc/getConteudoAssociadoEdcData/idconteudo/'+id,
                {},
                setDadosParaUpdate,
                'json'
            );
       };
       
       var setDadosParaUpdate = function(resposta)
       {
            if(resposta.s === 'error')
            {
                window.WiAlert('error', resposta.m);
                return false;
            }
            
            $.each(resposta.o, function(campo, valor)
            {
                $('#Conteudoassociadoedc_'+campo).val(valor);
            });
            
            nicEditors.findEditor('Conteudoassociadoedc_Conteudo').setContent(resposta.o.Conteudo);
            
            mudarCampoConteudo();
            
            showModal();
       };
       
       var removerConteudoAssociado = function(e)
       {
            e.preventDefault();
            
            var idConteudo = $(this).attr('href'), idQuestao = $inputAddAQuestao.val();
            
            $.post(
                '/conteudoassociadoedc/removeConteudoAssociado',
                {
                    idConteudo: idConteudo,
                    idQuestao: idQuestao
                },
                function(resposta)
                {
                    if(!resposta.s === 'error')
                    {
                        window.WiAlert('success', resposta.m);
                        return false;
                    }
                    
                    updateGridViews();
                },
                'json'
            );
       };
       
       var showModal = function()
       {
            $modalConteudoAssociado.modal('show');
       };
       
       var initAcoesGridView = function()
       {
            $('#conteudoAssociadoGridView').on('click', 'a.update', getConteudoAssociadoEdcData);
            $('#conteudoAssociadoGridView').on('click', 'a.remove', removerConteudoAssociado);
       };
       
       return {
           init : function()
           {
                initEditor();
                $tipoMidia.on('change', mudarCampoConteudo);
                $modalConteudoAssociado.on('hide.bs.modal', limparModal);
                $modalConteudoAssociado.on('show.bs.modal', function()
                {
                    $modalListConteudo.modal('hide');
                });
                $modalConteudoAssociado.on('hide', limparModal);
                $btnSaveConteudo.on('click', salvarConteudoAssociado);
                initAcoesGridView();
                $btnAssociaConteudo.on('click', associarConteudoAssociado);
           },
           initAcoesGridView : initAcoesGridView
       };
       
   })();
   
   ConteudoAssociadoEdc.init();
   
});