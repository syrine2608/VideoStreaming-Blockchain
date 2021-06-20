pragma solidity 0.5.0;

contract VidSaleReceipt{
     
    uint  vid_sale_price;
    event receipt_generated(uint _vidPrice);
    
    function receiptGeneration(string memory _vidResolution,string memory _vidpopularity,uint _vidSalePrice) public returns(uint)
    {
        vid_sale_price=_vidSalePrice;
        
        //compare the hash of strings to compare the strings(no direct comparision in solidity)
        
        if (keccak256(abi.encodePacked(_vidResolution)) == keccak256(abi.encodePacked('SD')) && keccak256(abi.encodePacked(_vidpopularity)) == keccak256(abi.encodePacked('not popular')))
        {
            vid_sale_price = 1 * vid_sale_price ;
        }
        
        else if (keccak256(abi.encodePacked(_vidResolution)) == keccak256(abi.encodePacked('SD')) && keccak256(abi.encodePacked(_vidpopularity)) == keccak256(abi.encodePacked('popular')))
        {
            vid_sale_price = 2 * vid_sale_price ;
        }
        
        else if (keccak256(abi.encodePacked(_vidResolution)) == keccak256(abi.encodePacked('SD')) && keccak256(abi.encodePacked(_vidpopularity)) == keccak256(abi.encodePacked('very popular')))
        {
            vid_sale_price = 3 * vid_sale_price ;
        }
        
        else if (keccak256(abi.encodePacked(_vidResolution)) == keccak256(abi.encodePacked('HD')) && keccak256(abi.encodePacked(_vidpopularity)) == keccak256(abi.encodePacked('not popular')))
        {
            vid_sale_price = 2 * vid_sale_price ;
        }
        else if (keccak256(abi.encodePacked(_vidResolution)) == keccak256(abi.encodePacked('HD')) && keccak256(abi.encodePacked(_vidpopularity)) == keccak256(abi.encodePacked('popular')))
        {
            vid_sale_price = 3 * vid_sale_price ;
        }
        else if (keccak256(abi.encodePacked(_vidResolution)) == keccak256(abi.encodePacked('HD')) && keccak256(abi.encodePacked(_vidpopularity)) == keccak256(abi.encodePacked('very popular')))
        {
            vid_sale_price = 4 * vid_sale_price ;
        }
        else if(keccak256(abi.encodePacked(_vidResolution)) == keccak256(abi.encodePacked('Full HD'))&& keccak256(abi.encodePacked(_vidpopularity)) == keccak256(abi.encodePacked('not popular')))
        {
             vid_sale_price = 3 * vid_sale_price ;
        }
        else if(keccak256(abi.encodePacked(_vidResolution)) == keccak256(abi.encodePacked('Full HD'))&& keccak256(abi.encodePacked(_vidpopularity)) == keccak256(abi.encodePacked('popular')))
        {
             vid_sale_price = 4 * vid_sale_price ;
        }
        else if(keccak256(abi.encodePacked(_vidResolution)) == keccak256(abi.encodePacked('Full HD'))&& keccak256(abi.encodePacked(_vidpopularity)) == keccak256(abi.encodePacked('very popular')))
        {
             vid_sale_price = 5 * vid_sale_price ;
        }
        
        else if(keccak256(abi.encodePacked(_vidResolution)) == keccak256(abi.encodePacked('4K')) && keccak256(abi.encodePacked(_vidpopularity)) == keccak256(abi.encodePacked('not popular')))
        {
            vid_sale_price = 4 * vid_sale_price ;
        }
        else if(keccak256(abi.encodePacked(_vidResolution)) == keccak256(abi.encodePacked('4K')) && keccak256(abi.encodePacked(_vidpopularity)) == keccak256(abi.encodePacked('popular')))
        {
            vid_sale_price = 5 * vid_sale_price ;
        }
        else if(keccak256(abi.encodePacked(_vidResolution)) == keccak256(abi.encodePacked('4K')) && keccak256(abi.encodePacked(_vidpopularity)) == keccak256(abi.encodePacked('very popular')))
        {
            vid_sale_price = 6 * vid_sale_price ;
        }
        
        return(vid_sale_price);
        
        emit receipt_generated(vid_sale_price);
    }
    function getPrice() public view returns(uint){
        return(vid_sale_price);
    }

}