$(document).ready(function(){
	"use strict";

	var $filters = $("#filters"),
	$filter = $filters.find("button"),
	$list = $("#listAluno").find("tbody");

	var onClickFilter = function()
        {
            $.post('/aluno/index', $filters.serialize(), function(res)
            {
                $list.children().remove();

                for(var i in res.alunos)
                {
                    if(res.alunos.hasOwnProperty(i))
                    {
                        var tr = $("<tr>").attr("data-aluno",res.alunos[i]['Id']).css("cursor","pointer");

                        //delete res.alunos[i].Id;

                        for(var j in res.alunos[i])
                        {
                            if(res.alunos[i].hasOwnProperty(j))
                            {
                                if(j === 'Id')
                                    continue;

                                var td = $("<td>");

                                if(j === 'Nome')
                                {
                                    var a = $("<a>").attr('data-main-action', true).attr('href', '/aluno/view/id/'+res.alunos[i].Id).html(res.alunos[i].Nome);
                                    td.html(a);
                                }
                                else
                                {
                                    td.html(res.alunos[i][j]);
                                }

                                tr.append(td);
                            }
                        }

                        tr.appendTo($list);
                    }
                }
            
                $("#alunoNome").keyup();
                
                gridEvent();
            },'json');
	};

	var onSelectChanged = function()
    {
        var $self, $turmaOption, $disciplina, $disciplinaOption, selected;

        $disciplina = $("#disciplina");
        $disciplinaOption = $disciplina.find('option');
        $turmaOption = $('#turma').find('option');
        $self = $(this);
        selected = $self.find(":selected").val();

		if($self.attr("id") === 'cliente')
        {
			if(selected === 'T')
            {
                $disciplinaOption.show();
				return;
			}

            $disciplinaOption.show().not("[data-parent='"+selected+"']").hide();
            $disciplinaOption.first().select();
            $disciplina.trigger('change');
			return;
		}

		if($self.attr("id") === 'disciplina')
        {
			if(selected === 'T')
            {
                $turmaOption.show();
				return;
			}

            $turmaOption.show().not("[data-parent='"+selected+"']").hide();
		}
		
	};

	$filters.find("select").change(onSelectChanged);

	$("#alunoNome").keyup(function(){
		var value = $(this).val().toLowerCase();

		$list.find("tr").show();

		$list.find("tr").each(function(){
			var $self = $(this);

			if($self.text().toLowerCase().search(value) < 0)
            {
				$self.hide();
			}
		});
	});

	$filter.on('click',onClickFilter);
});