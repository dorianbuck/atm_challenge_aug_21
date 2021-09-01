class Account
  attr_accessor :pin_code, :owner
  
  def initialize(attrs = {})
    @pin_code = gen_pin_code
    set_owner(attrs[:owner])
  end

  def gen_pin_code
    rand(1000..9999)
  end

  private
  def set_owner(obj)
    obj == nil ? missing_owner : @owner = obj
end
end