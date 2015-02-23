/*
	seleciona linha da objeto list-widget
	atribuir type="list-widget" ex:
	<table type="list-widget">...</table>
	ou
	<ul type="list-widget">...</ul>

	no link principal, ou na ação principal atribuir data-main-action="true" ex:
	<a data-main-action="true" href="#">...</a>

	@autor sergio filipe
*/
var gridEvent = function(){
	"use strict";

    var $hg = 'td',
    $listWidget = $(".list-widget"),
	$listWidgetCell = $listWidget.find("tbody").find('td'),
	$listWidgetRow = $listWidget.find("tbody").find('tr');

	if(!$listWidgetCell.length){
		$listWidgetCell = $listWidget.find("div");
	}
	if(!$listWidgetRow.length){
		$listWidgetRow = $listWidget.find("li");
		$hg = 'div';
	}
	
	$listWidgetRow.css("cursor","pointer");

	$listWidgetRow
		.mouseenter(function(){
			$(this).css('background','#f9f9f9');
			
		})
		.mouseleave(function(){
			$(this).css('background','#FFF');
		});
	$listWidget.parent().on('click', $hg, function(){
        if(!$(this).find("a").length)
        {
            var action = $(this).parent().find("[data-main-action]").attr("href");
            if(action)
            {
                window.location = action;
            }
        }
    });
}
$(document).ready(function(){
	gridEvent();
});