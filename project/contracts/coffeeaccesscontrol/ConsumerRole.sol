pragma solidity ^0.5.11;

import "./Roles.sol";

// Manages this role - add, remove, check
contract ConsumerRole {
    using Roles for Roles.Role;

    // 2 events, one for Adding, and other for Removing
    event ConsumerAdded(address indexed account);
    event ConsumerRemoved(address indexed account);

    // Define a struct 'consumers' by inheriting from 'Roles' library, struct Role
    Roles.Role private consumers;

    // Makes the address that deploys this contract the 1st consumer
    constructor() public {
        _addConsumer(msg.sender);
    }

    // Checks to see if msg.sender has the appropriate role
    modifier onlyConsumer() {
        require(isConsumer(msg.sender));
        _;
    }

    // Checks this role
    function isConsumer(address account) public view returns (bool) {
        return consumers.has(account);
    }

    // Adds this role
    function addConsumer(address account) public onlyConsumer {
        _addConsumer(account);
    }

    // Renounces this role
    function renounceConsumer() public {
        _removeConsumer(msg.sender);
    }

    // Adds this role, called by 'addConsumer'
    function _addConsumer(address account) internal {
        consumers.add(account);
        emit ConsumerAdded(account);
    }

    // Removes this role, called by 'removeConsumer'
    function _removeConsumer(address account) internal {
        consumers.remove(account);
        emit ConsumerRemoved(account);
    }
}
