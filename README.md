# Bank Tech Test

This is a tech test challenge, during my 10th week at Makers Academy, a 12-week software developer bootcamp.

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN)
* Deposits, withdrawal
* Account statement (date, amount, balance) printing
* Data can be kept in memory (it doesn't need to be stored to a database or anything)

### Acceptance Criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
                  
### User Stories

```
As a bank user
So that I can store some money
I want to be able to make a deposit to my account
```

```
As a bank user
So that I can use some of my stored money
I want to be able to make a withdrawal from my account
```

```
As a bank user
So that I know when I am running out of money
I want to see an error message when I try to withdraw more money than the actual balance
```

```
As a bank user
So that I can see all the history of my transactions in reverse chronological order
I want to be able to see my overall account statement
```

### Domain Models

ACCOUNT           | STATEMENT           | TRANSACTION
----------------- | ------------------- | ---------------
@balance          | @transactions       | @date
@statement        | @transaction_class  | @credit
///////////////// | /////////////////// | @debit
deposit           | add_transaction     | @balance
withdraw          | format_transactions | ///////////////
print_statement   |                     | format
                  |                     | format_date
                  |                     | format_decimals

### Technologies Used

* ```ruby``` for the code
* ```rspec``` for testing
* ```rubocop``` for linting

### Prerequisites

* Clone this repository with ```git clone```
* Change into the folder with ```cd bank_tech_test```
* Run ```bundle``` to install all the dependencies
* Open IRB with ```irb```
* Require the model files with:
  - ```require "./lib/account.rb"```
  - ```require "./lib/statement.rb"```
  - ```require "./lib/transaction.rb"```
* You are now all set to start using the program via IRB

### How to Run the Tests

To run all the tests type ```rspec```

### How to run the Linter

To run the linter type ```rubocop```
