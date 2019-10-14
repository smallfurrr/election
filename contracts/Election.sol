pragma solidity ^0.5.8;

contract Election {
    // Read/write candidate
    string public candidate;

    // Constructor
    constructor() public {
        candidate = "Candidate 1";
    }
}