class SessionController < ApplicationController
  def new
    id = params[:id]
    return if id.nil?
    @user   = User.from_ledger(id)
    @email = @user[:email]
  end

  def create
    params.permit!
    email =  params[:email]
    user_from_ledger  = User.from_ledger_by_email(email)

    @permission = User.permission_from_ledger( user_from_ledger[:uuid] )
    if @permission[:permissions].nil?
      session[:user_id] = user_from_ledger[:uuid]
      current_user.copy_profile_from_ledger(user_from_ledger)
      redirect_to edit_permission_path(@permission[:uuid])
      return
    end
    redirect_to new_session_path
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
