# Bank Tech Test

[Description](#description) | [Requirements](#requirements) | [Acceptance Criteria](#acceptance-criteria) | [User Stories](#user-stories) | [Domain Models](#domain-models) | [Design Approach](#design-approach) | [Code Structure](#code-structure) | [Technologies Used](#technologies-used) | [Getting Started](#getting-started) | [How to Run the Tests](#how-to-run-the-tests) | [Code Quality](#code-quality) | [How to Run the App](#how-to-run-the-app) | [Feature Test](#feature-test)

## Description

This is a tech test challenge, during my 10th week at Makers Academy, a 12-week software developer bootcamp.

## Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN)
* Deposits, withdrawal
* Account statement (date, amount, balance) printing
* Data can be kept in memory (it doesn't need to be stored to a database or anything)

## Acceptance Criteria

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
                  
## User Stories

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

## Domain Models

| ACCOUNT         | STATEMENT           | TRANSACTION
| --------------- | ------------------- | ---------------
| @balance        | @transactions       | @date
| @statement      | @transaction_class  | @credit
|                 |                     | @debit
|                 |                     | @balance
|                 |                     |
| current_balance | add_transaction     | format
| deposit         | format_transactions | format_time
| withdraw        |                     | format_decimals
| print_statement |                     |

## Design Approach

The program has three classes and each of them has a clear responsibility:

- **ACCOUNT**: takes care of the account behaviours, like keeping track of the overall balance, deposit on the account, withdraw from the account and print the overall statement. A statement instance variable is dependency injected into the account class, to allow the transaction history and formatting responsibilities to be carried out by the statement class.

- **STATEMENT**: takes care of the transactions history and formatting of all transactions into a printable statement. The transaction class is dependency injected into the statement class, to allow the creation of a new transaction at each deposit and withdrawal.

- **TRANSACTION**: takes care of the single transaction properties and their formatting.

## Code Structure

The code is structured into two main folders:
- The ```lib``` folder, which includes the code
- The ```spec``` folder, which includes the tests. This folder is also divided into two folders:
  - The ```features``` folder, which includes the feature tests
  - The ```units``` folder, which includes the unit tests

The code is structured this way to separate the model files from the tests files. In addition, this is the conventional way to structure Ruby code tested with RSpec.

## Technologies Used

* ```ruby``` for the code
* ```rspec``` for testing
* ```rubocop``` for linting
* ```simplecov``` for test coverage
* ```timecop``` for feature testing time-dependent code

## Getting Started

* Clone this repository with ```git clone```
* Change into the folder with ```cd bank```
* Run ```bundle``` to install all the dependencies
  
## How to Run the Tests

To run all the tests type ```rspec```

## Code Quality

To run the linter type ```rubocop```

## How to Run the App

* Open IRB with ```irb```
* Require the model files with:
  - ```require "./lib/account.rb"```
  - ```require "./lib/statement.rb"```
  - ```require "./lib/transaction.rb"```

## Feature Test

```
Makerss-MacBook-Air-2:bank andreadiotallevi$ irb
2.6.3 :001 > require "./lib/account.rb"
 => true 
2.6.3 :002 > require "./lib/statement.rb"
 => true 
2.6.3 :003 > require "./lib/transaction.rb"
 => true 
2.6.3 :004 > account = Account.new
 => #<Account:0x00007f8c21869408 @balance=0, @statement=#<Statement:0x00007f8c218693b8 @transactions=[], @transaction_class=Transaction>> 
2.6.3 :005 > account.current_balance
 => 0 
2.6.3 :006 > account.print_statement
date || credit || debit || balance
 => nil 
2.6.3 :007 > account.deposit(1000)
 => 1000 
2.6.3 :008 > account.print_statement
date || credit || debit || balance
28/01/2020 || 1000.00 || || 1000.00 => nil 
2.6.3 :009 > account.withdraw(500)
 => 500 
2.6.3 :010 > account.print_statement
date || credit || debit || balance
28/01/2020 || || 500.00 || 500.00
28/01/2020 || 1000.00 || || 1000.00 => nil 
2.6.3 :011 > account.withdraw(200)
 => 300 
2.6.3 :012 > account.print_statement
date || credit || debit || balance
28/01/2020 || || 200.00 || 300.00
28/01/2020 || || 500.00 || 500.00
28/01/2020 || 1000.00 || || 1000.00 => nil
```
