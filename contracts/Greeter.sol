//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Greeter {
    uint public totalSupply;
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;
    string public name = "PobyvanetsToken";
    string public symbol = "POTO";
    uint public decimals = 2;

    function transfer(address recipient, uint amount) external returns(bool){
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        return true;
    }

    function approve(address spender, uint amount) external returns(bool){
        allowance[msg.sender][spender] = amount;
        return true;
    }

    function buy() external payable {
        buyTokens(msg.sender);
    }

    function mint(uint amount) public {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
    }

    function buyTokens(address beneficiary) public payable {
        require(beneficiary != address(0));
        uint256 weiAmount = msg.value;
        uint256 tokens = weiAmount*100;

        mint(tokens);
    }
}
