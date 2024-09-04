import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const tokenAddress = "0xF36c26b73669575E7386135C6549c56ed50250f4";

const UserProfileModule = buildModule("UserProfileModule", (m) => {

    const save = m.contract("UserProfile", [tokenAddress]);

    return { save };
});

export default UserProfileModule;

// myTokenModule#myToken - 0xF36c26b73669575E7386135C6549c56ed50250f4
// UserProfileModule#UserProfile - 0x7fF19253E3161Ee8046df511cE3108d5618ab338
