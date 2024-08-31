import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox-viem/network-helpers";
import { expect } from "chai";
import hre from "hardhat";
import { getAddress, parseGwei } from "viem";

describe("SimpleTimeLock", function () {
  async function deploySimpleTimeLockFixture() {
    const [deployer, depositor] = await hre.viem.getWalletClients();

    const autoWallet = await hre.viem.deployContract("SimpleTimeLock", []);

    const publicClient = await hre.viem.getPublicClient();

    return {
      autoWallet,
      deployer,
      depositor,
      publicClient,
    };
  }

  describe("Lock", function () {
    it("Should lock correctly", async function () {
      const { autoWallet, depositor, publicClient } = await loadFixture(
        deploySimpleTimeLockFixture
      );

      const lockedAmount = parseGwei("1");
      const unlockTime = BigInt((await time.latest()) + 5);

      await autoWallet.write.lock([unlockTime], {
        value: lockedAmount,
        account: depositor.account,
      });
    });
  });

  describe("Unlock", function () {
    it("Should unlock correctly", async function () {
      const { autoWallet, depositor, publicClient } = await loadFixture(
        deploySimpleTimeLockFixture
      );

      const lockedAmount = parseGwei("1");
      const unlockTime = BigInt((await time.latest()) + 5);

      await autoWallet.write.lock([unlockTime], {
        value: lockedAmount,
        account: depositor.account,
      });

      await time.increase(5);

      await autoWallet.write.unlock({
        account: depositor.account,
      });
    });
  });
});
