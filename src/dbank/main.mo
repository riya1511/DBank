// actor is synonymus to class
// let is similar to const in javascript

import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {

  stable var currentAmount: Float = 300;
  currentAmount := 300;

  // let id = 748379348402938974;

  // Debug.print("Hello");
  // Debug.print(debug_show(currentAmount));
  // Debug.print(debug_show(id));

  stable var startTime = Time.now();
  startTime := Time.now();

  Debug.print(debug_show(startTime));

  public func topUp(amount: Float) {
    currentAmount += amount;

    Debug.print(debug_show(currentAmount));
  };

  public func withdraw(amount: Float){
    if(amount <= currentAmount){
      currentAmount -= amount;
      Debug.print(debug_show(currentAmount));
    }
    else{
      Debug.print("You do not have adequate amount in your account");
    }
  };

  public query func checkBalance(): async Float {
    return currentAmount;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNs = currentTime - startTime;
    let timeElapsedS = timeElapsedNs / 1000000000;

    currentAmount := currentAmount * (1.01 ** (Float.fromInt(timeElapsedS)));
    startTime := currentTime;
  };

  // topUp();
}