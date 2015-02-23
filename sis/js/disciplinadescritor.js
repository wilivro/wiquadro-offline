$(function(){
    var $saveDescritor = $('.saveDescritorButton'),
        $alterDescritor = $('.alterDescriptorButton'),
        $removeDescritor = $('.deleteDescriptorButton'),
        $addDescritor = $('.addDescritorButton'),
        $materialReforcoContainer = $('.materialreforco');

    var htmlRow = function(index, id, url, descricao){
            return '<div class="row">' +
                '<div class="col-md-6">' +
                '<div class="form-group">' +
                '<input type="hidden" id="id" name="Links[' + index + '][Id]" value="' + id + '">' +
                '<input type="text" id="url" name="Links[' + index + '][Url]" value="' + url + '" placeholder="URL" class="form-control">' +
                '</div>' +
                '</div>' +
                '<div class="col-md-5">' +
                '<div class="form-group">' +
                '<input type="text" id="descricao" name="Links[' + index + '][Descricao]" value="' + descricao + '" placeholder="Descrição" class="form-control">' +
                '</div>' +
                '</div>' +
                '<div class="col-md-1">' +
                '<div class="form-group">' +
                '<a href="#" style="height: 50px; padding: 14px 12px;" class="btn btn-danger deleteLinkButton"><i class="fa fa-trash-o"></i> Excluir</a>' +
                '</div>' +
                '</div>' +
                '</div>';
        },
        onClickSaveDescritor = function(){
            var formData = $('#descritorForm').serialize();

            $.ajax({
                url: '/disciplina/createDescritor',
                type: 'post',
                dataType: 'json',
                data: formData
            }).done(function(response){
                if(response.s === 'ok')
                {
                    window.WiAlert('success', response.m);

                    setTimeout(function(){
                        location.reload();
                    }, 2000);
                }else
                {
                    var errors = response.o.errors;

                    var errorHtml = '<ul>';
                    for(var attr in errors)
                    {
                        if(errors.hasOwnProperty(attr))
                        {
                            errorHtml += '<li>' + errors[attr][0] + '</li>';
                        }
                    }
                    errorHtml += '</ul>';

                    window.WiAlert('warning', errorHtml);
                }
            });
        },
        onClickAlterDescritor = function(e){
            e.preventDefault();

            var id = $(this).data('id');

            $.ajax({
                type: 'get',
                data: {id: id},
                url: '/disciplina/getDescritor',
                dataType: 'json'
            }).done(function(response){
                var descritor = response.o.descritor,
                    links = response.o.links;

                $materialReforcoContainer.html('');

                for(var attr in descritor)
                {
                    if(descritor.hasOwnProperty(attr))
                    {
                        $('#Descritor_' + attr).val(descritor[attr]);
                    }
                }

                if(links)
                {
                    for(var i=0; i<links.length;i++)
                    {
                        $materialReforcoContainer.append(htmlRow($('.row', $materialReforcoContainer).length, links[i].Id, links[i].Url, links[i].Descricao));
                    }
                }

                location.href = '#novodescritor';
            });
        },
        onClickRemoveDescritor = function(e){
            e.preventDefault();

            if(confirm('Deseja realmente excluir este item?'))
            {
                var id = $(this).data('id');

                $.ajax({
                    type: 'post',
                    data: {id: id},
                    url: '/disciplina/deleteDescritor',
                    dataType: 'json'
                }).done(function(response){
                    if(response.s === 'ok')
                    {
                        window.WiAlert('success', response.m);
                        setTimeout(function(){
                            location.reload();
                        }, 2000);
                    }else
                    {
                        window.WiAlert('warning', response.m);
                    }
                });
            }
        },
        onClickAddDescritor = function(e){
            e.preventDefault();
            $materialReforcoContainer.append(htmlRow($('.row', $materialReforcoContainer).length, '', '', ''));
        },
        onClickDeleteLink = function(e){
            e.preventDefault();
            if(confirm('Deseja realmente excluir este item?'))
            {
                var $row = $(this).closest('.row'),
                    id = $row.find('#id').val();

                if(id)
                {
                    $.ajax({
                        url: '/disciplina/deleteDescritorLink',
                        type: 'post',
                        data: {id: id}
                    });
                }

                $row.remove();
            }
        };

    $saveDescritor.on('click', onClickSaveDescritor);
    $alterDescritor.on('click', onClickAlterDescritor);
    $removeDescritor.on('click', onClickRemoveDescritor);
    $addDescritor.on('click', onClickAddDescritor);
    $materialReforcoContainer.on('click', '.deleteLinkButton', onClickDeleteLink);
});