window.onload=function(){
	var oTitle=document.getElementById('input');
	oTitle.onmousedown=fnDown;
function fnDown(event){
	  event = event || window.event;
	  var oDrag=document.getElementById('box'),
	      disX=event.clientX-oDrag.offsetLeft,
	      disY=event.clientY-oDrag.offsetTop;
	  document.onmousemove=function(event){
	  	event = event || window.event;
	  	fnMove(event,disX,disY);
	  }
	  document.onmouseup=function(){
	  	document.onmousemove=null;
	  	document.onmouseup=null;
	  }
}
	function fnMove(e,posX,posY){
	  var oDrag=document.getElementById('box'),
	      l=e.clientX-posX,
	      t=e.clientY-posY,
	      winW=document.documentElement.clientWidth || document.body.clientWidth,
	      winH=document.documentElement.clientHeight || document.body.clientHeight,
	      maxW=winW-oDrag.offsetWidth,
	      maxH=winH-oDrag.offsetHeight;
	  if(l<0){
	    l=0;
	  }else if(l>maxW){
	    l=maxW;
	  }
	  if(t<0){
	    t=0;
	  }else if(t>maxH){
	    t=maxH;
	  }
	  oDrag.style.left=l+'px';
	  oDrag.style.top=t+'px';
	}

}