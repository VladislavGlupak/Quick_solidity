pragma solidity ^0.5.7;

contract Will {

    address owner;
    uint    fortune;
    bool    deceased;

    constructor() payable public {
        owner = msg.sender; // person who is actually call the contract
        fortune = msg.value; // how much etheris going to being sent
        deceased = false;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _; // continue if sender is owner
    }

    modifier mustBeDeceased {
        require(deceased == true);
        _;
    }

    // list of family wallets
    address payable [] familyWallets;

    // map through the inheritance
    mapping (address => uint) inheritance;

    // set inheritance for each address
    function setInheritance(address payable wallet, uint amount) public {
        familyWallets.push(wallet);
        inheritance[wallet] = amount;
    }

    // pay each family member based on wallet address
    function payout() private mustBeDeceased {
        for(uint i = 0; i < familyWallets.length; i++){
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
            // transfer funds from contract address to family member address
        }
    }

    //oracle switch simulation
    function hasDeceased() payable public onlyOwner {
        deceased = true;
        payout();
    }
}