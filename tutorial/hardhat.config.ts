import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomiclabs/hardhat-truffle5";
import "@openzeppelin/hardhat-upgrades";
import dotenv from "dotenv";
dotenv.config();

// This is included in hardhat-toolbox.
// import "@nomiclabs/hardhat-ethers";

const config: HardhatUserConfig = {
  solidity: "0.8.9",
  networks: {
    rinkeby: {
      url: `https://eth-rinkeby.alchemyapi.io/v2/${process.env.ALCHEMY_KEY}`, // defi's key
      accounts: [`${process.env.DEV_METAMASK_PRIVATE_KEY}`],
    },
  },
};

export default config;
