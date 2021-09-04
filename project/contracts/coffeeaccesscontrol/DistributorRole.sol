pragma solidity ^0.5.11;

import "./Roles.sol";

// Manage this role - add, remove, check
contract DistributorRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event DistributorAdded(address indexed account);
  event DistributorRemoved(address indexed account);

  // Define a struct 'distributors' by inheriting from 'Roles' library, struct Role
  Roles.Role private distributors;

  // Makes the address that deploys this contract the 1st distributor
  constructor() public {
    _addDistributor(msg.sender);
  }

  // Checks to see if msg.sender has the appropriate role
  modifier onlyDistributor() {
    require(isDistributor(msg.sender));
    _;
  }

  // Checks this role
  function isDistributor(address account) public view returns (bool) {
    return distributors.has(account);
  }

  // Adds this role
  function addDistributor(address account) public onlyDistributor {
    _addDistributor(account);
  }

  // Renounces this role
  function renounceDistributor() public {
    _removeDistributor(msg.sender);
  }

  // Adds this role, called by 'addDistributor'
  function _addDistributor(address account) internal {
    distributors.add(account);
    emit DistributorAdded(account);
  }

  // Removes this role, called by 'removeDistributor'
  function _removeDistributor(address account) internal {
    distributors.remove(account);
    emit DistributorRemoved(account);
  }
}