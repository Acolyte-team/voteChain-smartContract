// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract UserProfile{

    IERC20 public tokenAddress;
    address public owner;

      struct User {
        address walletAddress;
        string username;
        string bio;
        bool isVerified;
        uint256 reputation;
    }

    constructor(address _tokenAddress){
        tokenAddress = IERC20(_tokenAddress);
        owner = msg.sender;
    }

    mapping(address => User) users;
    mapping(string => address) username;
    mapping(address => uint256) balances;

    event UserCreated(address indexed user, string indexed _username);
    event UserVerified(address indexed _userAddress);
     event ProfileUpdated(address indexed userAddress, string username, string bio);

    modifier onlyOwner(){
        require( owner == msg.sender, "YOU ARE NOT THE OWNER");
        _;
    }

    function createAccount(string memory _username, string memory _bio) public {
        require(users[msg.sender].walletAddress == address(0), "User already exists");
        require(username[_username] == address(0), "Username already taken");

        users[msg.sender] = User({
            walletAddress: msg.sender,
            username: _username,
            bio: _bio,
            isVerified: false,
            reputation: 0
        });

        username[_username] = msg.sender;

        emit UserCreated(msg.sender, _username);

        // Reward user for onboarding
        tokenAddress.transfer(msg.sender, 10 * 10**18); // 10 tokens
    }

    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }

    function getContractBalance() external view returns (uint256){
        return tokenAddress.balanceOf(address(this));
    }

    function verifyUser(address _userAddress) external onlyOwner {
        require(users[_userAddress].walletAddress != address(0), "User does not exist");
        users[_userAddress].isVerified = true;
        emit UserVerified(_userAddress);
    }

    function updateProfile(string memory _username, string memory _bio) external {
        require(users[msg.sender].walletAddress != address(0), "User does not exist");
        
        if (keccak256(abi.encodePacked(users[msg.sender].username)) != keccak256(abi.encodePacked(_username))) {
            require(username[_username] == address(0), "Username already taken");
            delete username[users[msg.sender].username];
            username[_username] = msg.sender;
        }

        users[msg.sender].username = _username;
        users[msg.sender].bio = _bio;

        emit ProfileUpdated(msg.sender, _username, _bio);
    }

    function getUser(address _userAddress) external view returns (User memory) {
        return users[_userAddress];
    }

}