async function triggerRebase(treasuryAddr, oracleAddr) {
    const oracle = await ethers.getContractAt("OracleMock", oracleAddr);
    const price = await oracle.getPrice();
    const treasury = await ethers.getContractAt("Treasury", treasuryAddr);
    
    const tx = await treasury.allocateSeigniorage(price);
    await tx.wait();
    console.log("Rebase successful");
}
