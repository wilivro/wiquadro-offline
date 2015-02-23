$(function(){
	$curso = $(".w-curso");

	var onMouseEnterCurso = function(){
		$self = $(this).find(".w-curso");
		$self
			.removeClass("col-md-12")
			.addClass("col-md-7")
			.closest(".w-curso")
			.css({
				height:80
		 	});
		$self.find(".arrowBefore").hide();
		$self.find(".arrowAfter").show();
		// $self.find(".trimed").hide();
		// $self.find(".descricao").show();
		$self.find(".resumo").css({
			display:"block"
		});

		$self.parent().find(".icons-acoes").parent().show();


	}
	var onMouseLeaveCurso = function(){
		$self = $(this).find(".w-curso");
		$self
			.addClass("col-md-12")
			.removeClass("col-md-7")
			.closest(".w-curso")
			.css({
				height:50
		 	});
		$self.find(".arrowBefore").show();
		$self.find(".arrowAfter").hide();
		// $self.find(".trimed").hide();
		// $self.find(".descricao").show();
		$self.find(".resumo").css({
			display:"table-cell"
		});

		$self.parent().find(".icons-acoes").parent().hide();


	}

	$curso.parent().on('mouseenter',onMouseEnterCurso);
	$curso.parent().on('mouseleave',onMouseLeaveCurso);
})