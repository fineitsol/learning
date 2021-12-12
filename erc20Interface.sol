// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

/* */
/* */
interface ERC20Interface {
  // Standard ERC-20 interface.
  function transfer(address to, uint256 value) external returns (bool); // found
  function approve(address spender, uint256 value) external returns (bool); // found
  function transferFrom(address from, address to, uint256 value) external returns (bool);  // found
  function totalSupply() external view returns (uint256); // found
  function balanceOf(address who) external view returns (uint256); // found
  function allowance(address owner, address spender) external view returns (uint256); // found
  // Extension of ERC-20 interface to support supply adjustment.
 // function mint(address to, uint256 value) external returns (bool);
 // function burn(address from, uint256 value) external returns (bool);
  event Transfer(address indexed from, address indexed to, uint tokens);
  event Approval(address indexed tokenOwner, address indexed spender, uint tokes);

}