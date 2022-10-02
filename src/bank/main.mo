import Debug "mo:base/Debug";//we have to import the class "Debug" to use its function print
import Time "mo:base/Time";//importing time module 
import Float "mo:base/Float";//import float module for converting values to a float point number 



actor DBank{   //actor is used to define a class in motoko
  stable var currentVal:Float=300;//creating it in a decimal value to add changes after point //adding stable keyword makes it orthogonally persistent and even if the canister is re deployed the value remains persistent 
  // currentVal:=100;
  //Debug.print("Hello"); //print function lets us print a text,but we can't print currentVal as it only prints text and currentVal is of type Nat

  //to print currentVal we use another function called debug_show to remove the error
  Debug.print(debug_show(currentVal));



  //using the time module to get the current time
  stable var startTime=Time.now();  //stable to store the value over time
  Debug.print(debug_show(startTime));




  //unlike var 'let' is used to create a constant and is immutable and cannot be reassigned a value
  // let id=778378373;
  // Debug.print(debug_show(id));


  //in motoko to define a function we use 'func' keyword
  //we added a modifier called public to make this function public to use if not added this function would be private to this class and would not be viewed outside this class
  //to run the function outside in terminal write-->  dfx canister call bank(canister_name) topUp(function_name)
  public func topUp(amount: Float){
    currentVal+=amount;

    Debug.print(debug_show(currentVal));
  };


  //allows the user to withdrawl an amount from the currentVal
  //decrease the current val by the amount specified

  public func withDrawl(amount:Float){
    let tempValue:Float=currentVal-amount;//here we are assigning the value of the subtraction to a variable which is of type INT which can be positive or negative as we want to check whether the requested amount is less than the total amount cause if the requested amount for withdrawl was more we get an error check it 


    if(tempValue>=0){
      currentVal-=amount;
      Debug.print(debug_show(currentVal));
    }
    else{
      Debug.print("the estimated total value is less the the requested value for withdrawl");
    }
  };

  public query func checkBalance(): async Float{
    return currentVal;
  };

  //function to calculate the compound

  public func compound(){
    var currentTime=Time.now();
    var timeElappsedNS=currentTime-startTime;
    var timeElappsedS=timeElappsedNS/1000000000;
    currentVal:=currentVal*(1.01**Float.fromInt(timeElappsedS));
    startTime:=currentTime;
  };


}