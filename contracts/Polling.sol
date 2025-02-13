//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract Polling {
    struct Poll {
        uint256 pollId;
        string question;
        uint256 yesVotes;
        uint256 noVotes;
    }

    enum Vote {
        YES,
        NO
    }

    Poll[] private _allPolls;

    mapping(uint256 => mapping(address => bool)) public hasVoted; // pollId => voter => True/False

    event NewPoll(uint256 pollId, string question);
    event userVoted(address voter, uint256 pollId, Vote vote);

    function addPoll(string memory _question) external {
        uint256 newPollId = _allPolls.length;
        Poll memory newPoll = Poll({
            pollId: newPollId,
            question: _question,
            yesVotes: 0,
            noVotes: 0
        });

        _allPolls.push(newPoll);

        emit NewPoll(newPollId, _question);
    }

    modifier checkIfAlreadyVoted(uint256 _pollId) {
        require(
            !hasVoted[_pollId][msg.sender],
            "You have already voted on this poll."
        );
        _;
    }

    function voteToPoll(
        uint256 _pollId,
        Vote _vote
    ) public checkIfAlreadyVoted(_pollId) {
        Poll storage poll = _allPolls[_pollId];

        if (_vote == Vote.YES) {
            poll.yesVotes++;
        } else {
            poll.noVotes++;
        }

        hasVoted[_pollId][msg.sender] = true;

        emit userVoted(msg.sender, _pollId, _vote);
    }

    function getResults(
        uint256 _pollId
    )
        public
        view
        returns (string memory question, uint256 yesVotes, uint256 noVotes)
    {
        Poll memory poll = _allPolls[_pollId];
        
        question = poll.question;
        yesVotes = poll.yesVotes;
        noVotes = poll.noVotes;
    }
}
