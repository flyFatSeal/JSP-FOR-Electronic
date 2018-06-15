    var open = document.getElementById("search");
    var beijing = document.getElementById("beijing");
    var disappear = document.getElementById("disappear");
    var cart = document.getElementById("cart");
    var login = document.getElementById("login");
    var dianji = document.getElementsByClassName("dianji1");
    var state = document.getElementById("state");
    var login1 = document.getElementById("login1");
    var cart1 = document.getElementById("cart1");
     dianji[1].onmouseover=function(){
        login.style.display="block"
    };
    dianji[1].onmouseout=function(){
        login.style.display="none"
    };
    dianji[2].onmouseover=function(){
        cart.style.display="block"
    };
    dianji[2].onmouseout=function(){
        cart.style.display="none"
    };
     dianji[0].onclick=function(){
        open.style.display="block";
        beijing.style.display="block";
        disappear.style.display="none";

    };
    if(state.value==1){
       console.log();
       login1.href="personal.jsp";
       cart1.href="cart.jsp";
     }