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
    if user_from_ledger[:uuid].nil?
      redirect_to sign_up_index_path
      return
    else
      session[:user_id] = user_from_ledger[:uuid]
    end
    permission = User.permission_from_ledger( user_from_ledger[:uuid] )

    if permission[:permissions].nil?
      current_user.copy_profile_from_ledger(user_from_ledger)
      redirect_to edit_permission_path(permission[:uuid])
      return
    end
    redirect_to current_user.present? ? root_path : new_session_path
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
