pragma solidity ^0.5.8;

contract Election {
    // Model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Read/write candidates
    mapping(uint => Candidate) public candidates;

    // Store candidates count
    uint public candidatesCount;

    // Adds candidates - runs when contract is migrated and deployed 
    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    // Adding a candidate - private function (only used within contract)
    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}
