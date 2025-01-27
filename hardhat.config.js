require("hardhat-deploy");
require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.19",
  networks: {
    telos_testnet: {
      url: "https://testnet.telos.net/evm",
      accounts: ["fe05161e244b20a6942ad794ba47bb7fe03661fe67b559a87186225a4a82fe49"],
      chainId: 41
    }
  },
  namedAccounts: {
    deployer: {
      default: 0
    }
  }
};