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

    const simpleTimeLock = await hre.viem.deployContract("SimpleTimeLock", []);

    const publicClient = await hre.viem.getPublicClient();

    return {
      simpleTimeLock,
      deployer,
      depositor,
      publicClient,
    };
  }

  describe("Lock", function () {
    it("Should lock correctly", async function () {
      const { simpleTimeLock, depositor, publicClient } = await loadFixture(
        deploySimpleTimeLockFixture
      );

      const lockedAmount = parseGwei("1");
      const unlockTime = BigInt((await time.latest()) + 5);

      await simpleTimeLock.write.lock([unlockTime], {
        value: lockedAmount,
        account: depositor.account,
      });

      const lockInfo = await simpleTimeLock.read.lockInfos([
        depositor.account.address,
      ]);

      expect(lockInfo[0]).to.equal(lockedAmount);
      expect(lockInfo[1]).to.equal(unlockTime);
    });
  });

  describe("Unlock", function () {
    it("Should unlock correctly", async function () {
      const { simpleTimeLock, depositor, publicClient } = await loadFixture(
        deploySimpleTimeLockFixture
      );

      const lockedAmount = parseGwei("1");
      const unlockTime = BigInt((await time.latest()) + 5);

      await simpleTimeLock.write.lock([unlockTime], {
        value: lockedAmount,
        account: depositor.account,
      });

      await time.increase(5);

      await simpleTimeLock.write.unlock({
        account: depositor.account,
      });
    });
  });
});
