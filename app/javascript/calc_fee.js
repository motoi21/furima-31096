function calcFee (){
  const price = document.getElementById("item-price");
  price.addEventListener('keyup',()=> {
    const fee = price.value / 10;
    const userProfit = price.value - fee;
    const AddTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    AddTaxPrice.innerHTML = Math.floor(fee);
    profit.innerHTML = Math.floor(userProfit);
  });
}

setInterval(calcFee, 1000)