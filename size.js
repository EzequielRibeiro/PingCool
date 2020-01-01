

var screenRef = 420;

function size(value,screenSize){
	  
	  var ref = 1;
	
	  if(screenSize > 1)
      ref = (screenSize * 1) / screenRef;
          
     return Math.round(value * ref);	  
		
	
	
}
