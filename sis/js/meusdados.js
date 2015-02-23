$(function(){
    var MeusDados = (function(){
        var $foto = $('#foto'),
            $status = $('#status'),
            $file = $('#file'),
            $inputFoto = $('#Usuario_Foto'),
            $modal = $('#myModal'),
            $cropping = $('#cropping'),
            $btnCrop = $('#btnCrop'),
            fileName;

        var cX, cY, cW, cH;

        var uploadPicture = function(){
            var timestamp = new Date().getTime();

            new AjaxUpload($foto, {
                action: '/plataforma/uploadpicture?time=' + timestamp,
                name: 'foto',
                onSubmit: function(file, ext){
                    if (! (ext && /^(jpg|png|jpeg|gif)$/.test(ext))){
                        // extension is not allowed
                        status.text('Apenas arquivos JPG, PNG ou GIF são permitidos.');
                        return false;
                    }
                    $status.text('Enviando...');
                },
                onComplete: function(file){
                    fileName = timestamp + '_' + file;

                    $status.text('');
                    $inputFoto.val(fileName);

                    showPictureForCropping();
                }
            });
        },
        showPictureForCropping = function(){
            $modal.modal('show');
            $cropping
                .html('<img src="/uploads/usuario/'+fileName+'?a='+(new Date().getTime())+'" class="imageForCropping" alt="">')
                .find('.imageForCropping')
                .Jcrop({
                    aspectRatio: 1,
                    onSelect: function updateCoords(c){
                        cX = c.x;
                        cY = c.y;
                        cW = c.w;
                        cH = c.h;
                    }
                }, function(){ // ready
                    //var widthImage = $('.imageForCropping:last').width();
                    //$modal.width(widthImage).css({marginLeft: (widthImage / 2) * -1});
                });
        },
        cropPicture = function(){
            $.ajax({
                type: 'post',
                url: '/plataforma/croppicture',
                data: {picture: fileName, x: cX, y: cY, w: cW, h: cH}
            }).done(function(){
                $file.find('img').attr('src', '/uploads/usuario/' + fileName + '?a='+(new Date().getTime()));
                $modal.modal('hide');
            });
        };

        var onClickBtnCrop = function(){
            cropPicture();
        };

        return {
            init: function(){
                uploadPicture();
                $btnCrop.on('click', onClickBtnCrop);
            }
        };
    })();

    MeusDados.init();
});
