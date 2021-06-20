const Auction = artifacts.require('./Auction.sol');


contract('Auction',() =>{

    let auction = null;
    before(async() => {
       auction = await Auction.deployed();
      // const ex_address = await web3.eth.getAccount();
      console.log("auction started")
    });
    
//  await 

    it('auction started ', async () => {
    let ms = 2000
    let now = new Date().getTime()
    let days = 10
    let sysTime = 5 //days * 24 * 60 *60
    let end = now + sysTime
    let duration = 2

    let  timeout = (ms) =>{
        return new Promise(resolve => setTimeout(resolve,ms));
    }

    let executeByOwnerTime = async (duration) => {
        //exit by time owner
    await timeout(duration)
    auction.auctionEnded_bySystemTime()
    console.log("auction ended after " +duration + " millieseconds");
    }


    //start auction
    auction.startAuction(2,23,'SD','test','test12345')

    let x = sysTime*1000
    await timeout(x)
    if(duration === 0 ){
        await auction.auctionEnded_bySystemTime().then((res)=>console.log(res))
   console.log('1');
    }
    if(duration !==0){
        executeByOwnerTime(duration)   
        console.log("2");
    }


   

})
       // await auction.submitBid(2);
        //const owner_address = await ownershipTransfer.owners(0);
        //assert(owner_address.toString() === "0x2f384Ea022C8e8B88eecb170012f6DA329BeaC96");
        //console.log(owner_address);
    });

   


   /* it('Should End ', async () => {
      // await auction.submitBid(2);
            //const owner_address = await ownershipTransfer.owners(0);
            //assert(owner_address.toString() === "0x2f384Ea022C8e8B88eecb170012f6DA329BeaC96");
            //console.log(owner_address);
        });*/
