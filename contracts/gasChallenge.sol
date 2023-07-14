// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    //Optimization Technique 1: Fixed-Size Array
    uint[10] numbers;
    //Since fixed-size arrays can't be initialized with values directly,
    //A constructor function is used to fill the array with initial values.
    constructor() {
        for (uint i = 0; i < 10; i++) {
            numbers[i] = i + 1;
        }
    }
    
    //Function to check for sum of array
    //No changes required in this function
    function getSumOfArray() public view returns (uint256) {
        uint sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }
    
    function notOptimizedFunction() public {
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }
    
    //Implement Remaining Gas Optimization Techniques Here
    //Sum of elements in the numbers array should equal 0
    function optimizedFunction() public {
        //Optimization Technique 2: Caching State Variable
        //Reading array length at each iteration of the loop consumes more gas than necessary.
        //Storing the array’s length in a variable before the for-loop, and use this new variable instead.
        uint[10] memory tempNumbers = numbers;
        uint length = tempNumbers.length;

        //Optimization Technique 3: Implement Uncheck Block
        //Because the operation is not likely to result in an overflow or underflow,
        //The unchecked keyword is used to implement a bypass block and save gas
        unchecked {
            //Optimization Technique 4: For Loop Increment Syntax
            //Pre-increment (++i) is used in the for loop instead of post-increment (i++). 
            //The pre-increment syntax uses less gas because it doesn't require a temporary variable to hold the previous value.
            for (uint i = 0; i < length; ++i) {
                tempNumbers[i] = 0;
            }
        }
        numbers = tempNumbers;
    }
 }
