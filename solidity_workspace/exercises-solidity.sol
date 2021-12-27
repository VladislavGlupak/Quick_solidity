// this is a comment

pragma solidity >=0.7.0 <0.9.0;

//create a Contracy taht can store data and return it back
// be able to do the following:
// 1. recieve, 2. store and 3. return information

contract simpleStorage {

//rigth all the code inside here - functions and its state

    //variables - for reserving memory for storing values
    //Format: Type Name_of_variable = Value;
    uint storeData = 2; //Integer: integers of varying sizes
    string errorText = "Error! There is no chocolate to be found!"; //String: ordered sequences of characters
    bool switchON = true; //Boolean: true/false

    uint Data;
    //function:
    //public - enables visibility so that we can call outside the contract
    function set(uint x) public {
        Data = x;
    }

    function get() public view returns (uint) {
        return Data;
    }
}

 