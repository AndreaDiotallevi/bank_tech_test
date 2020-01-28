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
                  |                     | @debit
                  |                     | @balance
................. | ................... | .............
deposit           | add_transaction     | format
withdraw          | format_transactions | format_date
print_statement   |                     | format_decimals

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
  - ```require "date"```

### How to Use It - Feature Test

```
Makerss-MacBook-Air-2:bank andreadiotallevi$ irb
2.6.3 :001 > require "./lib/account.rb"
 => true 
2.6.3 :002 > require "./lib/statement.rb"
 => true 
Makerss-MacBook-Air-2:bank andreadiotallevi$ irb
2.6.3 :001 > require "./lib/account.rb"
 => true 
2.6.3 :002 > require "./lib/statement.rb"
 => true 
2.6.3 :003 > require "./lib/transaction.rb"
 => true 
2.6.3 :004 > require "date"
 => true 
2.6.3 :005 > account = Account.new
 => #<Account:0x00007ffadc0f8a50 @balance=0, @statement=#<Statement:0x00007ffadc0f8a00 @transactions=[], @transaction_class=Transaction>> 
2.6.3 :006 > account.balance
 => 0 
2.6.3 :007 > account.print_statement
 => "date || credit || debit || balance\n" 
2.6.3 :008 > account.deposit(1000)
 => 1000 
2.6.3 :009 > account.print_statement
 => "date || credit || debit || balance\n28/01/2020 || 1000.00 || || 1000.00" 
2.6.3 :010 > account.withdraw(500)
 => 500 
2.6.3 :011 > account.balance
 => 500 
2.6.3 :012 > account.print_statement
 => "date || credit || debit || balance\n28/01/2020 || || 500.00 || 500.00\n28/01/2020 || 1000.00 || || 1000.00" 
2.6.3 :013 > account.deposit(200)
 => 700 
2.6.3 :014 > account.print_statement
 => "date || credit || debit || balance\n28/01/2020 || 200.00 || || 700.00\n28/01/2020 || || 500.00 || 500.00\n28/01/2020 || 1000.00 || || 1000.00" 
 ```

### How to Run the Tests

To run all the tests type ```rspec```

### How to run the Linter

To run the linter type ```rubocop```
