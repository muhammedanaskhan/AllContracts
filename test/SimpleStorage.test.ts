import { expect } from "chai";
import {
    time,
    loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import hre from 'hardhat';

describe("SimpleStorage Contract", function () {

    async function deploySimpleStorageFixture() {
        const SSInstance = await hre.ethers.getContractFactory("SimpleStorage");
        const SSDeployedInstance = await SSInstance.deploy("StringToStore");
        return { SSDeployedInstance };
    }

    describe("Deployment", function () {
        it("Should set the right string to store", async function () {
            const { SSDeployedInstance } = await loadFixture(deploySimpleStorageFixture);

            await SSDeployedInstance.setData("StringToStore");
            expect(await SSDeployedInstance.getData()).to.equal("StringToStore");
        })
    })

}) 