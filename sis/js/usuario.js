$(document).ready(function(){

    var User = (function(){
        // selectors
        var $assignmentsContainer = $('#permissoes');
        var $buttonAddProjectAndUserGroup = $('#addUserGroup');
        var $dropDownProject = $('#projeto');
        var $dropDownUserGroup = $('#grupo_usuario');
        var $dropDownCliente = $('#cliente');
        var $buttonAddAssignments = $('#addAssignments');
        var $btnSaveUser = $('.btnSaveUser');
        var $permissionsTabs = $('#permissionsTabs');
        var hasOpenedTab = {};
        var userId = $('#Usuario_Id').val(),
            trees = [],
            tabWasOpened = [];

        // flag to check if there were changes in the current open tab
        var TAB_CHANGED = false;

        // business functions
        var setTooltipForDeleteIcon = function($icon){
            $icon.tooltip({title: 'Remover'});
        },
        setCssForDeleteIcon = function($icon){
            $icon.css({cursor: 'pointer'});
        },
        setDeleteIconSettings = function(){
            var $icon = $assignmentsContainer.find('.icon-trash');

            setTooltipForDeleteIcon($icon);
            setCssForDeleteIcon($icon);
        },
        checkForCheckboxesAlreadyChecked = function(){
            var $checkedCheckboxes = $('input[type="checkbox"]:checked');

            if($checkedCheckboxes.length)
            {
                checkClosestCheckBoxes($checkedCheckboxes);
            }
        },
        checkClosestCheckBoxes = function(self){
            var li = self.closest('li'),
                check = function(checked){
                    li.find('input[type="checkbox"]').attr('checked', checked);
                };

            if(self.is(':checked'))
            {
                check(true);
            }
            else
            {
                check(false);
                uncheckParentCheckBoxes(self);
            }
        },
        uncheckParentCheckBoxes = function(check)
        {
            var parent = check.data('father');

            if(parent !== '')
            {
                var activeTab = check.closest('.tab-pane');
                var parentElement = $('#'+parent, activeTab).attr('checked', false);
                uncheckParentCheckBoxes(parentElement);
            }
            checkChildrenCheckBoxesOfDifferentRoles(check);
            return false;
        },
        checkChildrenCheckBoxesOfDifferentRoles = function(checkbox){
            var activeTab = checkbox.closest('.tab-pane');
            var checkboxId = checkbox.attr('id');
            var isChecked = checkbox.is(':checked');

            if(checkboxId == 'supervisor' && isChecked)
            {
                $('#professor', activeTab).attr('checked', true).trigger('change');
            }

            if(checkboxId == 'admin' && isChecked)
            {
                $('#professor', activeTab).attr('checked', true).trigger('change');
                $('#supervisor', activeTab).attr('checked', true).trigger('change');
            }
            if(checkboxId == 'wilivro' && isChecked)
            {
                $('#professor', activeTab).attr('checked', true).trigger('change');
                $('#supervisor', activeTab).attr('checked', true).trigger('change');
                $('#admin', activeTab).attr('checked', true).trigger('change');
            }
            if(checkboxId == 'professor' && !isChecked)
            {
                $('#supervisor', activeTab).attr('checked', false);
                $('#admin', activeTab).attr('checked', false);
                $('#wilivro', activeTab).attr('checked', false);
            }

            if(checkboxId == 'supervisor' && !isChecked)
            {
                $('#admin', activeTab).attr('checked', false);
                $('#wilivro', activeTab).attr('checked', false);
            }
            if(checkboxId == 'admin' && !isChecked)
            {
                $('#wilivro', activeTab).attr('checked', false);
            }

            // if(checkboxId != 'admin' && !isChecked)
            // {
            //     $('#admin', activeTab).attr('checked', false).trigger('change');
            // }
        },
        reloadAuthAssignmentTabs = function(output){
            $assignmentsContainer.html(output);
            assignmentsContainerSettings();
        },
        deleteAuthAssignments = function(project){
            if(confirm('Deseja realmente excluir as permissões para este Projeto?'))
            {
                var projectId = project.data('idprojeto');

                var userProjectId = userId;

                if(projectId)
                {
                    userProjectId += '-' + projectId;
                }

                $.when(
                    deleteUserUserGroup(userId, projectId),
                    deleteUserAssignments(userProjectId)
                ).done(function(){
                    $.post('/usuario/loadAssignmentTabs', {userId: userId}, reloadAuthAssignmentTabs);
                });
            }
        },
        deleteUserUserGroup = function(userId, projectId){
            return $.post('/usuario/deleteUserUserGroup', {userId: userId, projectId: projectId});
        },
        deleteUserAssignments = function(userProjectId){
            return $.post('/usuario/deleteUserAssignments', {userProjectId: userProjectId});
        },
        addProjectAndUserGroupForUser = function(){
            var project = $dropDownProject.val(),
                userGroup = $dropDownUserGroup.val(),
                cliente = $dropDownCliente.val();
        
            var tabDescription = (project ? $dropDownCliente.find('option:selected').text()+' - '+$dropDownProject.find('option:selected').text() + ' - ' : '') + ($dropDownUserGroup.find('option:selected').text()),
                tabId = 'tab'+project+''+userGroup;

            if(userGroup && isUserGroupWithoutPermission(userGroup))
            {
                project = '';
                tabId = 'tab'+userGroup;
                tabDescription = $dropDownCliente.find('option:selected').text()+' - '+$dropDownUserGroup.find('option:selected').text();
            }else
            {
                if(project == '' || userGroup == '')
                {
                    window.WiAlert("warning", "Selecione o Projeto e o Grupo de usuário.");
                    return;
                }

                if($permissionsTabs.find('.tab-content').find('[data-projeto="' + project + '"]').length)
                {
                    window.WiAlert("warning", "Só é permitido um grupo por projeto.");
                    return;
                }
            }

            $permissionsTabs.find('.nav-tabs').append('<li data-projeto="' + project + '" data-grupousuario="' + userGroup + '" data-cliente="'+cliente+'"><a href="#' + tabId + '" role="tab" data-toggle="tab">'+tabDescription+' <i title="Excluir" class="btn awesome-tooltip buttonDeleteUserGroup fa fa-trash-o"></i></a></li>');
            $permissionsTabs.find('.tab-content').append('<div class="tab-pane" id="' + tabId + '" data-projeto="' + project + '"><div class="row"><div class="col-md-12"><div class="tree"></div></div></div></div>');

        },
        addUserAssignments = function(){
            var checkBoxesFromActiveTab = $('.tab-content .active input[type="checkbox"]:checked').serialize();
            checkBoxesFromActiveTab += '&userId=' + userId;
            checkBoxesFromActiveTab += '&projectId=' + $assignmentsContainer.find('.nav.nav-tabs li.active').attr('id');

            var successMessage = function(){
                window.WiAlert("success", 'Permissões salvas com successo.');
            };

            $.post('/usuario/addUserAssignments', checkBoxesFromActiveTab).done(successMessage);
        },
        tabHasChangedAndModified = function(tab){
            var activeTab = tab.siblings('.active').length;
            return ((!tab.hasClass('active') && activeTab > 0) && (TAB_CHANGED === true));
        },
        saveChangesInActiveTab = function(){
            if(confirm('Deseja salvar as configurações desta aba antes de sair?'))
            {
                addUserAssignments();
            }
        },
        isUserGroupWithoutPermission = function(userGroup){
            var adminRole = 3,
                wilivroRole = 5,
                alunoRole = 4,
                responsavelRole = 6,
                ids = [adminRole, alunoRole, wilivroRole, responsavelRole];

            return ids.indexOf(+userGroup) !== -1;
        },
        assignmentsContainerSettings = function(){
            checkForCheckboxesAlreadyChecked();
            setDeleteIconSettings();
        };

        // events functions
        var onChangeCheckBoxes = function(){
            var self = $(this);
            checkClosestCheckBoxes(self);
            checkChildrenCheckBoxesOfDifferentRoles(self);
            TAB_CHANGED = true;
        },
        onClickIcons = function(){
            var self = $(this);
            deleteAuthAssignments(self);
        },
        onClickButtonAddProjectAndUserGroup = function(){
            addProjectAndUserGroupForUser();
        },
        onClickButtonAddAssignments = function(){
            var self = $(this);
            addUserAssignments(self);
            TAB_CHANGED = false;
        },
        onClickTabs = function(e){
            var self = $(this);

            // if tab is disabled, it doesn't open
            if(self.hasClass('disabled'))
            {
                e.preventDefault();
                e.stopPropagation();
            }

            var tabContentId = $('a', self).attr('href');
            var checkboxChecked = $('#professor:checked, #supervisor:checked, #admin:checked', tabContentId);
            checkChildrenCheckBoxesOfDifferentRoles(checkboxChecked);

            if(tabHasChangedAndModified(self))
            {
                saveChangesInActiveTab();
                TAB_CHANGED = false;
            }
        },
        onChangeDropDownUserGroup = function(){
            var userGroup = $(this).val();
            // project dropdown gets disabled whether user group is admin or wilivro.
            $dropDownProject.attr('disabled', isUserGroupWithoutPermission(userGroup));
        },
        onChangeDropDownCliente = function(){
            var id = $(this).val();
            getProjectsByClient(id);
        },
        getProjectsByClient = function(id){
            if(id)
            {
                $.ajax({
                    url: '/usuario/getClientListByProject',
                    type: 'get',
                    data: {clienteId: id},
                    dataType: 'json'
                }).done(function(dataList){
                    $dropDownProject.html('<option value="">Selecione</option>');
                    $.each(dataList, function(index, description){
                        $dropDownProject.append('<option value="' + index + '">' + description + '</option>');
                    });
                });
            }
        },
        removeUserGroup = function($element){

            var $tab =  $element.closest('li'), $tabContent = $($tab.find('a').attr('href')), projetoId = $tab.data('projeto');

            var removeDOM = function(){
                $tabContent.remove();
                $tab.remove();
            };

            removeDOM();
            tabWasOpened.splice(tabWasOpened.indexOf(projetoId), 1);

            if(userId && projetoId)
            {
                $.ajax({
                    type: 'post',
                    dataType: 'json',
                    url: '/usuario/removeUserGroup',
                    data: {usuarioId: userId, projetoId: projetoId}
                }).done(function(data){
                    window.WiAlert(data.type, data.message);
                });
            }
        };

        // public API
        return {
            init: function(){
                // do all bindings and stuff
                assignmentsContainerSettings();

                $permissionsTabs.on('click', '.buttonDeleteUserGroup', function(){
                    if(window.confirm("Tem certeza que deseja remover esse grupo?"))
                    {
                        removeUserGroup($(this));
                    }
                });

                $btnSaveUser.on('click', function(){
                    var personalDataUser = [], userGroups = [], permissions = [];

                    $.each($('[id^="Usuario_"]'), function(){
                        personalDataUser.push({attribute: $(this).attr('name').split('[').pop().split(']').shift(), value:$(this).val()});
                    });

                    $('.nav-tabs', '#permissionsTabs').find('li').each(function(index, item){
                        var $self = $(item);
                        userGroups.push({projeto: $self.data('projeto'), grupousuario: $self.data('grupousuario'), cliente: $self.data('cliente')});
                    });

                    for(var tree in trees)
                    {
                        if(trees.hasOwnProperty(tree))
                        {
                            try
                            {
                                var treeInstance = trees[tree].fancytree('getTree');
                                var selectedNodes = treeInstance.getSelectedNodes();
                                var nodes = [];

                                for(var node in selectedNodes)
                                {
                                    if(selectedNodes.hasOwnProperty(node))
                                        nodes.push(selectedNodes[node].key);
                                }

                                permissions.push({projeto: trees[tree].closest('.tab-pane').data('projeto'), items: nodes});
                            }catch(e)
                            {

                            }
                        }
                    }

                    var generalData = {
                        personalUserData: personalDataUser,
                        userGroups: userGroups,
                        permissions: permissions
                    };

                    $.ajax({
                        url: '/usuario/saveUserData',
                        type: 'post',
                        data: generalData,
                        dataType: 'json'
                    }).done(function(data){
                        window.WiAlert(data.type, data.message);

                        if(!userId && data.type === 'success')
                        {
                            window.location = '/usuario/index';
                        }
                    });
                });

                $assignmentsContainer.on('click', '.fa-trash', onClickIcons);
                $assignmentsContainer.on('click', '.nav.nav-tabs li', onClickTabs);
                //$assignmentsContainer.on('change', 'input[type="checkbox"]', onChangeCheckBoxes);

                $buttonAddProjectAndUserGroup.on('click', onClickButtonAddProjectAndUserGroup);
                //$buttonAddAssignments.on('click', onClickButtonAddAssignments);
                $dropDownUserGroup.on('change', onChangeDropDownUserGroup);

                $dropDownCliente.on('change', onChangeDropDownCliente);

                var clienteId = $dropDownCliente.val();

                if(clienteId)
                {
                    getProjectsByClient(clienteId);
                }

                $assignmentsContainer.on('shown.bs.tab', 'a[data-toggle="tab"]', function(e){
                    // e.target // activated tab
                    // e.relatedTarget // previous tab
                    var $this = $(this),
                        tabContentId = $this.attr('href'),
                        $li = $this.closest('li'),
                        projectId = $li.data('projeto'),
                        grupoUsuarioId = $li.data('grupousuario');

                    if(isUserGroupWithoutPermission(grupoUsuarioId))
                    {
                        return false;
                    }

                    if(tabWasOpened.indexOf(projectId) === -1)
                    {
                        $.ajax({
                            url: '/usuario/getTreePermissions',
                            type: 'get',
                            data: {userId: userId, projectId: projectId},
                            dataType: 'json'
                        }).done(function(source){
                            var currentTree = $(tabContentId).find('.tree').fancytree({
                                checkbox: true,
                                selectMode: 3,
                                icons: false,
                                select: function(event, data){
                                    var treeInstance = currentTree.fancytree('getTree');

                                    if(data.node.selected === true)
                                    {
                                        if(data.node.key === 'supervisor')
                                        {
                                            treeInstance.getNodeByKey('professor').setSelected(true);
                                        }

                                        if(data.node.key === 'admin')
                                        {
                                            treeInstance.getNodeByKey('supervisor').setSelected(true);
                                            treeInstance.getNodeByKey('professor').setSelected(true);
                                        }

                                        if(data.node.key === 'wilivro')
                                        {
                                            treeInstance.getNodeByKey('admin').setSelected(true);
                                            treeInstance.getNodeByKey('supervisor').setSelected(true);
                                            treeInstance.getNodeByKey('professor').setSelected(true);
                                        }
                                    }
                                },
                                source: source
                            });

                            trees.push(currentTree);
                        });

                        tabWasOpened.push(projectId);
                    }
                });
            }
        };
    })();

    User.init();
});