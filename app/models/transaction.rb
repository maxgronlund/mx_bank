class Transaction < ApplicationRecord
  attr_accessor :payment_provider

  PAYMENT_WIRH_CREDIT_CARD = 'payment_with_credit_cart'
  PAYMENT_FROM_PAYMENT_GATEWAY = 'payment_from_payment_gateway'
  TRANSFER_BETWEEN_ACCOUNTS = 'tansfer_between_accounts'
  PAYMENT_WIRH_CRYPTOCURRENCY = 'payment_with_cryptocurrency'


  TRANSACTION_TYPES =
    [
      ['Payment with credit_cart', PAYMENT_WIRH_CREDIT_CARD],
      ['Payment from payment gateway', PAYMENT_FROM_PAYMENT_GATEWAY],
      ['Tansfer between accounts', TRANSFER_BETWEEN_ACCOUNTS],
      ['Payment with cryptocurrency', PAYMENT_WIRH_CRYPTOCURRENCY]
    ].freeze

  # Transaction states
  PENDING = 'pending'
  COMPLETED = 'completed'

  TRANSACTION_STATES =
    [
      ['Pending', PENDING],
      ['Completed', COMPLETED]
    ]

  # usage
  # Transaction.retrive_transactions(current_user)
  def self.retrive_transactions(user)
    return if user.nil?
    transactions = user.retrive_transactions
    transactions.each do |transaction|
      ap complete_transaction(transaction)
    end
  end

  def self.complete_transaction(transaction)
    return 'sender not found' if User.find_by(uuid: transaction[:sender]).nil?

    transaction[:recipient] =
      administrator_uuid(transaction[:recipient])

    return 'recipient not found' if User.find_by(uuid: transaction[:recipient]).nil?
    create_transaction(transaction)
  end

  def self.create_transaction(transaction)
    options = transaction_options(transaction)
    Transaction
      .where(options)
      .first_or_create(options)
  end

  def self.transaction_options(transaction = {})
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
  def self.administrator_uuid(recipient_uuid)
    return System.administrator.uuid if recipient_uuid ==  Rails.configuration.uuid
    recipient.uuid
  end

end
