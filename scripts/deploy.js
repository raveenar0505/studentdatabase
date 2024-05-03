async function main() {
    const token = await ethers.deployContract("StudentContract");
    console.log("Deployed Contract Address:", await token.getAddress());
  }
  
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });