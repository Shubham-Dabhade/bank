import Debug "mo:base/Debug"//we have to import the class "Debug" to use its function print

actor DBank{   //actor is used to define a class in motoko
  var currentVal=300;
  currentVal:=100;
  //Debug.print("Hello"); //print function lets us print a text,but we can't print currentVal as it only prints text and currentVal is of type Nat

  //to print currentVal we use another function called debug_show to remove the error
  Debug.print(debug_show(currentVal));


  //unlike var 'let' is used to create a constant and is immutable and cannot be reassigned a value
  let id=778378373;
  Debug.print(debug_show(id));
}