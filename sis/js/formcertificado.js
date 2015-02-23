$(function(){
    var FormCertificado = (function(){
        var $x = $('#Disciplina_CertificadoX'),
            $y = $('#Disciplina_CertificadoY'),
            $text = $('#Disciplina_CertificadoTexto'),
            $newCertification = $('#newCertification'),
            $certification = new Image(),
            $imageHiddenField = $('#Disciplina_CertificadoImagem'),
            $certificationCanvas = $('#certificationCanvas'),
            $addCertificationButton = $('.addCertificado'),
            $pictureButton = $('#picture'),
            $status = $('#status'),
            $modal = $('#modalAddCertificado'),
            $saveButton = $('#saveButton'),
            TIMEOUT_ID;

        var setCertificationCanvasSize = function(){
                $certificationCanvas.attr('width', $certification.width);
                $certificationCanvas.attr('height', $certification.height);
            },
            writeCertificationTextOnCanvas = function(){
                clearTimeout(TIMEOUT_ID);
                setCertificationCanvasSize();

                TIMEOUT_ID = setTimeout(function(){
                    if($x.val() != '' && $y.val() != '' && $text.val() != '')
                    {
                        var context = $certificationCanvas[0].getContext('2d');
                        context.drawImage($certification, 0, 0);
                        context.font = '14px Arial';

                        var yLine = +$y.val();
                        $text.val().split(/\r?\n/g).forEach(function(linha){
                            context.fillText(linha, $x.val(), yLine);
                            yLine += 16;
                        });

                        $newCertification.attr('src', $certificationCanvas[0].toDataURL());
                    }
                }, 500);
            },
            uploadPicture = function(){
                var timestamp = new Date().getTime();

                new AjaxUpload($pictureButton, {
                    action: '/projeto/uploadpicture?time=' + timestamp,
                    name: 'picture',
                    onSubmit: function(file, ext){
                        if (!(ext && /^(jpg|png|jpeg|gif)$/.test(ext)))
                        {
                            $status.text('Apenas arquivos JPG, PNG ou GIF são permitidos.');
                            return false;
                        }
                    },
                    onComplete: function(file){
                        var fileName = timestamp + '_' + file;
                        $certification.src = getCertificationImagePath(fileName);
                        $imageHiddenField.val(fileName);
                    }
                });
            },
            disableSaveButton = function(flag){
                $saveButton.attr('disabled', flag);
            },
            saveFormData = function(callback){
                var formData = $(':input', $modal).serialize();

                $.ajax({
                    type: 'post',
                    beforeSend: function(){
                        disableSaveButton(true);
                    },
                    data: formData,
                    url: '/projeto/saveCertification',
                    dataType: 'json'
                }).done(function(errors){
                    disableSaveButton(false);

                    if(callback)
                    {
                        callback(errors);
                    }
                });
            },
            openModal = function(disciplinaId){
                $newCertification.removeAttr('src');

                $.ajax({
                    type: 'post',
                    url: '/projeto/getDisciplinaData',
                    data: {id: disciplinaId},
                    dataType: 'json'
                }).done(function(data){
                    $($x, $modal).val(data.CertificadoX);
                    $($y, $modal).val(data.CertificadoY);
                    $($text, $modal).val(data.CertificadoTexto);
                    $($imageHiddenField, $modal).val(data.CertificadoImagem);
                    if(data.CertificadoImagem)
                    {
                        $certification.src = getCertificationImagePath(data.CertificadoImagem);
                    }
                    $('#Disciplina_Id', $modal).val(disciplinaId);

                    $modal.modal('show');
                });
            },
            getCertificationImagePath = function(imageName){
                return '/uploads/disciplina/' + imageName + '?a=' + (new Date().getTime());
            };

        var onChangeX = function(){
                writeCertificationTextOnCanvas();
            },
            onChangeY = function(){
                writeCertificationTextOnCanvas();
            },
            onKeyupText = function(){
                writeCertificationTextOnCanvas();
            },
            onClickSaveButton = function(){
                saveFormData(function(errors){
                    if(errors)
                    {
                        var message = '<ul>';
                        for(var error in errors)
                        {
                            if(errors.hasOwnProperty(error))
                            {
                                message += "<li>" + errors[error][0] + "</li>";
                            }
                        }
                        message += '</ul>';

                        window.WiAlert('warning', message);
                    }else
                    {
                        $modal.modal('hide');
                    }
                });
            },
            onClickAddCertificationButton = function(e){
                e.preventDefault();

                var disciplinaId = $(this).data('disciplinaid');
                openModal(disciplinaId);
            };

        return {
            init: function(){
                uploadPicture();
                $x.on('change', onChangeX);
                $y.on('change', onChangeY);
                $text.on('keyup', onKeyupText);
                $saveButton.on('click', onClickSaveButton);
                $addCertificationButton.on('click', onClickAddCertificationButton);
                $certification.onload = function(){
                    writeCertificationTextOnCanvas();
                };
            }
        };
    })();

    FormCertificado.init();
});