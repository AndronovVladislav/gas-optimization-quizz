// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./Interfaces.sol";

contract Errors is IErrors {
    address owner;

    modifier onlyOwner() {
        require(owner == msg.sender, "Error: You are not a owner!");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function call() public view onlyOwner {}
}

contract ErrorsOptimized is IErrors {
    address immutable owner;  // Trick 1: immutable field

    modifier onlyOwner() {
        require(owner == msg.sender, "Get out!");  // Trick 2: shorter string in error
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function call() public view onlyOwner {}
}
