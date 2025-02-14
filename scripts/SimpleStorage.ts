import hre from "hardhat";

async function simpleStorage() {
    const simpleStorageContract = await hre.ethers.getContract("SimpleStorage");
}