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
end
