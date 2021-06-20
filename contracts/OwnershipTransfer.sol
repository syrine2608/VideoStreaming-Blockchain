pragma solidity 0.5.0;

contract OwnershipTransfer {
    
//variable to store the address of the owner who will add the new owner ( selling owner)
    address public executable_owner;
    
//array to store video's owners that will be given by mahdi from database (input)
    address[] public owners;
    
//event emited to announce the add of a new owner of the video to participants 
    event Owneradded(address indexed executableOwner, address indexed newOwner, uint time);
    event extracted(string);

    constructor(address[] memory extracted_owners_list) public 
    {
//store the address of the executer of contract
        executable_owner = msg.sender;
         owners = extracted_owners_list;
        emit extracted('owners filled');
    }
    
// error in length and value mismatch cause can't do .length for memory array 
// when filling the array it must be filled with ["adress1","adress2"]
  /*function fill_owners(address[] memory extracted_owners_list) public returns(address[] memory)
    {
//extract the array of owners received from mahdi into a local storage variable
//to manipulate it and berform the necessary controls

        owners = extracted_owners_list;
        return(owners);
        emit extracted('owners filled');
    }*/
    
//function to print the owner array content
    function getAllOwners() public view returns (address[] memory){
        return(owners);
    }
//control that the person who will transfert the ownership is in fact the same as the one who executed the contract
    modifier isOwner() 
    {
        require(msg.sender == executable_owner);
        _;
    }
    
//function to control if the owner address to be added is in fact a new owner 
    function ownerExists(address newOwner) public view returns( bool)
    {
        bool ownerAlreadyExists = false;
        uint i = 0;
        while ((ownerAlreadyExists == false) && (i < owners.length))
        {
            if (owners[i] == newOwner)
            {
                ownerAlreadyExists = true;
            }
            i ++;
        }
        return(ownerAlreadyExists);
    }
    
//function to add the new owner to the owners list of that video ( transfert ownership)
//add modofier control
    function transferOwnership(address newOwner) public isOwner 
    returns(address[] memory)
    {
        bool checkOwnerExstince = ownerExists(newOwner);
//control on the owner to be added: he is identifiable (physicall exists) & not already an owner
        require((newOwner != address(0)) && (checkOwnerExstince == false));
//emit event 
       emit Owneradded(executable_owner, newOwner, now);
//add new owner in the owners array
        owners.push(newOwner);
//return updated array to mahdi to be updated in the database
       return(owners);
    }

}