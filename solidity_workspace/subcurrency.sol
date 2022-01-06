pragma solidity >=0.7.0 <0.9.0;

contract Coin {

    address public minter;
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor(){
        minter = msg.sender;
    }

    // make new coins and send it to adress, only the owner can send
    function mint(address reciever, uint amount) public {
        require(msg.sender == minter);
        balances[reciever] = balances[reciever] + amount;

    }

    error insufficientBalance(uint requested, uint available);

    function send(address reciever, uint amount) public {
        if (balances[msg.sender] < amount){
            revert insufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        }
        balances[msg.sender] = balances[msg.sender] - amount;
        balances[reciever] = balances[reciever] + amount;

        emit Sent(msg.sender, reciever, amount);
    }
}