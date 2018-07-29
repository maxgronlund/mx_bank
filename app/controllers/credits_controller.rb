class CreditsController < ApplicationController

  def new
    @transaction = Transaction.new(amount: 200)
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.meta = meta
    @transaction.uuid = SecureRandom.uuid
    @transaction.transaction_type = transaction_type
    @transaction.sender = SecureRandom.uuid
    @transaction.recipient = current_user.uuid
    @transaction.state = Transaction::COMPLETED
    if @transaction.save
      redirect_to account_index_path
    else
      render :new
    end
  end

  private

  def meta
    {
      from: I18n.t(transaction_params[:payment_provider]),
      message: 'I added some credit to my account'
    }
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :payment_provider)
  end

  def transaction_type
    case transaction_params[:payment_provider]
    when System::VISA, System::MARSTERCARD
      Transaction::PAYMENT_WIRH_CREDIT_CARD
    when System::STRIPE, System::PAYPALL
      Transaction::PAYMENT_FROM_PAYMENT_GATEWAY
    when System::BITCOINS
      Transaction::PAYMENT_WIRH_CRYPTOCURRENCY
    end
  end
end
