// import { expect } from "chai";
// // import { ethers } from "hardhat";
// // const hre = require("hardhat");
// import hre, { ethers } from "hardhat";
// import { Contract } from "ethers";
// import {
//   loadFixture,
// } from "@nomicfoundation/hardhat-toolbox/network-helpers";
// import { SignerWithAddress } from "@nomicfoundation/hardhat-ethers/signers";
// import { HardhatEthersSigner } from "@nomicfoundation/hardhat-ethers/signers";
// // import { MyToken, UserProfile } from "../typechain-types";
// import { UserProfile, MyToken } from "../typechain-types";



// describe("UserProfile", function () {
//   let userProfile: UserProfile;
//   let token: Contract;
//   let owner: any;
//   let addr1: any;

//   async function deployToken() {
//     // Contracts are deployed using the first signer/account by default
//     const [owner, otherAccount] = await hre.ethers.getSigners();

//     const erc20Token = await hre.ethers.getContractFactory("myToken");
//     const token = await erc20Token.deploy();

//     return { token };
//   }

//   async function deployMyToken() {
//     // Contracts are deployed using the first signer/account by default
//     const [owner, otherAccount] = await hre.ethers.getSigners();

//     const { token } = await loadFixture(deployToken)

//     const my_token = await hre.ethers.getContractFactory("myToken");
//     const my_Token = await my_token.deploy(token);

//     return { my_Token, owner, otherAccount, token };
//   }

//   describe("Deployment", function () {
//     it("Should check if owner is correct", async function () {
//       const { my_Token, owner } = await loadFixture(deployMyToken);

//       expect(await my_Token.owner()).to.equal(owner);
//     });

//     it("Should check if tokenAddress is correctly set", async function () {
//       const { my_Token, owner, token } = await loadFixture(deployMyToken);

//       expect(await my_Token.tokenAddress()).to.equal(token);
//     });
//   });


  

//   it("Should create a new user", async function () {
//     await userProfile.connect(addr1).createAccount("testuser", "Test Bio");
//     const user = await userProfile.getUser(addr1.address);
//     expect(user.username).to.equal("testuser");
//     expect(user.bio).to.equal("Test Bio");
//   });

//   it("Should reward user with tokens on account creation", async function () {
//     await userProfile.connect(addr1).createAccount("testuser", "Test Bio");
//     const balance = await token.balanceOf(addr1.address);
//     expect(balance).to.equal(hre.ethers.utils.parseEther("10"));
//   });

//   // it("Should not allow duplicate usernames", async function () {
//   //   await userProfile.connect(addr1).createAccount("testuser", "Test Bio");
//   //   await expect(
//   //     userProfile.connect(owner).createAccount("testuser", "Another Bio")
//   //   ).to.be.revertedWith("Username already taken");
//   // });

//   it("Should verify a user", async function () {
//     await userProfile.connect(addr1).createAccount("testuser", "Test Bio");
//     await userProfile.verifyUser(addr1.address);

//     const user = await userProfile.getUser(addr1.address);
//     expect(user.isVerified).to.be.true;
//   });

//   it("Should update user profile", async function () {
//     await userProfile.connect(addr1).createAccount("testuser", "Test Bio");
//     await userProfile.connect(addr1).updateProfile("newuser", "New Bio");

//     const user = await userProfile.getUser(addr1.address);
//     expect(user.username).to.equal("newuser");
//     expect(user.bio).to.equal("New Bio");
//   });
// });


