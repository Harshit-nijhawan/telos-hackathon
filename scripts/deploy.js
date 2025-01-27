const hre = require("hardhat");

async function main() {
  // Get the contract factory
  const LostAndFound = await hre.ethers.getContractFactory("LostAndFound");

  // Deploy the contract
  const lostAndFound = await LostAndFound.deploy();

  // Wait for the contract to be deployed
  await lostAndFound.waitForDeployment();

  // Get the deployed contract address
  console.log("LostAndFound contract deployed to:", await lostAndFound.getAddress());
}

main().catch((error) => {
  console.error("Deployment error:", error);
  process.exitCode = 1;
});
