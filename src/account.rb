class Account
  require 'date'
  attr_accessor :pin_code, :owner, :account_status, :balance

  STANDARD_VALIDITY_YRS = 5

  def initialize(attrs = {})
    @pin_code = gen_pin_code
    set_owner(attrs[:owner])
    @account_status = :active
    @balance = 0
  end

  def exp_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def gen_pin_code
    rand(1000..9999)
  end

  # Class method
  def self.deactivate(account)
    account.account_status = :deactivated
  end

  # Instance method
  def deactivate
    @account_status = :deactivated
  end

  # What is private actually doing?
  private

  def set_owner(obj)
    obj.nil? ? missing_owner : @owner = obj
  end

  def missing_owner
    raise 'An Account owner is required'
  end
end
