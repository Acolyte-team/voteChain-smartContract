// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import './userProfile.sol';

contract contentManagement{
    IERC20 public tokenAddress;
    UserProfile public userProfile;

    struct Content{
        uint256 id;
        address creator;
        string contentType;
        uint256 likes;
        uint256 shares;
        uint256 timestamp;
    }

    constructor(address _tokenAddress, address userProfileAddress){
        tokenAddress = IERC20(_tokenAddress);
        userProfile = UserProfile(userProfileAddress);
    }

    mapping(uint256 => Content) public contents;
    uint256 public contentCount;

    
    event ContentCreated(uint256 indexed contentId, address indexed creator, string contentType);
    event ContentInteraction(uint256 indexed contentId, address indexed user, string interactionType);

    function createContent(string memory _contentType) external {

        require(userProfile.getUser(msg.sender).isVerified, "User not verified");

        contentCount++;
        
        contents[contentCount] = Content({
            id: contentCount,
            creator: msg.sender,
            contentType: _contentType,
            likes: 0,
            shares: 0,
            timestamp: block.timestamp
        });

        emit ContentCreated(contentCount, msg.sender, _contentType);

        // Reward content creation
        tokenAddress.transfer(msg.sender, 5 * 10**18); 
    }

    function interactWithContent(uint256 _contentId, string memory _interactionType) external {
        require(contents[_contentId].id != 0, "Content does not exist");
        
        if (keccak256(abi.encodePacked(_interactionType)) == keccak256(abi.encodePacked("like"))) {
            contents[_contentId].likes++;
        } else if (keccak256(abi.encodePacked(_interactionType)) == keccak256(abi.encodePacked("share"))) {
            contents[_contentId].shares++;
        }

        emit ContentInteraction(_contentId, msg.sender, _interactionType);

        // Reward interaction
        tokenAddress.transfer(msg.sender, 1 * 10**18); // 1 token
        tokenAddress.transfer(contents[_contentId].creator, 2 * 10**18); // 2 tokens to content creator
    }

      function getContractBalance() external view returns (uint256){
        return tokenAddress.balanceOf(address(this));
    }


    function getContent(uint256 _contentId) external view returns (Content memory) {
        return contents[_contentId];
    }

}