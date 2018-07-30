class System::AdminsController < ApplicationController
  def index
    transactions = Transaction.retrive_for(Rails.configuration.uuid)
    Transaction.import(transactions)
    @transactions =
      Transaction
      .where(recipient: '970cc839-f922-403f-9d62-9c8201e163b2')
      .or(Transaction.where(sender: transaction_ids))
      .order(created_at: :desc)

    @balance = System.balance
  end

  def edit
    @system_admin = System.administrator
  end

  def update
    @system_admin = System.administrator
    if @system_admin.update(system_admin_params)
      redirect_to system_admins_path
    else
      render :edit
    end
  end

  private

  def transaction_ids
     @transaction_ids ||= [Rails.configuration.uuid]
  end

  def system_admin_params
    params.require(:system_admin).permit(:uuid)
  end


end
