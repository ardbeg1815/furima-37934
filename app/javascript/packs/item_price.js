window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.trunc(priceInput.value*0.1)
    const profit = document.getElementById("profit");
    profit.innerHTML = priceInput.value-Math.trunc(priceInput.value*0.1)
 })})