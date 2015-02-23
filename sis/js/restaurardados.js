$(function(){
    "use strict";

    var RestaurarDados = (function(){
        var $backupsListGrid = $('#backupsListGrid'),
            updateButton = '.updateButton';

        var updateMainDatabaseWithBackupData = function(backupId){
            return $.ajax({
                url: '/restaurardados/updateMainDatabaseWithBackupData',
                type: 'post',
                data: {backupId: backupId},
                dataType: 'json'
            });
        };

        var onClickUpdateButton = function(e){
            e.preventDefault();

            if(window.confirm('Deseja atualizar o servidor com os dados desse backup?'))
            {
                var backupId = $(this).attr('href');
                updateMainDatabaseWithBackupData(backupId).done(function(data){
                    console.log(data);
                });
            }
        };

        return {
            init: function(){
                $backupsListGrid.on('click', updateButton, onClickUpdateButton);
            }
        };
    })();

    RestaurarDados.init();
});