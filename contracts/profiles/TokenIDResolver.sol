pragma solidity ^0.5.8;

import "../ResolverBase.sol";

contract TokenIDResolver is ResolverBase {
    bytes4 constant private TOKENID_INTERFACE_ID = bytes4(keccak256("tokenID(bytes32)")) ^ bytes4(keccak256("setTokenID(bytes32,uint256)"));

    event TokenIDChanged(bytes32 indexed node, uint256 tokenID);

    mapping(bytes32=>uint256) _tokenIDs;

    /**
     * Returns the tokenID associated with an ENS node.
     * @param node The ENS node to query.
     * @return The associated tokenID.
     */

    function tokenID(bytes32 node) public view returns(uint256) {
        return _tokenIDs[node];
    }

    function setTokenID(bytes32 node, uint256 token) public authorised(node) {
        emit TokenIDChanged(node, token);
        _tokenIDs[node] = token;
    }

    function supportsInterface(bytes4 interfaceID) public pure returns(bool) {
        return interfaceID == TOKENID_INTERFACE_ID || super.supportsInterface(interfaceID);
    }
}
