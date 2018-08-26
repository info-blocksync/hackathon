pragma solidity ^0.4.0;
contract RockPaperScissors {
    enum Move {ROCK, PAPER, SCISSORS, INVALID}

    struct Player {
        address playerAddress;
        Move move;
    }

    // Concern: Moves are on the blockchain and are public
    Player internal player1;
    Player internal player2;

    bool public gameFinished;
    address public winner;

    event EventGameEnded(address winner, uint winAmount);

    function Join() public payable {
        require(!gameFinished);
        require(player1.playerAddress == address(0) || player2.playerAddress == address(0));
        require(player1.playerAddress != msg.sender);

        if(player1.playerAddress == address(0)) {
            player1.playerAddress = msg.sender;
        }
        else {
            player2.playerAddress = msg.sender;
        }
    }

    function checkGameState() internal view
    {
        require(player1.playerAddress != address(0) && player2.playerAddress != address(0));
        require(!gameFinished);
    }

    function Play(Move move) public {
        checkGameState();
        require(player1.playerAddress == msg.sender || player2.playerAddress == msg.sender);

        if(player1.playerAddress == msg.sender) {
            require(player1.move == Move.INVALID);
            player1.move = move;
        }
        else {
            require(player2.move == Move.INVALID);
            player2.move = move;
        }
        
        if(player1.move != Move.INVALID && player2.move != Move.INVALID)
            judge();
    }

    function resetMoveState() internal
    {
        player1.move = Move.INVALID;
        player2.move = Move.INVALID;
    }

    function judge() internal {
        require(player1.move != Move.INVALID && player2.move != Move.INVALID);
        Move winningMove = rockPaperScissorWinningMove(player1.move, player2.move);
        if(winningMove == Move.INVALID)
        {
            resetMoveState();
            return;
        }
        if(winningMove == player1.move)
        {
           winner = player1.playerAddress; 
        }
        else
        {
           winner = player2.playerAddress; 
        }
        gameFinished = true;
        emit EventGameEnded(winner, address(this).balance);
        selfdestruct(winner);
    }

    function rockPaperScissorWinningMove(Move move1, Move move2) internal pure returns(Move)
    {
        require(move1 != Move.INVALID && move2 != Move.INVALID);
        if(move1 == move2)
        {
            return Move.INVALID;
        }
        if(move1 == Move.ROCK && move2 == Move.PAPER)
        {
            return Move.PAPER;
        }
        if(move1 == Move.ROCK && move2 == Move.SCISSORS)
        {
            return Move.ROCK;
        }
        if(move1 == Move.PAPER && move2 == Move.SCISSORS)
        {
            return Move.SCISSORS;
        }
    }

    constructor() public
    {
        resetMoveState();
        gameFinished = false;
    }
}
    