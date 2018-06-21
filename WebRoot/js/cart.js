	let cartPrice = getPrices()
    function updateNum(id,num,price){  
    	wirtePrice(cartPrice)
        var url = "buy.jsp?op=update&id="+id+"&num="+num+"&price="+price;  
        window.location = url;  
    }
    function getPrices(){
    	let counts = document.getElementsByClassName("count");
    	let sum = 0
    	for(let i = 0; i < counts.length ; i++) {
    		sum +=  Number(counts[i].innerText)
    		console.log(sum);
    	}
		return sum
    }
    function wirtePrice(sum){
    	let prices = document.getElementsByClassName("getPrice")
    	for(let i = 0; i < prices.length ; i++) {
    		prices[i].innerText = sum
    	}
    }
    function initPrice(){
    	wirtePrice(cartPrice)
    }
    initPrice()