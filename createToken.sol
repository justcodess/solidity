// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.24;

contract nsToken {
   string public name= "NS";
   string public symbol= "NS";
   uint8 public decimals = 18;
   uint256 public totalSupply = 1000000 * (10 ** 18);

   mapping(address => uint256) public balanceOf;
   mapping(address => mapping(address => uint256)) public allowance;

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

   function transfer(address to, uint256 amount) public returns(bool) {
    require(balanceOf[msg.sender] >= amount, "insufficient funds");
    
    balanceOf[msg.sender] -= amount;
    balanceOf[to] += amount;
    
    return true;
   }

   function approve(address spender, uint256 amount) public returns(bool) {
    allowance[msg.sender][spender] = amount;
    return true;
   }
    
    //Ali -> Veli 1 Eth 
    //openseaAllowance[Ali][msg.sender] = 1Eth
   function transferFrom(address from, address to, uint256 amount) public returns(bool) {
    require(balanceOf[from] >= amount, "insufficient funds");
    require(allowance[from][msg.sender] >= amount, "No spending permission");
    
    balanceOf[from] -= amount;
    balanceOf[to] += amount;
    allowance[from][msg.sender] -= amount;
    return true;
   }
}