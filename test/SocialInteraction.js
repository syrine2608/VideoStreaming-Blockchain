const SocialInteraction = artifacts.require('./SocialInteraction.sol');
contract('SocialInteraction',() =>{

    let socialInteraction = null;
    before(async() => {
        socialInteraction = await SocialInteraction.deployed();
    });
    it('should add Vue', async () => {
       await socialInteraction.Vue(2);
    });
    it('should get Vue count', async () => {
       const Vcount = await socialInteraction.getVcount();
       assert(Vcount.toNumber() === 1);
       console.log(Vcount.toNumber());
    });
    it('should add Like', async () => {
        await socialInteraction.Like(4);
    });
    it('should get Like count', async () => {
        const Lcount = await socialInteraction.getLcount();
        assert(Lcount.toNumber() === 1);
        console.log(Lcount.toNumber());
    });
    it('should add Share', async () => {
        await socialInteraction.Share(6);
    });
    it('should get Share count', async () => {
        const Scount = await socialInteraction.getScount();
       assert(Scount.toNumber() === 1);
        console.log(Scount.toNumber());
    });
    it('should get social interaction cost', async () => {
        const price = await socialInteraction.getPrice();
       assert(price.toNumber() === 12);
        console.log(price.toNumber());
    });
});