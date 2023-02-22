// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {
    string public name = "MetaCrafters";
    string public symbol = "MCF";
    uint8 public decimals = 18;
    uint256 public totalSupply = 1000000 * 10**18; // 1 million tokens with 18 decimal places
    
    mapping(address => uint256) public balanceOf;
    
    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }
    
    function transfer(address to, uint256 amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Not enough balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }
    
    event Transfer(address indexed from, address indexed to, uint256 value);
}
