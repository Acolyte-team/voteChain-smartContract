import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const tokenAddress = "0xF36c26b73669575E7386135C6549c56ed50250f4";
const userProfile ="0x7fF19253E3161Ee8046df511cE3108d5618ab338";

const ContentManagementModule = buildModule("ContentManagementModule", (m) => {

    const save = m.contract("contentManagement", [tokenAddress,userProfile]);

    return { save };
});

export default ContentManagementModule;