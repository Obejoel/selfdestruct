// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Selfdestruct {

    address private owner;
    constructor () {
        owner = msg.sender;
    }

    function theowner() public view returns(address) {
        return owner;
    }

    function sendEth (address payable EtherVault) payable  public {
        //Chech if the caller of the function is the owner
        require(msg.sender == owner, "This function can only be called by the owner");
        //check if the amount is exactly 0.0005 ether
        require(msg.value == 0.0005 * 1e18, "Must send exactly 0.0005 ether");
        //Send the ether with selfdestruct
        selfdestruct(payable(EtherVault));
    }
}
