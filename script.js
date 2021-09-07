function gestoreCartolina1(){
	try{
		contenuto2.style.display='none';
		contenuto1.style.display='inline';
		//alert("sintassi corretta");
		} catch (e){
		alert ("gestoreCartolina1 "+e);
	}
}
function gestoreCartolina2(){
	try{
		contenuto1.style.display='none';
		contenuto2.style.display='inline';
		//alert("sintassi corretta");
		} catch (e){
		alert ("gestoreCartolina2 "+e);
	}
}


var contenuto1;
var contenuto2;

function gestoreLoad(){                                                              
	try {
		cartolina1=document.getElementById("c1");
		contenuto1=document.getElementById("cart1");
		cartolina1.onclick = gestoreCartolina1;

		cartolina2=document.getElementById("c2");
		contenuto2=document.getElementById("cart2");
		cartolina2.onclick = gestoreCartolina2;		
		//alert("sintassi corretta");
	} catch (e){
		alert ("gestoreLoad "+e);
	}
}
window.onload=gestoreLoad;
