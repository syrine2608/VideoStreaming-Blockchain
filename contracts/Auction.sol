pragma solidity 0.5.0;

contract Auction
{
    // Bids will have a user and an amount
    struct Bid {
        address user;
        uint bidAmount;
    }

    // This array will store the history of all bids
    // Due to the logic in this contract, bids will always be in acending price order
    Bid[] AllBids;
    
    // variables to store the details of the start and end of auction
     uint _auctionStartTime;
     uint _auctionEndTime;
     uint _auctionDuration;
     
    //varible that contains the maximum time that an auction can last and I will put it as an exemple for 1h 
    uint public _SysTime=60;
     

    constructor() public {
    
    }
    
    //event to notify the participants that an auction has started providing the details of video and auction
    event StartAuctionEvent(uint _initialBid, uint _videoDuration, string _videoResolution, string _videoName, string _videoID);
    
    //event to notify the participants that an auction has ended by owner request
    event EndAuctionEvent_by_owner(string end);
    
    //event to notify the participants that an auction has ended by time set by owner 
    event EndAuctionEvent_by_time(string end);
    
    //event to notify the participants that an auction has ended by system time specification
    event EndAuctionEvent_by_system(string end);
    
    // modifier the show error when the spefied duration of the auction has come to an end and it will be declenched in the 
    //auctionEnded_byTime function
    modifier AuctionTimeIsOver
    {
        require(now <= _auctionEndTime);
        _;
    }
    
    // function to start the auction 
    function startAuction(uint _initialBid, uint _videoDuration, string memory _videoResolution,string memory _videoName,string memory _videoID )public
    {
        //notify the participants that an auction has started
        emit StartAuctionEvent(_initialBid, _videoDuration, _videoResolution, _videoName, _videoID);
        // We will initialize the contract with a bid for initial bid precised by the owner from 0x0
        AllBids.push(Bid(address(0), _initialBid));
        // We will initialize the contract with the current timespan of the block 
        _auctionStartTime = now;
    }

    //if auction owner ends then all participants must be notified and winner shown 
    function auctionEnded_byOwner() public returns (address, uint) 
    {
            emit EndAuctionEvent_by_owner('auctionEnded by owner request');
            return getTopBid();
    }
    
    //if auction time ends then it ends and modifier declenched and winner shown
    function auctionEnded_byTime(uint auctionDuration) public  returns (address, uint) 
    {
        _auctionDuration = auctionDuration;
        
         require(_SysTime <= _auctionDuration,'please enter a duration that is higher then the system time of auction');
         
        _auctionEndTime = _auctionStartTime + _auctionDuration;
        
        if (now <= _auctionEndTime)
        {
            // getRemainingTime();
            emit EndAuctionEvent_by_time('auctionEnded by time set by owner ');
            
            return getTopBid();
        }
    }
    
    
   //end auction when maximum time of the auction has been reached 
    function auctionEnded_bySystemTime( ) public returns (uint){
        
        //if (now >= _auctionStartTime + _SysTime)
     
        emit EndAuctionEvent_by_system('auctionEnded because it has passed the automatic time limit for auctions');
        return (2);
        // return getTopBid();
        
    }
    
    //function to calculated the remaining time of the auction
    function getRemainingTime() public AuctionTimeIsOver view returns (uint)
    {
        return _auctionEndTime-now;
    }

    // Users will submit a bid here as _bidPrice
    function submitBid(uint _bidPrice) public 
    {
        // The last index of the array is one less than the length
        uint lastIndex = AllBids.length - 1;
        // Ensure this bid is more than the current highest bid (the latest bid)
        require(_bidPrice > AllBids[lastIndex].bidAmount);
        // If it is, then push the new bid to the end of the array
        AllBids.push(Bid(msg.sender, _bidPrice));
    }

    // Getter function to return the "top bid", which is the last index of the array
    function getTopBid() public view returns (address, uint)
    {
        uint lastIndex = AllBids.length - 1;
        return (AllBids[lastIndex].user, AllBids[lastIndex].bidAmount);
    }

    // Getter function to return the total number of bids
    // Allows you to write a loop which goes through all the bids
    function getNumberOfBids() public view returns (uint) 
    {
        return AllBids.length;
    }
    
    // return the array that contains all the biding info 
    //However it needs a little bit of work in the front end to transform the data and make it visible in a good way
    function getAllBids() public view returns (address[] memory,uint[] memory) 
    {
        address[] memory biderAdress= new address[](AllBids.length);
        uint[] memory biderAmount= new uint[](AllBids.length);
        for(uint i = 0; i < AllBids.length; i++)
        {
            biderAdress[i] = AllBids[i].user;
            biderAmount[i] = AllBids[i].bidAmount;
        }
    return (biderAdress, biderAmount);
    }
    
    // Getter function to return a single bid from the array by index
    // Allows you to write a loop which goes through all the bids
    function getBid(uint index) public view returns (address, uint) 
    {
        return (AllBids[index].user, AllBids[index].bidAmount);
    }
    
}