require("dotenv").config();
const HDWalletProvider = require("@truffle/hdwallet-provider");

module.exports = {
  networks: {
    bsc: {
      provider: () =>
        new HDWalletProvider(
          process.env.PRIVATE_KEY,
          "https://bsc-dataseed.binance.org/" // URL ของ Binance Smart Chain
        ),
      network_id: 56, // Network ID ของ BSC
      gas: 5000000, // Limit ของ Gas
      gasPrice: 10000000000, // 10 Gwei
    },
  },
  compilers: {
    solc: {
      version: "0.8.20", // ตั้งค่า Compiler ให้เป็น 0.8.20
    },
  },
};
