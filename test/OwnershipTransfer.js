const OwnershipTransfer = artifacts.require('./OwnershipTransfer.sol');
contract('OwnershipTransfer',() =>{
//deploy the contract before the execution of all the test of all function
    let ownershipTransfer = null;
    before(async() => {
       ownershipTransfer = await OwnershipTransfer.deployed();
    });
//test the fill owners function
    it('should fill the owners ', async () => {
        await ownershipTransfer.fill_owners(["0x2f384Ea022C8e8B88eecb170012f6DA329BeaC96","0x001F02dF6ABAC0c0BeFFE95E46Dd95617A430C76"
        ]);
        const owner_address = await ownershipTransfer.owners(0);
        assert(owner_address.toString() === "0x2f384Ea022C8e8B88eecb170012f6DA329BeaC96");
        console.log(owner_address);
    });
//test the getAll function
    it('should get all owners', async () => {
        const rawowners = await ownershipTransfer.getAllOwners();
        const owners = rawowners.map(id => id.toString());
        assert.deepEqual(owners, ['0x2f384Ea022C8e8B88eecb170012f6DA329BeaC96', '0x001F02dF6ABAC0c0BeFFE95E46Dd95617A430C76']);
        console.log(owners);
    });

    it('should transfer ownership', async () => {
        await ownershipTransfer.transferOwnership('0xEcF15Ac2aCC30d135d95d0cf34D18Be0612FE647');
    });
    it('should get all owners', async () => {
        const rawowners = await ownershipTransfer.getAllOwners();
        const owners = rawowners.map(id => id.toString());
        assert.deepEqual(owners, ['0x2f384Ea022C8e8B88eecb170012f6DA329BeaC96', '0x001F02dF6ABAC0c0BeFFE95E46Dd95617A430C76', '0xEcF15Ac2aCC30d135d95d0cf34D18Be0612FE647']);
        console.log(owners);
    });

});

