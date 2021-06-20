//fel require lezem ikoun l contract name bethabet
const VidSaleReceipt = artifacts.require('./VidSaleReceipt.sol');
// () callback function
contract('VidSaleReceipt',() =>{
//async howa l name mta3 l callback 5ater bech nesta3emlou l await
    
//for each function ta3mel haja t7ot it ( feha heya l put w l get)
it('should deploy smart contract properly and generate the video sale price receipt', async () => {
        const vidSaleReceipt = await VidSaleReceipt.deployed();
        await vidSaleReceipt.receiptGeneration('SD','popular',2);
    const price_receipt = await vidSaleReceipt.getPrice();
    console.log(price_receipt.toNumber());
   assert(price_receipt.toNumber() === 4);
    });
});