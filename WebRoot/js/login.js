	function showBtn() {
		var oBtn = document.getElementById('a');
		var get = document.getElementById("div1");
		var get1 = document.getElementById("div2");
		oBtn.onclick = function() {
			get.style.display = "none";
			get1.style.display = "block";
		}
	}
	showBtn(this);
	var password = document.getElementById("pass");
	var password1 = document.getElementById("pass1");
	var i = document.getElementsByClassName("login");
	i[1].onclick = function() {
		if (password1.value != password.value) {
			alert("您的密码不一致，请重新输入！");
			i.type = "button";
			password1.value = "";
			password2.value = "";
		} else {
			i.type = "submit";
		}

	};
	function back() {
		var oBtn = document.getElementById("a1");
		oBtn.onclick = function() {
			window.location.reload();
		}
	}
	back(this);
