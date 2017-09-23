$(function(){
		$(".menu_list").hide();
		$(".menu_list_first").show();
		$(".a_list").click(function(){
			var len = $('.a_list').length;
			var index = $(".a_list").index(this);
			for(var i=0;i<len;i++){
				if(i == index){
					$('.menu_list').eq(i).slideToggle(300);
					}else{
						$('.menu_list').eq(i).slideUp(300);
					}
				}
			});
	})
	
	$(function(){
		$(".menu-oc").click(function(){
			$(".leftmenu1").animate({left:"-292px"})	;
			$(".leftmenu2").animate({left:"0px"})
			$(".rightcon").css("margin-left","52px")
		})
		$(".menu-oc1").click(function(){
			$(".leftmenu1").animate({left:"0px"})	;
			$(".leftmenu2").animate({left:"-192px"});
			$(".rightcon").css("margin-left","240px");
		})		
	})
	
	$(function(){
		$(".j_menu_list").hide();
		$(".j_a_list").hover(function(){
			$(".leftmenu2 ul li").hover(function(){
				$(this).find('.j_menu_list').show();	
			},function(){
				$(this).find('.j_menu_list').hide();
			});
		})
	})
	
	