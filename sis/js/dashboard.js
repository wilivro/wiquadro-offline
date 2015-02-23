/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var Gridster;

$(document).ready(function()
{
    var DashBoard = (function()
    {
        var $ulDashBoard = $('#ul-dashBoard');
        var arrastou = false;
        var initGridster = function()
        {
            Gridster = $ulDashBoard.gridster(
            {
                widget_margins: [5, 5],
                widget_base_dimensions: [140, 140],
                serialize_params: function ($w, wgd)
                {
                    return {Coluna:wgd.col, Linha:wgd.row, IdWidget: $w.data('idwidget')};
                },
                draggable:
                {
                    start: function(e, ui, widget)
                    {
                        arrastou = true;
                    },
                    stop: function(e, ui, widget)
                    {
                        savePosicaoWidgets();
                    }
                }
            }).data('gridster');
        };
        
        var savePosicaoWidgets = function()
        {
            console.log(Gridster.serialize());
            $.post
            (
                '/widget/ordem',
                { items: Gridster.serialize() },
                function(r)
                {
                    r = JSON.parse(r);
                    
                    if(r.s == 'error')
                        window.WiAlert(r.s, r.m);
                }
            );
        };
        
        var verificarLinks = function(e)
        {   
            var $element = $(this), funcao = $element.data('function'), id = $element.attr('id');
            
            if (arrastou)
            {
                e.preventDefault();
            }
            else if(funcao.length > 0)
            {
                e.preventDefault();
                eval(funcao+'('+id+')');
            }
            arrastou = false;
        };

        var openAtendimentoPopup = function(id)
        {
            window.open($(id).attr('href'), 'atendimento', 'width=350,height=500');
        };

        var openChatModal = function(id)
        {
            var chatUrl = $(id).attr('href');
            var $chatModal = $('#chatModal');

            $chatModal.find('iframe').attr('src', chatUrl);
            $chatModal.modal('show');
        };
        
        var simulaClick = function()
        {
            var $element = $(this);
            $element.prev()[0].click();
        };
        
        return {
            init: function()
            {
                initGridster();
                $('li > a').on('click', verificarLinks);
//                $('#btnAtendimento').on('click', openAtendimentoPopup);
//                $('#btnChat').on('click', openChatModal);
                $('.tooltipDashBoard').on('click', simulaClick);
            }
        };
    })();

    DashBoard.init();
});