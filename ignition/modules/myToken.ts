import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const MyTokenModule = buildModule("myTokenModule", (m) => {

    const token = m.contract("myToken");

    return { token };
});

export default MyTokenModule;

// myTokenModule#myToken - 0xF36c26b73669575E7386135C6549c56ed50250f4

