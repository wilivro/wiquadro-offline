var Certificado = (function(){
    var $certificationCanvas = $('#certificationCanvas'),
        $newCertification = $('#newCertification');

    var createCertificationImage = function(x, y, text, image){
        var certification = new Image();
        certification.onload = function(){
            $certificationCanvas.attr('width', certification.width);
            $certificationCanvas.attr('height', certification.height);

            var context = $certificationCanvas[0].getContext('2d');
            context.drawImage(certification, 0, 0);
            context.font = '14px Arial';

            var yLine = +y;
            text.split(/\r?\n/g).forEach(function(linha){
                context.fillText(linha, x, yLine);
                yLine += 16;
            });

            $newCertification.attr('src', $certificationCanvas[0].toDataURL());
        };
        certification.src = image;
    };

    return {
        init: function(data){
            if(data.x != '' && data.y != '' && data.text != '' && data.image != '')
            {
                createCertificationImage(data.x, data.y, data.text, data.image);
            }
        }
    };
})();