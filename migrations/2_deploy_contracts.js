const BuddhaToken = artifacts.require("BuddhaToken");

module.exports = function (deployer, network, accounts) {
    const owner = accounts[0]; // ใช้บัญชีแรกเป็น Owner
    const liquidityWallet = "0xBF30a44cCc57772Fe423aC887e9186c8d8490ddd"; // แทนที่ด้วยที่อยู่กระเป๋าจริง
    const charityWallet = "0xBF30a44cCc57772Fe423aC887e9186c8d8490ddd"; // แทนที่ด้วยที่อยู่กระเป๋าจริง
    const liquidityManager = owner; // ใช้ Owner เป็น Liquidity Manager
    const charityManager = owner; // ใช้ Owner เป็น Charity Manager

    deployer.deploy(BuddhaToken, liquidityWallet, charityWallet, liquidityManager, charityManager);
};
