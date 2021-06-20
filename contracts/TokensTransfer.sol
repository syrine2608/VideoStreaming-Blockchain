pragma solidity 0.5.0;


contract TokensTransfer{
    
    address payable public sender;
   // address payable receiver_owner;
    uint senderbalance;
    
    
    //event balance(uint amount);
 //event to announce the success of transfert of ethers 
    event ether_succesufully_transfered(address transferedFrom,address transferedTo,uint amount, uint time);
    
    constructor()public 
    {
        sender = msg.sender;
    }
    function showExecuter() public  view returns( address payable){
        return(sender);
    }
    
//Modifier to verify the identity of the person sending ethers ( same person as the executer)
    modifier isSender() 
    {
        require(msg.sender == sender);
        _;
    }
    function setBalance() public returns (uint) {
        senderbalance = msg.sender.balance;
        return senderbalance;

      // emit balance(senderbalance);truffle compile

    }
    //get sender/ executer account balance 
    function getBalance() view public returns (uint) {
        return senderbalance;

      // emit balance(senderbalance);truffle compile

    }
//Modifier to verify that the sender has enough balance to send 
//error in gas estimation that I don't know why 
    /*modifier enoughBalance()
    {
         require(senderbalance > msg.value);
         _;
        
    }*/
// controle the not enough balance by default 
//function to transfert ethers from one account ( sender/participant) to another(owner)
    function transfertether(address payable receiver_owner) isSender()  public payable
    {
        
        receiver_owner.transfer(msg.value);
        emit ether_succesufully_transfered(sender,receiver_owner, msg.value, now);
    }
    
}