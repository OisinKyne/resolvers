pragma solidity ^0.5.8;

import "../ResolverBase.sol";

contract TokenIDResolver is ResolverBase {
    bytes4 constant private TOKENID_INTERFACE_ID = 0x4b23de55;

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

    /**
     * Sets the tokenID associated with an ENS node.
     * May only be called by those authorised for this node in the ENS registry.
     * @param node The node to update.
     * @param token The tokenID to set
     */
    function setTokenID(bytes32 node, uint256 token) public authorised(node) {
        emit TokenIDChanged(node, token);
        _tokenIDs[node] = token;
    }

    function setTokenID(bytes32 node, uint256 token, address addr) public authorised(node) {
        emit TokenIDChanged(node, token);
        _tokenIDs[node] = token;
        super.setAddr(node, addr);
    }

    function setTokenID(bytes32 node, uint256 token, uint coinType, bytes memory a) public authorised(node) {
        emit TokenIDChanged(node, token);
        _tokenIDs[node] = token;
        super.setAddr(node, coinType, a);
    }

    function supportsInterface(bytes4 interfaceID) public pure returns(bool) {
        return interfaceID == TOKENID_INTERFACE_ID || super.supportsInterface(interfaceID);
    }
}
