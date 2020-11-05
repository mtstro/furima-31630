function price() {
  const price_form = document.getElementById("item-price");
  price_form.addEventListener("keyup", () => {
    const input = price_form.value;
    const tax_output = document.getElementById("add-tax-price");
    const profit_output = document.getElementById("profit") 
    let tax =  parseInt(input * 0.1)
    let profit = input - tax
    tax_output.innerHTML = `${tax}`
    profit_output.innerHTML = `${profit}`
  })
}

window.addEventListener("load", price)