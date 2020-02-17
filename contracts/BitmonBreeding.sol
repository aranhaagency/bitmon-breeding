pragma solidity ^0.6.0;

/**
 * @title BitmonBreeding
 * @dev The BitmonBreeding contracts is an algorithm to generate new bitmon ADN based on father and mother properties.
 * @author Enrique Berrueta eabz@polispay.org
 */



contract BitmonOwnership is BitmonBase {
    string public constant name = "BitmonBreeding";
    string public constant symbol = "BMB";

}


/// @title Bitmon Breeding contract
/// @author Aranha Agency (https://aranha.agency)
/// @dev See the BitmonCore contract documentation
contract BitmonBreeding is BitmonOwnership {

    /// @dev The Pregnant event is fired when two bitmon successfully breed and the pregnancy
    ///
    event Pregnant(address owner, uint256 fatherID, uint256 motherID):

    /// @notice The minimum payment required to use breedWithAuto(). This fee goes towards
    ///  the gas cost paid by whatever calls giveBirth(), and can be dynamically updated by
    ///  the COO role as the gas price changes.
    uint256 public autoBirthFee = 2 finney;

    // Keeps track of number of pregnant Bitmon.
    uint256 public pregnantBitmon;

    /// @dev The address of the sibling contract that is used to implement the sooper-sekret
    ///  genetic combination algorithm.
    GeneScienceInterface public geneScience;

    /// @dev Update the address of the genetic contract, can only be called by the CEO.
    /// @param _address An address of a GeneScience contract instance to be used from this point forward.
    function setGeneScienceAddress(address _address) external onlyCEO {
        GeneScienceInterface candidateContract = GeneScienceInterface(_address);

        // NOTE: verify that a contract is what we expect - https://github.com/Lunyr/crowdsale-contracts/blob/cfadd15986c30521d8ba7d5b6f57b4fefcc7ac38/contracts/LunyrToken.sol#L117
        require(candidateContract.isGeneScience());

        // Set the new contract address
        geneScience = candidateContract;
    }


    /// @dev Updates the minimum payment required for calling giveBirthAuto(). Can only
    ///  be called by the COO address. (This fee is used to offset the gas cost incurred
    ///  by the autobirth daemon).
    function setAutoBirthFee(uint256 val) external onlyCOO {
        autoBirthFee = val;
    }
}


/// @title SEKRETOOOO
contract GeneScienceInterface {
    /// @dev simply a boolean to indicate this is the contract we expect to be
    function isGeneScience() public pure returns (bool);

    /// @dev given genes of Bitmon 1 & 2, return a genetic combination - may have a random factor
    /// @param genes1 genes of Mother
    /// @param genes2 genes of Father
    /// @return the genes that are supposed to be passed down the child
    function mixGenes(uint256 genes1, uint256 genes2, uint256 targetBlock) public returns (uint256);
}