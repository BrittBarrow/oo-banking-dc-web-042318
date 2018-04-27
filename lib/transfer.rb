class Transfer
  attr_reader :sender, :amount, :receiver
  attr_accessor :status

def initialize(sender, receiver, amount)
    @sender = sender
    @amount = amount
    @status = "pending"
    @receiver = receiver
  end

def valid?
  if sender.valid? && receiver.valid?
    true
  else
    false
  end
end

def execute_transaction
  #if $ in sender account is equal to or  more
  if self.valid? == true && sender.balance >= self.amount && self.status == "pending" #<--ensures each transfer can only happen once
    sender.balance -= self.amount
    receiver.balance += self.amount
    self.status = "complete"
  elsif sender.valid? == false || sender.balance < self.amount
    self.status = "rejected"
     "Transaction rejected. Please check your account balance."
   else
     self.status = "rejected"
   end
  end

def reverse_transfer
  # receiver sends back money to the sender only if status of Transfer is true
  if self.status == "complete"
    sender.balance += self.amount
    receiver.balance -= self.amount
    self.status = "reversed"
  end
end
end
