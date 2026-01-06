// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Vote
{
    address public owner;
    enum VotingStatus { OFF, ON }
    VotingStatus public status;
    mapping(address => bool) alreadyVoted; 

     constructor() 
    {
        owner = msg.sender;
    }

    uint candidate1 = 0;
    uint candidate2 = 0;
    
    function Toggle_Voting_On() public 
    {
        require(msg.sender == owner, "only owner input allowed");
        status = VotingStatus.ON;
    }
    function Toggle_Voting_Off() public 
    {
        require(msg.sender == owner, "only owner input allowed");
        status = VotingStatus.OFF;
    }
    function vote(uint _candidateId) public
    {
        
    require(status == VotingStatus.ON, "Voting is turned off");
    require(alreadyVoted[msg.sender] == false, "You have already voted");
    require(_candidateId == 1 || _candidateId == 2, "Invalid candidate");

    alreadyVoted[msg.sender] = true;
    if(_candidateId == 1)
    {
        candidate1++;
    }
    else if(_candidateId == 2)
    {
        candidate2++;
    }
    }
    function getVotes() public view returns (uint, uint)
    {
        return (candidate1, candidate2);
    }
    

}