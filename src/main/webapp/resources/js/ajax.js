function categoryCount() {
		const cate = document.querySelector("#cate");
		const productNo = document.writeForm.productNo;
		
		let xhttp = new XMLHttpRequest();
		let num = document.writeForm.category.value;
		let category = "?category=" + encodeURIComponent(num);
		xhttp.open("GET", "write/count" + category);
		xhttp.send();
		
		xhttp.onreadystatechange = function () {
			if (this.readyState == 4 && this.status == 200) {
				let count = this.responseText;
				cate.innerHTML = "<input type='hidden' name='productNo' value='" + num + (count+1) + "'>" + num + (count+1);
			}
		};
	}