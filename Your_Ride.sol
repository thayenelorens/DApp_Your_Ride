// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7; 


contract Your_Ride {

    uint public balanceReceived;
    address owner; // variable to set owner of contract

    constructor() {
        owner = msg.sender;
    }

    
    // Add yourself as a passager

    struct Passager {//
        address payable walletAddress;// address of the property as any renter must have a wallet address for identification.
        string firstName;
        uint phoneNumber;
        string vehicle;
 }

    mapping (address => Passager) public passagers;//  it will be able to fetch values based on a known key(address).it work as array
     // function was created from parameters
    function addPassager(address payable walletAddress, string memory firstName,uint phoneNumber, string memory vehicle) public {
        passagers[walletAddress] = Passager(walletAddress, firstName, phoneNumber,vehicle);
        // [walletAdress] will be the key that will be get parameters from Passager.
    }

    function ReceiveMoney() public payable{
        balanceReceived +=msg.value; // function was made to get  money
    }

    function getBalance()public view returns(uint){
        return address(this).balance; // function was made to get  balance after withdrawMoney
    }

    function withdrawMoney() public{
        address payable to = payable(msg.sender);// function was made to transfer to contract owner.
        to.transfer(getBalance());
    }
}
