// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/ForceCode.sol";

contract ForceCodeContestTest is Test {
    ForceCode public contest;
    address public manager;
    address public player1;
    address public player2;
    address public player3;
    
    // Setup function runs before each test
    function setUp() public {
        // Create contest instance
        contest = new ForceCode();
        
        // Setup test addresses
        manager = address(this);
        player1 = makeAddr("player1");
        player2 = makeAddr("player2");
        player3 = makeAddr("player3");
        
        // Give each player some ETH
        vm.deal(player1, 1 ether);
        vm.deal(player2, 1 ether);
        vm.deal(player3, 1 ether);
    }
    
    // Test creating a new contest
    function test_CreateContest() public {
        uint256 contestId = contest.createContest();
        assertEq(contestId, 0, "First contest should have ID 0");
        
        uint256 nextContestId = contest.createContest();
        assertEq(nextContestId, 1, "Second contest should have ID 1");
    }
    
    
    }