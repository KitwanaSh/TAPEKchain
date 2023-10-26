# ABSA HACKATHON
The __absa hackaton__ is designed to create banking or finance solutions using blockchain technology.
This project is made on that purpose, we are among _20 other teams_ that competed on this hackathon.

In our project, we are solving the challenges that SMEs face currently, which are the inefficiencies, high costs and redundancies associated with traditional methods for Know Your Customer (`KYC`) and creditworthiness processes for loan applications.
With this probem, we thought of the following contracts:

## Main contracts
### Approve Loan Application
This contract is only valid when the customer meets a specific cretiria. The criteria is,
when the total amount of turnover is greater than the total amount of expenses. The transaction history is tracked only if customer
has been utilizing thier momo for at leat the past _2 years_.
### Decline Loan Application
This contract is the opposite of the Approve loan application. When The customer doesn't have a transaction history for _at least 2 years_, then the declination occurs. Also for another declination is when the number of turnover is less than the number of expenses.

## Sub-contracts
Other contracts that we have here are like:
- Credit momo transation
- Debit momo transaction

The whole contracts are built in the __contracts__ folder, in the `LoanApplicationContract.sol` file. The contact itself is called
`LoanAppicationContract`. Then the functionalities are _approved_, _reject_, _applyForLoan_.