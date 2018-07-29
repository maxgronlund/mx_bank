class System::AdminsController < ApplicationController
  def index
    @transactions =
      Transaction
      .where(recipient: System.administrator.uuid)
      .or(Transaction.where(sender: System.administrator.uuid))
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

  def system_admin_params
    params.require(:system_admin).permit(:uuid)
  end


end
