import { expect } from 'chai';
import { loadFixture } from '@nomicfoundation/hardhat-toolbox/network-helpers';
import hre from 'hardhat';

describe("TaskManagerContract", function () {

    async function deployTaskManagerFixture() {

        const [owner] = await hre.ethers.getSigners();

        const TMInstance = await hre.ethers.getContractFactory("TaskManager");
        const TMDeployedInstance = await TMInstance.deploy();

        return { TMDeployedInstance, owner };
    }

    describe("AddingTasks", function () {

        it("AddTask", async function () {

            const { TMDeployedInstance, owner } = await loadFixture(deployTaskManagerFixture);

            const taskTitle = "Wake up at 7 am";
            
            await expect(
                TMDeployedInstance.addTask(taskTitle, { value: hre.ethers.parseEther("0.0011") })
            ).to.not.be.reverted;
        })
    })
})