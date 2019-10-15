pragma solidity ^0.5.8;

contract Election {
    // Model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    // Adds candidates - runs when contract is migrated and deployed
    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }
    // Read/write candidates
    mapping(uint => Candidate) public candidates;
    // Store candidates count
    uint public candidatesCount;
    
    // Store accounts that have voted
    mapping(address => bool) public voters; 

    // Adding a candidate - private function (only used within contract)
    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    // Adding a vote 
    function vote (uint _candidateId) public {
        //require that person hasn't voted before 
        require(!voters[msg.sender]);

        //require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        //record that voter has voted
        voters[msg.sender] = true;

        //update candidate vote count
        candidates[_candidateId].voteCount ++;
    }
}
