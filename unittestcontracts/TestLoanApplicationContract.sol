// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/LoanApplicationContract.sol";

contract TestLoanApplicationContract {
    // The address of the deployed contract to be tested
    LoanApplicationContract loanContract = LoanApplicationContract(DeployedAddresses.LoanApplicationContract());

    // Test the applyForLoan function
    function testApplyForLoan() public {
        // Ensure the contract is in the "Applied" state
        LoanApplicationContract.LoanStatus initialStatus = loanContract.status();
        Assert.equal(uint(initialStatus), uint(LoanApplicationContract.LoanStatus.Applied), "Initial status should be Applied");

        // Apply for the loan
        loanContract.applyForLoan();

        // Check if the status is now "Approved"
        LoanApplicationContract.LoanStatus newStatus = loanContract.status();
        Assert.equal(uint(newStatus), uint(LoanApplicationContract.LoanStatus.Approved), "Status should be Approved after applying for the loan");
    }

    // Test the approveLoan function
    function testApproveLoan() public {
        // Ensure the contract is in the "Approved" state
        LoanApplicationContract.LoanStatus initialStatus = loanContract.status();
        Assert.equal(uint(initialStatus), uint(LoanApplicationContract.LoanStatus.Approved), "Initial status should be Approved");

        // Only the lender can approve the loan, so let's simulate the lender's address
        address lenderAddress = address(this); // Replace with the lender's address

        // Simulate lender's approval
        loanContract.approveLoan({from: lenderAddress});

        // Check if the status is still "Approved"
        LoanApplicationContract.LoanStatus newStatus = loanContract.status();
        Assert.equal(uint(newStatus), uint(LoanApplicationContract.LoanStatus.Approved), "Status should remain Approved");
    }

    // Test the rejectLoan function
    function testRejectLoan() public {
        // Ensure the contract is in the "Approved" state
        LoanApplicationContract.LoanStatus initialStatus = loanContract.status();
        Assert.equal(uint(initialStatus), uint(LoanApplicationContract.LoanStatus.Approved), "Initial status should be Approved");

        // Only the lender can reject the loan, so let's simulate the lender's address
        address lenderAddress = address(this); // Replace with the lender's address

        // Simulate lender's rejection
        loanContract.rejectLoan({from: lenderAddress});

        // Check if the status is now "Rejected"
        LoanApplicationContract.LoanStatus newStatus = loanContract.status();
        Assert.equal(uint(newStatus), uint(LoanApplicationContract.LoanStatus.Rejected), "Status should be Rejected after rejection");
    }
}
