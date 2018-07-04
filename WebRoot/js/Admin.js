	var clean = document.getElementById("clean");
    clean.onclick=function(){
       window.location="clean.jsp"; 
    }
    let btn2 = document.getElementById('btn1')
    let btn1=document.getElementById('btn')
    let btn3=document.getElementById('btn2')
    let change=document.getElementsByClassName('onChange')
    let table=document.getElementById('tableOne')
    let tableTwo=document.getElementById('tableTwo')
    let price=document.getElementsByClassName('price')
    btn2.onclick=function(){
    	table.style.display='none'
    	tableTwo.style.display='block'
    }
    btn3.onclick=function(){
    	table.style.display='block'
    	tableTwo.style.display='none'
    }
    for(let i=0;i<change.length;i++){
    	change[i].onclick=function(){
    	price[i].style.display="block"
    	change[i].style.display="none"
    	}
    }



let btn=document.getElementById('btnSubmit');
let form =document.getElementById('tableTwo');
let inputs =form.getElementsByTagName('input');
console.log(inputs.length);
btn.onclick=function(){
	let url= getUrl();
	form.action= url;
}
let cleanButton = inputs[4];
cleanButton.onclick = cleanInputs;
function updatePrice(id,price){  
    var url = "management.jsp?option=update&id="+id+"&price="+price;  
    window.location = url;  
}
function getUrl(){  
    let name = inputs[1].value;
    let info = inputs[2].value;
    let price = inputs[3].value;
    let url = "add.jsp?&name="+name+"&info="+info+"&price="+price;
    console.log(url);
    return url;
}
function cleanInputs (){
	inputs[0].value = '';
	inputs[1].value = '';
	inputs[2].value = '';
	inputs[3].value = '';
}
