$(function(){
    
    
    $("[data-type='radio-progress']").radioProgress();
    var $treeTable = $('section.edc-tree');

    // assuming the format yyyy-mm-dd
    var dateBR = function(date)
    {
        if(date === null)
            return '-';

        date = new Date(date);
        var mes = date.getMonth()+1;
        mes = mes < 10 ? '0'+mes : mes;

        return date.getUTCDate()+'/'+mes+'/'+date.getFullYear();
    },
    getChildren = function(e)
    {
        //e.stopPropagation();
        var $a = $(this),
            idPai = $a.closest('.panel-default').attr('id'),
            parentTrElement = $a.closest(".panel-default").find('[data-pai="'+idPai+'"]');

            var $collapse = $a.closest(".panel-default").children(".panel-collapse");

        if ($a.closest('li').find('ul').length > 0 || parentTrElement.length > 0)
        {
            var $i = $a.children('i');

            if($i.hasClass('fa-chevron-down'))
            {
                parentTrElement.removeClass('hide');
                $i.closest('li').find('ul').removeClass('hide');
                $i.removeClass('fa-chevron-down').addClass('fa-chevron-up');
            }else
            {
                parentTrElement.addClass('hide');
                $i.closest('li').find('ul').addClass('hide');
                $i.removeClass('fa-chevron-up').addClass('fa-chevron-down');
            }

            return false;
        }

        $collapse.collapse('show');

        $.get($a.attr('href'), {}, showChildrenTable, 'json');

        return false;
    },
    showChildrenTable = function(r)
    {

        if(!r.acao)
        {
            window.WiAlert('error', r.mensagem);
            return false;
        }

        var $trPai, $trAfter = 0;

        $.each(r.Edcs, function(index, obj)
        { 
            obj.LastQuestaoRespondida = parseInt(obj.LastQuestaoRespondida);
            obj.qtdQuestoes = parseInt(obj.qtdQuestoes);
            $trPai = $('div#'+obj.IdEdc);

            var $tr = $trPai.clone();
            $tr.children('.panel-collapse').children().remove();
            var progress = obj.LastQuestaoRespondida > 0 ? Math.round((obj.LastQuestaoRespondida * 100) / obj.qtdQuestoes, -2) : obj.LastQuestaoRespondida;
            var progressE = obj.QuestoesErradas > 0 ? Math.round((obj.QuestoesErradas * 100) / obj.qtdQuestoes, -2) : obj.QuestoesErradas;

            var $collapse = $trPai.children(".panel-collapse");
            console.log($collapse);
            var $aGetChildren = $tr.find('a.getChildren');

            $trAfter = $trAfter === 0 ? $trPai : $trAfter.next();

            if(obj.qtdChildren > 0)
            {
                $aGetChildren.removeClass('hide').attr('href', '/plataforma/getChildrenEdcPratique/alunoturma/'+$('#alunoturmaid').val()+'/idedc/'+obj.Id).find('i').attr('class', 'fa fa-chevron-down');
            }else
            {
                $aGetChildren.addClass('hide');
            }

            var edcUrl = obj.qtdQuestoes > 0 ? '/pratique/questoes/alunoturma/' + $('#alunoturmaid').val() + '/edc/' + obj.Id : 'javascript:;';

            $tr.attr('id', obj.Id).attr('data-pai', obj.IdEdc);
            $tr.find('.edc-row-container').css({
            	marginTop:5,
            	marginBottom:0
            });
            $tr.find('a.viewEdc').attr('href', edcUrl).text(obj.Titulo);
            $tr.find('div.radioProgress.success')
                .attr('data-value-now',progress)
                //.attr('data-radio','22')
                .radioProgress()
                .tooltip();
            $tr.find('div.radioProgress.error')
                .attr('data-value-now',progressE ? progressE : 0)
                //.attr('data-radio','22')
                .radioProgress()
                .tooltip();
            $tr.find('span.pagina').text(obj.LastQuestaoRespondida+'/'+obj.qtdQuestoes);
            
            
            //show EDC
            $tr.appendTo($collapse)
            //$tr.find('.edc-text-container').css({
            //    width:$tr.find('.edc-text-container').width() + 5,
            //    marginLeft:"+=10"
            //});
            $trPai.find('i').first().removeClass('fa-chevron-down').addClass('fa-chevron-up');
        });
    };

    $treeTable.on('click', 'a.getChildren', getChildren);
});