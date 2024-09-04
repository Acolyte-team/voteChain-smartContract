// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract myToken is ERC20 {
    address public owner;
    constructor() ERC20 ("ANGIE", "ANG"){
        _mint(msg.sender, 1000000 *(10 ** 18));
        owner = msg.sender;
    }

    function mint(uint _amount) external {
        require(msg.sender == owner, "you are not owner");
        _mint(msg.sender, _amount * 1e18);
    }

}
