// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import './userProfile.sol';

contract TokenRewards {
    
    IERC20 public tokenAddress;
    address public owner;

    constructor(address _tokenAddress) {
        tokenAddress = IERC20(_tokenAddress);
        owner = msg.sender;
    }

    event Reward(address indexed user, uint256 amount, string reason);

    modifier onlyOwner(){
        require(owner == msg.sender, "YOU ARE NOT THE OWNER");
        _;
    }

    function rewardUser(address _user, uint256 _amount, string memory _reason) external onlyOwner {
        require(tokenAddress.transfer(_user, _amount), "Token transfer failed");
        emit Reward(_user, _amount, _reason);
    }

    function withdrawTokens(uint256 _amount) external onlyOwner {
        require(tokenAddress.transfer(address(this), _amount), "Token transfer failed");
    }
}