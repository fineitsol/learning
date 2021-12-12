// SPDX-License-Identifier: MIT
//pragma solidity ^0.4.10;
pragma solidity 0.8.10;

import "./erc20Interface.sol";

contract ERC20Token is  ERC20Interface {
    uint256 constant private MAX_UINT256 = 2*256-1;

    uint256 public totalSupply;
    mapping(address => uint256) public balances;
    mapping (address => mapping (address => uint256)) allowed;

  //  uint256 public totalSupply;
    string public name;
    uint8 public decimals;
    string public symbol;


    constructor(
        uint256 _initialAmount,
        string memory _tokenName,
        uint8 _decimalUnits,
        string memory _tokenSymbol
    ) public {
        balances[msg.sender]=_initialAmount;
        totalSupply=_initialAmount;
        name=_tokenName;
        decimals = _decimalUnits;
        symbol=_tokenSymbol;
    }

// Transfer tokens from mesg.sender to a speified address
    function transfer(address _to, uint256 _value) external returns (bool success) {
        require(balances[msg.sender] >= _value, "Insufficient funds for transfer soruce.");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit    Transfer(msg.sender, _to, _value);
        return true;
        
    }

// transfer tokens from on espeified address to another specified address
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success) {
        uint256 allowance = allowed[_from][msg.sender];  //predefined amount from a sender
        require(balances[_from] >= _value && allowance >= _value, "Insufficient allowed funds for transfer source.");
        balances[_to] += _value;   //keep in mind, all the number are available because the code need to be run from every node.
        balances[_from] -= _value;
        if(allowance < MAX_UINT256){
            allowed[_from][msg.sender] -= _value;
        }
        
        emit   Transfer(_from, _to, _value);
        return true;
       
    }

    function approve(address _spender, uint256 _value) external returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    //function approveAndCall()

    function allowance(address _owner, address _spender) external view returns (uint256 remaining) {
      return allowed[_owner][_spender];
    }

    function balanceOf(address _owner) external view returns (uint256 balance) {
        return balances[_owner];
    }

    /* function totalSupply() external view returns(uint256){
        return totalSupply;
    } */

}