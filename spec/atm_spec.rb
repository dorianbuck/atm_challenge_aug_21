require_relative '../src/atm.rb'
require 'pry'
require 'date'

describe Atm do
  let(:account) { instance_double('Account', pin_code: '1234', exp_date: '04/22', account_status: :active) }

  before do
    # Before each test we need to add an attribute of `balance`
    # to the `account` object and set the value to `100`
    allow(account).to receive(:balance).and_return(100)
    # We also need to allow `account` to receive the new balance
    # using the setter method `balance=`
    allow(account).to receive(:balance=)
  end
  it 'is expected to allow withdraw if the account has enough balance.' do
    
    expected_output = { status: true, message: 'success', date: Date.today, amount: 45 }
   
    expect(subject.withdraw(45, '1234', account)).to eq expected_output
  end

  it 'is expected to have 1000 on initialize' do
    expect(subject.funds).to eq 1000
  end
  it 'is expected that funds are reduced at withdraw' do
    subject.withdraw(50, '1234', account)
    expect(subject.funds).to eq 950
  end
  it 'is expected to rejects withdraw if account has insufficient funds' do
    expected_output = { status: false, message: 'insufficient funds in account', date: Date.today }
    expect(subject.withdraw(105, '1234', account)).to eq expected_output
  end
  it 'is expected to reject withdraw if ATM has insufficient funds' do
    subject.funds = 50
    expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
    expect(subject.withdraw(100, '1234', account)).to eq expected_output
  end
  it 'is expected to reject withdraw if the pin is wrong' do
    expected_output = { status: false, message: 'wrong pin', date: Date.today }
    expect(subject.withdraw(50, 9999, account)).to eq expected_output
  end
  it 'is expected to reject withdraw if the card is expired' do
    allow(account).to receive(:exp_date).and_return('12/15')
    expected_output = { status: false, message: 'card expired', date: Date.today }
    expect(subject.withdraw(6, '1234', account)).to eq expected_output
  end
  it 'is expected to have :disabled account status' do
    # subject.account_status(:active)
    allow(account).to receive(:account_status).and_return(:disabled)
    expected_output = { status: false, message: 'account disabled', date: Date.today }
     expect(subject.withdraw(6, '1234', account, :disabled)).to eq expected_output
  end
end
