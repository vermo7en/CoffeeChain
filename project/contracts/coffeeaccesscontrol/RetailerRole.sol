pragma solidity ^0.5.11;

import "./Roles.sol";

contract RetailerRole {
    using Roles for Roles.Role;

    // 2 events, one for Adding, and other for Removing
    event RetailerAdded(address indexed account);
    event RetailerRemoved(address indexed account);

    // Defines a struct 'retailers' by inheriting from 'Roles' library, struct Role
    Roles.Role private retailers;

    // Makes address that deploys this contract the 1st retailer
    constructor() public {
        _addRetailer(msg.sender);
    }

    // Checks to see if msg.sender has the appropriate role
    modifier onlyRetailer() {
        require(isRetailer(msg.sender));
        _;
    }

    // Checks this role
    function isRetailer(address account) public view returns (bool) {
        return retailers.has(account);
    }

    // Adds this role
    function addRetailer(address account) public onlyRetailer {
        _addRetailer(account);
    }

    // Renounces this role
    function renounceRetailer() public {
        _removeRetailer(msg.sender);
    }

    // Adds this role, called by 'addRetailer'
    function _addRetailer(address account) internal {
        retailers.add(account);
        emit RetailerAdded(account);
    }

    // Removes this role, called by 'removeRetailer'
    function _removeRetailer(address account) internal {
        retailers.remove(account);
        emit RetailerRemoved(account);
    }
}
