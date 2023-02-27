import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";

// actor {
//   public func greet(name : Text) : async Text {
//     return "Hello, " # name # "!";
//   };
// };

actor DBank {
  stable var currentValue : Float = 300;
  // currentValue :=300;
  Debug.print(debug_show(currentValue));
  let id=2547854644644;

  // Debug.print(debug_show(id));

  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show(startTime));

  public func topUp(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };



  public func withdrawl(amount: Float){
    let tempVlaue: Float = currentValue - amount;
    if(tempVlaue >=0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));   
    }else{
       Debug.print("amount is too large");
    };
    
  };

  public query func checkBalance(): async Float{
    return currentValue;
  };
  // topUp();

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapseds = timeElapsedNS  / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapseds));
    startTime := currentTime;
  }
};