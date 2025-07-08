// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract CharityFund{
    address public owner;
    mapping(address => uint256) public patrons;
    bytes32 private hashedPassword;

    constructor(string memory _password){
        owner = msg.sender;
        hashedPassword = keccak256(abi.encodePacked(_password));
    }

    function donate() public payable{
        patrons[msg.sender] += msg.value;
    }

    function balance() public view returns (uint256){
        return address(this).balance;
    }

    function withdraw(string memory _password) public{
        require(owner == msg.sender);
        require(hashedPassword == keccak256(abi.encodePacked(_password)));
        payable(owner).transfer(address(this).balance);
    }

}
