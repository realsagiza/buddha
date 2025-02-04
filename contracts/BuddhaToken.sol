// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BuddhaToken is ERC20, Ownable {
    uint256 public burnRate = 2;
    uint256 public rewardRate = 2;
    uint256 public liquidityRate = 1;
    uint256 public charityRate = 1;

    address public liquidityWallet;
    address public charityWallet;
    address public liquidityManager;
    address public charityManager;

    constructor(
        address _liquidityWallet,
        address _charityWallet,
        address _liquidityManager,
        address _charityManager
    ) ERC20("Buddha Token", "BUDDHA") Ownable(msg.sender) {
        _mint(msg.sender, 5000000000 * (10 ** decimals()));
        liquidityWallet = _liquidityWallet;
        charityWallet = _charityWallet;
        liquidityManager = _liquidityManager;
        charityManager = _charityManager;
    }

    modifier onlyLiquidityManager() {
        require(msg.sender == liquidityManager, "Only the Liquidity Manager is allowed");
        _;
    }

    modifier onlyCharityManager() {
        require(msg.sender == charityManager, "Only the Charity Manager is allowed");
        _;
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal {
        if (to == liquidityWallet) {
            require(msg.sender == liquidityManager, "Only the Liquidity Manager is allowed");
        } else if (to == charityWallet) {
            require(msg.sender == charityManager, "Only the Charity Manager is allowed");
        }
    }

    function updateRates(
        uint256 newBurnRate,
        uint256 newRewardRate,
        uint256 newLiquidityRate,
        uint256 newCharityRate
    ) public onlyOwner {
        require(newBurnRate + newRewardRate + newLiquidityRate + newCharityRate <= 100, "Total rate must not exceed 100%");
        burnRate = newBurnRate;
        rewardRate = newRewardRate;
        liquidityRate = newLiquidityRate;
        charityRate = newCharityRate;
    }
}
