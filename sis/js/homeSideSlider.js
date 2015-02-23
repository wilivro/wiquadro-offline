$(document).ready(function(){
	var $btnSideSlider = $(".btnSideSlider");
	var $horizontalImgSlider = $(".layoutTab");
	//var sliderRoll = setInterval(slider,5000);

	$(".carousel").carousel({
		interval:10*1000
	});

	$("[href='#login']").click(function(){
        $("[tabindex='1']").focus();
	});

	$("a.anchor").click(function(event){
        //prevent the default action for the click event
        event.preventDefault();
        //get the full url - like mysitecom/index.htm#home
        var full_url = this.href;

        //split the url by # and get the anchor target name - home in mysitecom/index.htm#home
        var parts = full_url.split("#");
        var trgt = parts[1];

        //get the top offset of the target anchor
        var target_offset = $("#"+trgt).offset();
        var target_top = target_offset.top-85;

        //goto that anchor by setting the body scroll top to anchor top
        $('html, body').animate({scrollTop:target_top}, 1500);
    });

	var onClickBtnSideSlider = function(){
		$btnSideSlider.off();
		var $self = $(this);
		var nextTab = $self.data("slide-index");
		gotoSlide(nextTab);
		
		
	}

	var onClickHorizontalImgSlider = function(){
		$horizontalImgSlider.off();
		var $self = $(this);
		var nextTab = $self.data("slide-index");
		gotoSlideHorizontal(nextTab);
		
	}

	// var onHoverBtnSlide = function(){
	// 	var $self = $(this);
	// 	var nextTab = $self.data("slide-index");
	// 	gotoSlide(nextTab,true);
	// }
	// var onOutBtnSlide = function(){
	// 	clearInterval(sliderRoll);
	// 	sliderRoll = setInterval(slider,5000);
	// }

	var gotoSlide = function(nextTab,pause){
		//clearInterval(sliderRoll);
		var currentTab = $(".btnSideSlider.active").data("slide-index");
		$btnSideSlider.removeClass("active");
		$(".btnSideSlider[data-slide-index='"+nextTab+"']").addClass("active");
		
		$(".slidePaneImg[data-slide-index='"+currentTab+"']").fadeOut(function(){
			$(".slidePaneImg[data-slide-index='"+nextTab+"']").fadeIn(function(){
				$btnSideSlider.on('click',onClickBtnSideSlider);
			});
		});
		//if(!pause) sliderRoll = setInterval(slider,5000);
	}
	var gotoSlideHorizontal = function(nextTab,pause){
		//clearInterval(sliderRoll);
		var currentTab = $(".layoutTab.active").data("slide-index");
		$horizontalImgSlider.removeClass("active");
		$(".layoutTab[data-slide-index='"+nextTab+"']").addClass("active");
		$(".slideTabDiv[data-slide-index='"+currentTab+"']").stop(true,true).fadeOut(function(){
			$(".slideTabDiv[data-slide-index='"+nextTab+"']").stop(true,true).fadeIn();
		});
		$(".slideTab[data-slide-index='"+currentTab+"']").stop(true,true).fadeOut(function(){
			$(".slideTab[data-slide-index='"+nextTab+"']").stop(true,true).fadeIn(function(){
				$horizontalImgSlider.on('click',onClickHorizontalImgSlider);
			});
		});
		//if(!pause) sliderRoll = setInterval(slider,5000);
	}

 	var slider = function(){
		var currentTab = $(".active").data("slide-index");
		var nextTab = (parseInt(currentTab)%5)+1;
		gotoSlide(nextTab);
	}

	


	$btnSideSlider.on('click',onClickBtnSideSlider);
	$horizontalImgSlider.on('click',onClickHorizontalImgSlider);
	// $btnSideSlider.on('mouseover',onHoverBtnSlide);
	// $btnSideSlider.on('mouseleave',onOutBtnSlide);
})