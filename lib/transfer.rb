require "pry"

class Transfer
  attr_accessor :status
  attr_writer
  attr_reader :sender, :receiver, :amount

  #class attribute(s)

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? &&self.sender.balance >= self.amount
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    else
    end
  end

end
