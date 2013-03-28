function openFrame(_href,_wi,_hei){
	
		$('body').prepend('<div id="OVERALLBGFRAME" class="LOADING" style="background: none repeat scroll 0 0 white;left: 50%;top: 50%;z-index: 1501;"></div><iframe id="IFRAMEBOX" frameborder="0" style="background: none repeat scroll 0 0 #fff;height: 100%;left: 0;top: 0;width: 100%;z-index: 1500;margin-left:-'+Math.round(_wi*0.5)+'px" height="0" width="'+_wi+'" scrolling="auto" src="'+_href+'"></iframe><a href="javascript:void(0)" id="CLOSERFRAME">CLOSE</a>');
		
		
		$('#OVERALLBGFRAME').css({opacity:0.9});
		$('#IFRAMEBOX').css({opacity:0});
		$('#CLOSERFRAME').css({opacity:0});
		
		$('#OVERALLBGFRAME,#CLOSERFRAME').bind('click',function(){
		closeFrame()
		});
		$('#IFRAMEBOX').bind('load',function(){
				$('#OVERALLBGFRAME').removeClass('LOADING');
				
				
								
				$('#IFRAMEBOX').unbind('load');
				$('#IFRAMEBOX').css({height:'300px',marginTop:Math.round(100*-0.5)+'px'});
				
				$('#CLOSERFRAME').css({marginTop:Math.round((100*-0.5)-10)+'px',marginLeft:Math.round((_wi*0.5)-14)+'px'});
				
				$('#IFRAMEBOX,#CLOSERFRAME').animate({opacity:1},400);
				
			
				
		})
		
		
		
}

function closeFrame(){
	if(allowCloseFrame==true){
$('#OVERALLBGFRAME, #IFRAMEBOX,#CLOSERFRAME').remove();
	}
}
