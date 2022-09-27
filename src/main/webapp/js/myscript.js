function addToCart(productId, productName, price) {
	let cart = localStorage.getItem("cart");

	if (cart == null) {

		//no cart yet
		let products = [];
		let product = { pId: productId, pname: productName, pQuantity: 1, pPrice: price }
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		console.log("product is added first time")
		updateCart();

	}
	else {
		//cart is already added
		let pcart = JSON.parse(cart);
		console.log(cart)
		console.log(JSON.parse(cart))
		let oldProduct = pcart.find((item) => item.pId == productId)
		if (oldProduct) {
			//already product added then increased quantity
			oldProduct.pQuantity = oldProduct.pQuantity + 1;
			pcart.map((item) => {
				if (item.pId == oldProduct.pId) {
					item.pQuantity = oldProduct.pQuantity
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("product quanity increased by 1")
			console.log(JSON.stringify(pcart))
		}
		else {
			//add product
			let product = { pId: productId, pname: productName, pQuantity: 1, pPrice: price }
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("product is added")
		}
	}
	updateCart();
}

//updating cart

function updateCart() {

	let cartString = localStorage.getItem("cart");
	let cartObject = JSON.parse(cartString);
	if (cartObject == null || cartObject.length == 0) {
		console.log("cart is empty")
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3>Cart does not contain any item")
		$(".checkout-btn").attr('disabled', true);
	}
	else {
		console.log(cartObject);
		$(".cart-items").html(`(${cartObject.length})`);
		let table = `
		<table class='table'>
		<thread class='thread-light'>
		<tr>
		<th>Item Name</th>
		<th>Price</th>
		<th>Quantity</th>
		<th>Total Price</th>
		<th>Action</th>
		</tr>
		</thread>
		`;

		let totalPrice = 0;

		cartObject.map((item) => {

			table += `
			<tr>
					<td>${item.pname}</td>
					<td>${item.pPrice}</td>
					<td>${item.pQuantity}</td>
					<td>${item.pQuantity * item.pPrice}</td>
					<td><button class='btn btn-danger btn-sm' onclick='deleteItemFromCart(${item.pId})' >Remove</button>  </td>
           </tr>
 `
			totalPrice += item.pQuantity * item.pPrice;
		});

		table = table + `
		  <tr>
		  <td></td>
		  <td></td>
		  <td></td>
		  <td class='font-weight-bold'>${totalPrice}</td>
		  </tr>
		</table>`;
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled',false);
	}
}

//delete item from the cart

function deleteItemFromCart(productId) {
	let cartItem = JSON.parse(localStorage.getItem('cart'))
	let newCartItem = cartItem.filter((item) => item.pId != productId)

	localStorage.setItem('cart', JSON.stringify(newCartItem))
	updateCart();
}




$(document).ready(function() {
	updateCart();
})



function checkout()
{
	window.location="checkout.jsp"
}