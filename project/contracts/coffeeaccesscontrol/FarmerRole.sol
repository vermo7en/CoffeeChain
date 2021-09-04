pragma solidity ^0.5.11;

import "./Roles.sol";

// Manage this role - add, remove, check
contract FarmerRole {
    using Roles for Roles.Role;

    // 2 events, one for Adding, and other for Removing
    event FarmerAdded(address indexed account);
    event FarmerRemoved(address indexed account);

    // Define a struct 'farmers' by inheriting from 'Roles' library, struct Role
    Roles.Role private farmers;

    // Makes the address that deploys this contract the 1st farmer
    constructor() public {
        _addFarmer(msg.sender);
    }

    // Checks to see if msg.sender has the appropriate role
    modifier onlyFarmer() {
        require(isFarmer(msg.sender));
        _;
    }

    // Checks this role
    function isFarmer(address account) public view returns (bool) {
        return farmers.has(account);
    }

    // Adds this role
    function addFarmer(address account) public onlyFarmer {
        _addFarmer(account);
    }

    // Renouces this role
    function renounceFarmer() public {
        _removeFarmer(msg.sender);
    }

    // Adds this role, called by 'addFarmer'
    function _addFarmer(address account) internal {
        farmers.add(account);
        emit FarmerAdded(account);
    }

    // Removes this role, called by 'removeFarmer'
    function _removeFarmer(address account) internal {
        farmers.remove(account);
        emit FarmerRemoved(account);
    }
}
