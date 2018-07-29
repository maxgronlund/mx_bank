class AccountController < ApplicationController
  def index
    Transaction.retrive_transactions(current_user)
    @transactions =
      Transaction
      .where(recipient: current_user.uuid)
      .or(Transaction.where(sender: current_user.uuid))
      .order(created_at: :desc)


  end

  def retrive_transactions
    transactions = current_user.retrive_transactions
    transactions.each do |transaction|
      complete_transaction(transaction)
    end
  end

  def complete_transaction(transaction)
    return 'sender not found' if User.find_by(uuid: transaction[:sender]).nil?

    transaction[:recipient] =
      administrator_uuid(transaction[:recipient])

    return 'recipient not found' if User.find_by(uuid: transaction[:recipient]).nil?

    ap create_transaction(transaction)
  end

  def create_transaction(transaction)
    options = transaction_options(transaction)
    Transaction
      .where(options)
      .first_or_create(options)
  end

  def transaction_options(transaction = {})
    {
      amount: transaction[:meta][:amount],
      sender: transaction[:sender],
      recipient: transaction[:recipient],
      state: Transaction::COMPLETED,
      transaction_type: transaction[:transaction_type],
      uuid: transaction[:uuid],
      meta: transaction[:meta]
    }
  end

  # if the transactions recipient is the site's uuid
  # the swap it to the administrator uuid
  def administrator_uuid(recipient_uuid)
    return System.administrator.uuid if recipient_uuid ==  Rails.configuration.uuid
    recipient.uuid
  end
end

