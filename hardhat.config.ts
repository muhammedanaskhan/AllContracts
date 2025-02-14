import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomicfoundation/hardhat-chai-matchers";
import "dotenv/config"

const RPC_URL = `https://eth-sepolia.g.alchemy.com/v2/${process.env.RPC_URL}`;
const PVT_KEY = process.env.PVT_KEY;

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  networks: {
    sepolia: {
      url: RPC_URL,
      accounts: PVT_KEY ? [PVT_KEY] : []
    }
  }
};

export default config;
