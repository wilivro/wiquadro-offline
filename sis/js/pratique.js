$(document).ready(function(){
	var $questList = $("#questList");

	var onClickQuest = function(){
		var $self = $(this);
		var alunoturma = $('#alunoturma').val();
		var edc = $self.data("edc");
		var questao = $self.data('questao');
		window.location.href = "/plataforma/exercicio/alunoturma/"+alunoturma+"/edc/"+edc+"/questao/"+questao;
	};

	$questList.on('click','.row[data-questao]',onClickQuest);
});