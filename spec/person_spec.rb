require './src/person'
require './src/atm'
require './src/account'

describe Person do
  subject { described_class.new(name: 'Johnny') }

  it 'is expected to have a :name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'is expected to raise an error if no name is set' do
    expect { described_class.new }.to raise_error 'A name is required'
  end

  it 'is expected to have a :cash attribute with the value of 0 on initialize' do
    expect(subject.cash).to eq 0
  end

  it 'is expected to have a :account attribute' do
    expect(subject.account).to be nil
  end

  describe 'is expected to create an Account' do
    before { subject.create_account }
    it 'of Account class' do
      expect(subject.account).to be_an_instance_of Account
    end

    it 'is expected as himself as a owner' do
      expect(subject.account.owner).to be subject
    end
  end

  describe 'is expected to can manage funds if an account has been created' do
    let(:atm) { Atm.new }
    before { subject.create_account }
    it 'can deposit funds' do
      expect(subject.deposit(100)).to be_truthy
    end
  

    it 'is expected to add funds to the account balance - deducted from cash' do
      subject.cash = 100
      subject.deposit(100)
      expect(subject.account.balance).to be 100
      expect(subject.cash).to be 0
    end
    

    it 'is expected to withdraw funds' do
      command = lambda {
        subject.withdraw(amount: 100, pin: subject.account.pin_code, account: subject.account, atm: atm)
      }
      expect(command.call).to be_truthy
    end

    it 'is expected to withdraw to raise error if no ATM is passed in' do
      command = -> { subject.withdraw(amount: 100, pin: subject.account.pin_code, account: subject.account) }
      expect { command.call }.to raise_error 'An ATM is required'
    end

    it 'is expected to add funds to cash - deducted from account balance' do
      subject.cash = 100
      subject.deposit(100)
      subject.withdraw(amount: 100, pin: subject.account.pin_code, account: subject.account, atm: atm)
      expect(subject.account.balance).to be 0
      expect(subject.cash).to be 100
    end
  end
  describe 'is expected to not manage funds if no account been created' do
    # before { subject.account = :deactivated }
    it 'can\'t deposit funds' do
      # binding.pry
      expect { subject.deposit(100) }.to raise_error(RuntimeError, 'No account present')
    end
  end
end
