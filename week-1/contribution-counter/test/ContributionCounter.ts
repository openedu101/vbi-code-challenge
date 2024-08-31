import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox-viem/network-helpers";
import { expect } from "chai";
import hre from "hardhat";
import { getAddress, parseGwei } from "viem";

describe("ContributionCounter", function () {
  async function deployContributionCounterFixture() {
    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await hre.viem.getWalletClients();

    const contributeCounter = await hre.viem.deployContract(
      "ContributionCounter"
    );

    const publicClient = await hre.viem.getPublicClient();

    return {
      contributeCounter,
      owner,
      otherAccount,
      publicClient,
    };
  }

  let contributeCounter: any;
  let owner: any;
  let otherAccount: any;
  let publicClient: any;

  beforeEach(async function () {
    ({ contributeCounter, owner, otherAccount, publicClient } =
      await loadFixture(deployContributionCounterFixture));
  });

  describe("Deployment", function () {
    it("Should deploy the contract", async function () {
      expect(contributeCounter.address).to.not.be.undefined;
    });
  });

  describe("Contribute", function () {
    it("Should contrib success", async function () {
      const amount = parseGwei("1");
      await contributeCounter.write.contribute({
        account: otherAccount.account,
        value: amount,
      });

      expect(await contributeCounter.read.totalContributor()).to.equal(1n);

      const userAmount = await contributeCounter.read.userToAmount([
        otherAccount.account.address,
      ]);

      expect(userAmount).to.equal(amount);
    });

    it("Should not allow double contribution from the same account", async function () {
      const amount = parseGwei("1");
      await contributeCounter.write.contribute({
        account: otherAccount.account,
        value: amount,
      });

      await expect(
        contributeCounter.write.contribute({
          account: otherAccount.account,
          value: amount,
        })
      ).to.be.rejectedWith("You have already contributed");
    });

    it("Should not allow zero contribution", async function () {
      await expect(
        contributeCounter.write.contribute({
          account: otherAccount.account,
          value: 0,
        })
      ).to.be.rejectedWith("Ether amount must be greater than 0");
    });
  });
});
