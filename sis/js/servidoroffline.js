$(function(){
    "use strict";

    var OfflineServer = (function(){
        var $newServerButton = $('#newServerButton'),
            $modal = $('#modalCreate'),
            $updateButton = $('.updateButton'),
            $saveButton = $('#saveButton');

        var openModal = function(){
            $modal.modal('show');
        },
        loadOfflineServerData = function(id){
            return $.ajax({type: 'post', dataType: 'json', data: {id: id}, url: '/cliente/loadOfflineServerData'});
        },
        saveOfflineServerData = function(){
            var data = $(':input, :hidden', $modal).serialize();
            return $.ajax({type: 'post', dataType: 'json', data: data, url: '/cliente/saveOfflineServerData'});
        },
        resetModalForm = function(){
            $('#Servidoroffline_Titulo, #Servidoroffline_Descricao', $modal).val('');
        },
        fillOutModalForm = function(data){
            $.each(data, function(index, value){
                $('#Servidoroffline_' + index).val(value);
            });
        },
        onClickNewServerButton = function(){
            resetModalForm();
            openModal();
        },
        onClickUpdateButton = function(e){
            e.preventDefault();

            var id = $(this).attr('href');

            loadOfflineServerData(id)
            .done(function(data){
                resetModalForm();
                fillOutModalForm(data.o.data);
                openModal();
            });
        },
        onClickSaveButton = function(){
            saveOfflineServerData().done(function(data){
                if(data.s === 'ok')
                {
                    window.WiAlert("success", data.m);
                    window.location.reload();
                }else
                {
                    var msg ='<ul>';
                    $.each(data.o.errors, function(field, msgs){
                        msg += '<li>' + msgs[0] + '</li>';
                    });
                    msg += '</ul>';

                    window.WiAlert("warning", msg);
                }
            });
        };

        return {
            init: function(){
                $newServerButton.on('click', onClickNewServerButton);
                $updateButton.on('click', onClickUpdateButton);
                $saveButton.on('click', onClickSaveButton);
            }
        };
    })();

    OfflineServer.init();
});