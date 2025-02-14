import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const PollingModule = buildModule("PollingModule", (m) => {

    const polling = m.contract("Polling");

    return { polling };
});

export default PollingModule;
