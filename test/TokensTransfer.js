const TokensTransfer = artifacts.require('./TokensTransfer.sol');
contract('TokensTransfer',() =>{
    let tokensTransfer = null;
    before(async() => {
        tokensTransfer = await TokensTransfer.deployed();
    });
    it('should get balance', async () => {
        const accounts = await web3.eth.getAccounts();
        console.log(accounts[0]);
        //let balance = await web3.eth.getBalance(accounts[0])
        let balance = await tokensTransfer.getBalance().toString
        let balance1 = await web3.utils.fromWei(balance, "ether")
        console.log(balance1.toString());
    });
});