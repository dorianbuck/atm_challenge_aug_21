# First week challenge is to create an ATM app in Ruby.

## This simple app should simulate the logic for an ATM machine.

## SETUP INSTRUCTIONS

1. Run irb in your terminal

2. Load the ruby files by writing them one by one as follows:
   load './src/person.rb'
   load './src/account.rb'
   load './src/atm.rb'

3. You can now create a new person by writing:
   Person.new(name: 'name')

4. You can now create a new ATM by writing:
   Atm.new

5. You can now create account type by writing:
   Account.new(owner:Person)

## Example - Let's play around as Dorian

1.  ```
    dorian = Person.new(name: 'Dorian') => #<Person:0x00007f8e060ceb58 @name="Dorian", @cash=0, @account=nil>

    ```

2.  ```
    acc1 = Account.new(owner:dorian)
    => #<Account:0x00007f8e0189f5f8 @pin_code=4874, @owner=#<Person:0x00007f8e060ceb58 @name="Dorian", @cash=0, @account=nil>, @account_status=:active, @balance=0, @exp_date="09/26">
    ```

    ```

    ```

3.  atm = Atm.new
    => #<Atm:0x00007f8e01827dc8 @funds=1000>

    ```

    ```

4.  dorian.cash = 50
    => 50
    dorian
    => #<Person:0x00007f8e060ceb58 @name="Dorian", @cash=50, @account=nil>

    ```

    ```

5.  atm.withdraw(50, 4874, acc1)
    => {:status=>false, :message=>"insufficient funds in account", :date=>#<Date: 2021-09-03 ((2459461j,0s,0n),+0s,2299161j)>}

    ```

    ```

6.  acc1.balance = 500
    => 500

    ```

    ```

7.  acc1
    => #<Account:0x00007f8e0189f5f8 @pin_code=4874, @owner=#<Person:0x00007f8e060ceb58 @name="Dorian", @cash=50, @account=nil>, @account_status=:active, @balance=500, @exp_date="09/26">

    ```

    ```

8.  atm.withdraw(50, 4874, acc1)
    => {:status=>true, :message=>"success", :date=>#<Date: 2021-09-03 ((2459461j,0s,0n),+0s,2299161j)>, :amount=>50, :bills=>[20, 20, 10]}

    ```

    ```

9.  atm
    => #<Atm:0x00007f8e01827dc8 @funds=950>

    ```

    ```

10. acc1
    => #<Account:0x00007f8e0189f5f8 @pin_code=4874, @owner=#<Person:0x00007f8e060ceb58 @name="Dorian", @cash=50, @account=nil>, @account_status=:active, @balance=450, @exp_date="09/26">
    ```

    ```
