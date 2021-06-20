const vid_sale_receipt = artifacts.require("VidSaleReceipt");
const social_interaction = artifacts.require("SocialInteraction");
const token_transfer = artifacts.require("TokensTransfer");
const auction = artifacts.require("Auction");
const ownership_transfert = artifacts.require("OwnershipTransfer");
const Vid_add_value = artifacts.require("VideoAddedValueRecord");

module.exports = function(deployer) {
  deployer.deploy(vid_sale_receipt);
  deployer.deploy(social_interaction);
  deployer.deploy(token_transfer);
  deployer.deploy(auction);
  deployer.deploy(ownership_transfert,["0x2f384Ea022C8e8B88eecb170012f6DA329BeaC96","0x001F02dF6ABAC0c0BeFFE95E46Dd95617A430C76"]);
  deployer.deploy(Vid_add_value);
};
//require needs the name of the contract not the file name


