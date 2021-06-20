pragma solidity 0.5.0;
//need to create a smart contract for each vid on blockchain which will contain the investement details of it
//try with the fazet mahdi 5aterhom barcha vid 
contract SocialInteraction{
    
address payable executer;

uint investement_price = 0 ;
uint Vcount = 0 ;
uint Lcount = 0 ;
uint Scount = 0 ;

event receiptIsGenerated(uint investement_price);

//take the address of the user that is going to interact socially to be able to transfert money from it later on
    constructor() public{
    executer = msg.sender;
    }
//each vid will have balance in which it will record all the investement and money received for its account wich 
//will make it possible to do the vid economic lifecycle
    function Vue (uint _vuePrice) public returns(uint,uint)
    {
        investement_price += _vuePrice;
        Vcount += 1 ;
        return(investement_price ,Vcount);
    }

    function Like(uint _likePrice ) public returns(uint,uint)
    {
    investement_price += _likePrice;
     Lcount += 1 ;
    return(investement_price ,Lcount);
    }

    function Share( uint _sharePrice) public returns(uint,uint)
    {
    investement_price += _sharePrice;
     Scount += 1 ;
    return(investement_price ,Scount);
    }

    function getPrice() public view returns(uint){
        return(investement_price);
    }

    function getVcount()  public view returns(uint){
        return(Vcount);
    }

    function getLcount()  public view returns(uint){
        return(Lcount);
    }

    function getScount()  public view returns(uint){
        return(Scount);
    }

}