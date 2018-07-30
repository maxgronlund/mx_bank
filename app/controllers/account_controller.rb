class AccountController < ApplicationController
  def index
    transactions = Transaction.retrive_for(current_user.uuid)
    Transaction.import(transactions)
    @transactions =
      Transaction
      .where(recipient: current_user.uuid)
      .or(Transaction.where(sender: current_user.uuid))
      .order(created_at: :desc)
  end
end

