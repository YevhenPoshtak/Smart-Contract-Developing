// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract CharityFund{
    address public owner;
    mapping(address => uint256) public donations;

    constructor(){
        owner = msg.sender;
}
    function donate() public payable{
        require(msg.value > 0);
        donations[msg.sender] += msg.value;
}
    function getBalance() public view returns (uint256){
        return address(this).balance;
}
    function withdraw() public{
        require(msg.sender == owner);
        payable(owner).transfer(address(this).balance);
    }
}