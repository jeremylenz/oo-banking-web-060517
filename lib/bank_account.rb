class BankAccount

  attr_reader   :name
  attr_accessor :balance, :status

  def initialize(owner_name)
    @name = owner_name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    @status = "closed"
  end

  def decrease_balance(transfer_amount)
    @balance -= transfer_amount
  end

end #of BankAccount class
