import { bank } from "../../declarations/bank";

window.addEventListener("load",async ()=>{
  //  console.log("loaded once");
  update();
});


document.querySelector("form").addEventListener("submit",async(event)=>{
  event.preventDefault();

  const button=event.target.querySelector("#submit-btn");//This gets hold of the from we are listening to


  // console.log("submitted");
  const inputAmount=parseFloat(document.getElementById("input-amount").value);
  const outputAmount=parseFloat(document.getElementById("withdrawal-amount").value);


  //as soon as the user typed in the input we have to disable the submit temperorily
  button.setAttribute("disabled",true);

  //if value added is nothing then it might mess up the code of our icp
  if(document.getElementById("input-amount").value.length!=0){
    await bank.topUp(inputAmount);
  }
  if(document.getElementById("withdrawal-amount").value.length!=0){
    await bank.withDrawl(outputAmount);
  }

//compounding

  await bank.compound();

//again so the updated amount may show after the transaction
  update();


  //to set the input elements value to none after once the input is accepted
  document.getElementById("input-amount").value="";
  document.getElementById("withdrawal-amount").value="";


  //remove the disable attribute of the button
  button.removeAttribute("disabled");
});


async function update(){
  const currentAmount= await bank.checkBalance();
  document.getElementById("value").innerText=Math.round(currentAmount*100) / 100;
}