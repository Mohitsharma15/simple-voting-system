# simple-voting-system smart contract

This solidity smart contract implements a simple and transparent voting system between two candidates.

## contract overview
-The contract allows users to vote for one of two candidates.
-Each wallet address is allowed to vote only once.
-voting can be turned off or on by the contract owner.

## Ownership Logic
- The owner of the contract is set during deployment using the contructor.
- The deployer's address ('msg.sender') become the owner.
- Only the owner is allowed to enable or disable voting.

## Voting Process
- Users can vote by calling the 'vote(uint_candidatedId) function.
-Vaid candidate IDs are :
- '1' for candidate 1
- '2' for candidate 2
- if an invalid candidate IDs is provided,the transaction fails.

## Double Voting Prevention
- A mapping is used to track whether an address has already voted.
- Once an address votes, it cannot vote again.
- Any attempt to vote more than once will fail.

## Voting Status Control 
- Voting status is controlled using an enum with states: 'ON' and OFF.
- Voting is only allowed when states is 'ON'.
- The owner can toggle voting using dedicated functions.

## Functions
- vote(uint_candidateId): Allows a user to vote for a candidate functions.
- getVotes() : Returns the total vote count for both candidates.
- Toggle_Votting_on() : Enables voting (owner only).
- Toggle_Votting_off() : Disable voting (owner only).
