var Dbx;

$(document).ready(function()
{
	Dbx = (function()
	{
		var $formSendFile = $('#formSendFile'),
			$inputFile = $('#inputFile'),
			$openForm = $('#openForm'),
			$btnDeleteFile = $('a.deleteFile'),
			//modal
			$modalConfirmeSendFile = $('#modalConfirmeSendFile'),
			$nameFile = $('.nameFile'),
			$sendFile = $('#sendFile');

		var openSelectFile = function()
		{
			$inputFile.click();
		},

		showFiles = function(e)
		{
			var files = e.target.files;

			for (var i = 0, f; f = files[i]; i++)
			{

		      var reader = new FileReader();

		      	//Closure to capture the file information.
				reader.onload = (function(theFile)
				{
	        		return function(e)
	        		{
	        			var nameFile = theFile.name;
	        			if(nameFile.length > 35)
	        			{
	        				var lastIndexOf = nameFile.lastIndexOf('.');
        					var ext = nameFile.substr(lastIndexOf);
	        				nameFile = nameFile.substr(0, 27);
	        			}

		            	$nameFile.text(nameFile+'...'+ext);
		            	$nameFile.attr('title', theFile.name);
		        	};
		      	})(f);

		      // Read in the image file as a data URL.
		      reader.readAsDataURL(f);
		    }

			$modalConfirmeSendFile.modal('show');
		},

		sendForm = function()
		{
			$formSendFile.submit();
		},

		deleteFile = function(e)
		{
			e.preventDefault();

			var element = $(this), deletar = confirm('Tem certeza que deseja excluir este arquivo?');

			if(!deletar)
				return false;

			$.get(
				element.attr('href'),
				{},
				function(resposta)
				{
					window.WiAlert(resposta.s, resposta.m);
					
					if(resposta.s === 'success')
						window.location.reload();
				},
				'json'
			);
		};

		return {
			init : function()
			{
				$openForm.on('click', openSelectFile);
				$inputFile.on('change', showFiles);
				$sendFile.on('click', sendForm);
				$btnDeleteFile.on('click', deleteFile);
			}
		}
	})();

	Dbx.init();
});