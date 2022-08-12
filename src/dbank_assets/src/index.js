import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async () => {
  update();
});

document.querySelector("form").addEventListener("submit", async (event) => {
  event.preventDefault();

  const topupAmt = parseFloat(document.getElementById("input-amount").value);
  const withdrawAmt = parseFloat(document.getElementById("withdrawal-amount").value);

  const button = document.querySelector("#submit-btn");

  button.setAttribute('disabled', true);

  if(document.getElementById("input-amount").value.length != 0){
    await dbank.topUp(topupAmt);
  }

  if(document.getElementById("withdrawal-amount").value.length != 0){
    await dbank.withdraw(withdrawAmt);
  }

  await dbank.compound();

  update();

  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";
  button.removeAttribute("disabled");

});

const update = async () =>{
  const currentAmount = await dbank.checkBalance();
  document.getElementById('value').innerText = Math.round(currentAmount * 100) / 100;
}