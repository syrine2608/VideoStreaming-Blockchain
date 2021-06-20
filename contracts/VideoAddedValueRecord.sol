pragma solidity 0.5.0;
// this contract will be executed after a vid has been worked on by a freelancer who added a value to it 
//and his work has been approved by producer and new video with added value is uploaded to public 

contract VideoAddedValueRecord{
// enum input must be by index and mahdi needs to translate 
//because to get name of enum you need to set/assign it or I am taking it as input from mahdi
    enum language{nothing,english,french,arabic}
    
    enum marketing {nothing,SEO,intro,end}
    
//independent arrays cause functions in solidity still can not get struct as arg or return themm
    uint[]  vid_hash;
//array that contains the nbr of ads that a video contain
    uint[]  vid_ads;
//array f type enum because solidity still doesn't support string arrays as arg or output 
    language[]  vid_subtitles;
    language[]  vid_translation;
    marketing[]  vid_Marketing;
    
    
    function fill_vidFeatures(uint[] memory extracted_vid_hash, uint[] memory extracted_vid_ads, language[] memory extracted_vid_sub, language[] memory extracted_vid_trans, marketing[] memory extracted_vid_mrk) public 
    {
//extract the vid features received from mahdi into a local storage variable
//to be able to manipulate it and berform the necessary controls ( can't work on memory var)

        vid_hash = extracted_vid_hash;
        vid_ads = extracted_vid_ads;
        vid_subtitles = extracted_vid_sub;
        vid_translation = extracted_vid_trans;
        vid_Marketing = extracted_vid_mrk;

//extract the array that contains the history of feautures of video and translate the input in uint into the enum

        /*for ( uint i = 0 ; i<extracted_vid_sub.length ; i++){
            if(extracted_vid_sub[i] == 0)
            {
                vid_subtitles.push(language.nothing);
            }
            else if ( extracted_vid_sub[i] == 1)
            {
                vid_subtitles.push(language.english);
            }
             else if ( extracted_vid_sub[i] == 2)
            {
                vid_subtitles.push(language.french);
            }
            else if ( extracted_vid_sub[i] == 3)
            {
                vid_subtitles.push(language.arabic);
            }
        }
         for ( uint i = 0 ; i<extracted_vid_trans.length ; i++){
            if(extracted_vid_trans[i] == 0)
            {
                vid_translation.push(language.nothing);
            }
            else if ( extracted_vid_trans[i] == 1)
            {
                vid_translation.push(language.english);
            }
             else if ( extracted_vid_trans[i] == 2)
            {
                vid_translation.push(language.french);
            }
            else if ( extracted_vid_trans[i] == 3)
            {
                vid_translation.push(language.arabic);
            }
        }
                 for ( uint i = 0 ; i<extracted_vid_mrk.length ; i++){
            if(extracted_vid_mrk[i] == 0)
            {
                vid_Marketing.push(marketing.nothing);
            }
            else if ( extracted_vid_mrk[i] == 1)
            {
                vid_Marketing.push(marketing.SEO);
            }
             else if ( extracted_vid_mrk[i] == 2)
            {
                vid_Marketing.push(marketing.intro);
            }
            else if ( extracted_vid_mrk[i] == 3)
            {
                vid_Marketing.push(marketing.end);
            }
        }*/
        

    }
    // print/get all the feautures of specific vid

    function getAllVidHash() public view returns (uint[] memory){
        return(vid_hash);
    }function getAllVidAds() public view returns ( uint[] memory){
        return(vid_ads);
    }function getAllVidSub() public view returns ( language[] memory){
        return(vid_subtitles );
    }function getAllVidTrans() public view returns (language[] memory){
        return(vid_translation);
    }function getAllVidMrk() public view returns (marketing[] memory){
        return(vid_Marketing);
    }
    // function to add a new feature of a specific vid 
    function addNewSub(uint new_vid_hash, language new_vid_sub) public 
    returns(uint[] memory, uint[] memory, language[] memory, language[] memory, marketing[] memory)
    {
    vid_hash.push(new_vid_hash);
        uint lastIndex = vid_ads.length - 1;
    vid_ads.push(vid_ads[lastIndex]);
    vid_subtitles.push(new_vid_sub);
    vid_translation.push(language.nothing);
    vid_Marketing.push(marketing.nothing);
        return(vid_hash, vid_ads, vid_subtitles ,vid_translation,vid_Marketing);
    }
    function addNewTrans(uint new_vid_hash, language new_vid_trans) public 
    returns(uint[] memory, uint[] memory, language[] memory, language[] memory, marketing[] memory)
    {
    vid_hash.push(new_vid_hash);
        uint lastIndex = vid_ads.length - 1;
    vid_ads.push(vid_ads[lastIndex]);
    vid_subtitles.push(language.nothing);
    vid_translation.push(new_vid_trans);
    vid_Marketing.push(marketing.nothing);
        return(vid_hash,vid_ads,vid_subtitles ,vid_translation,vid_Marketing);

    }
    function addNewMrk(uint new_vid_hash, marketing new_vid_mrk) public 
    returns(uint[] memory, uint[] memory, language[] memory, language[] memory, marketing[] memory)
    {
    vid_hash.push(new_vid_hash);
        uint lastIndex = vid_ads.length - 1;
    vid_ads.push(vid_ads[lastIndex]);
    vid_subtitles.push(language.nothing);
    vid_translation.push(language.nothing);
    vid_Marketing.push(new_vid_mrk);
        return(vid_hash,vid_ads,vid_subtitles ,vid_translation,vid_Marketing);

    }
    function addNewAd(uint new_vid_hash) public 
    returns(uint[] memory, uint[] memory, language[] memory, language[] memory, marketing[] memory)
    {
    vid_hash.push(new_vid_hash);
    uint lastIndex = vid_ads.length - 1;
    vid_ads.push(vid_ads[lastIndex]+1);
    vid_subtitles.push(language.nothing);
    vid_translation.push(language.nothing);
    vid_Marketing.push(marketing.nothing);
        return(vid_hash,vid_ads,vid_subtitles ,vid_translation,vid_Marketing);

    }
}
