require 'pry'
class Transfer

  attr_reader :sender, :receiver, :status, :amount

  def initialize(from_acct, to_acct, transfer_amount)
    @sender = from_acct
    @receiver = to_acct
    @status = "pending"
    @amount = transfer_amount

  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    # binding.pry
    return "Transaction already completed." if @status == "complete"
    if !self.valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    if self.sender.balance < self.amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    self.sender.decrease_balance(self.amount)
    self.receiver.deposit(self.amount)
    @status = "complete"
  end

  def reverse_transfer
    return "Cannot reverse an incomplete transfer" if self.status != "complete"
    self.receiver.decrease_balance(self.amount)
    self.sender.deposit(self.amount)
    @status = "reversed"
  end

end #of Transfer class
