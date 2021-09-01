class Account
  require 'date'
  STANDARD_VALIDITY_YRS = 5
  attr_accessor :pin_code, :owner, :exp_date, :account_status

  def initialize(attrs = {})
    @pin_code = gen_pin_code
    @exp_date = set_expire_date #Not positive about this one...
    set_owner(attrs[:owner])
    @account_status = :active
  end

  def set_expire_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def gen_pin_code
    rand(1000..9999)
  end
  
  # Class method
  def self.deactivate(account)
    account.account_status = :deactivated
  end

  # Instance method
  # def deactivate
    # @account_status = :deactivated
  # end

 # What is private actually doing? 
  private

  
  
  
  

  def set_owner(obj)
    obj.nil? ? missing_owner : @owner = obj
  end

  def missing_owner
  raise "An Account owner is required"
  end
end
