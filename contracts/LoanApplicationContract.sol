// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LoanApplicationContract {
    address public lender;
    address public borrower;
    
    // Loan details
    uint public loanAmount;
    uint public loanTerm;
    uint public interestRate;
    
    // Transaction records
    address public bankAddress;
    string public transactionRecordsHash;
    
    enum LoanStatus { Applied, Approved, Rejected }
    LoanStatus public status;

    // Events
    event LoanApplied(address borrower);
    event LoanApproved(address lender);
    event LoanRejected(address lender);
    
    constructor(
        uint _loanAmount,
        uint _loanTerm,
        uint _interestRate,
        address _bankAddress,
        string memory _transactionRecordsHash
    ) {
        lender = msg.sender;
        borrower = address(0);
        loanAmount = _loanAmount;
        loanTerm = _loanTerm;
        interestRate = _interestRate;
        bankAddress = _bankAddress;
        transactionRecordsHash = _transactionRecordsHash;
        status = LoanStatus.Applied;
    }

    // Apply for the loan
    function applyForLoan() external {
        require(status == LoanStatus.Applied, "Loan has already been processed.");
        borrower = msg.sender;
        status = LoanStatus.Approved;
        emit LoanApplied(msg.sender);
    }

    // Approve the loan
    function approveLoan() external {
        require(msg.sender == lender, "Only the lender can approve the loan.");
        require(status == LoanStatus.Approved, "Loan has not been applied or is already approved.");
        // Perform additional checks, credit scoring, etc., here.
        // If checks pass, proceed with loan approval.
        // If checks fail, reject the loan.
        
        // For the sake of simplicity, we'll consider all loans as approved.
        status = LoanStatus.Approved;
        emit LoanApproved(msg.sender);
    }

    // Reject the loan
    function rejectLoan() external {
        require(msg.sender == lender, "Only the lender can reject the loan.");
        require(status == LoanStatus.Approved, "Loan has not been applied or is already approved.");
        status = LoanStatus.Rejected;
        emit LoanRejected(msg.sender);
    }
}