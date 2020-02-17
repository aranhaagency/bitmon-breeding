pragma solidity ^0.6.0;

/**
 * @title BitmonBreeding
 * @dev The BitmonBreeding contracts is an algorithm to generate new bitmon ADN based on father and mother properties.
 * @author Enrique Berrueta eabz@polispay.org
 */



contract BitmonOwnership  {
    string public constant name = "BitmonBreeding";
    string public constant symbol = "BMB";


    /*** DATA TYPES ***/

    ///  @dev The main Bitmon struct. Every bitmoin in BitmonBreeding is represented by a copy
    ///  of this structure, so great care was taken to ensure that it fits neatly into
    ///  exactly two 256-bit words. Note that the order of the members in this structure
    ///  is important because of the byte-packing rules used by Ethereum.
    ///  Ref: http://solidity.readthedocs.io/en/develop/miscellaneous.html
    struct Bitmon {
        // The Bitmon's genetic code genetic code is packed into these 256-bits, the format is
        // sooper-sekret! A Bitmon's genes never change.
        uint256 genes;
        
        // Unique ID to identify this Bitmon
        uint256 bitmonID;
       
        // Father unique ID to trace parent line
        uint256 fatherID;  

        // Mother unique ID to trace parent line
        uint256 motherID; 
        
        // Gender definition (female 1 or male 0)
        uint8 gender; 
        
        // Characteristics of the behaviour (between 1 to 30)
        uint8 nature; 

        // Specie identifier
        uint16 pecimen; 

        // Speciment purity (Between 0 and 100)
        uint8 purity; 
        
        // BlockHeight of the network at Bitmon born.
        uint256 birthHeight;

        // Color variants (0 for normal, 1 for special, 2 for ugly)
        uint8 variant;

        // The "generation number" of this Bitmon. 
        uint16 generation;

        // Power and Helth
        // Health
        uint8 h; 

        // Attack
        uint8 a;
        
        // Special attack
        uint8 sa;

        // Defense 
        uint8 d; 

        // Special defense
        uint8 sd; 

    }
}


/// @title Bitmon Breeding contract
/// @author Aranha Agency (https://aranha.agency)
/// @dev See the BitmonCore contract documentation
contract BitmonBreeding is BitmonOwnership {

}
