class PermissionsController < ApplicationController
  def edit
    @permission = permission_from_ledger
  end

  def update
    if current_user.present?
      # update_local_db
      # update_profile_in_ledger
      update_permissions_in_ledger
      redirect_to user_path(current_user.uuid)
      return
    end
    redirect_to edit_permission_path(params[:id])
  end

  private

  def user_from_ledger
    return nil if current_user.nil?
    @user_from_ledger ||= User.from_ledger(current_user.uuid)
  end

  def permission_from_ledger
    return nil if current_user.nil?
    @permission_from_ledger || User.permission_from_ledger(current_user.uuid)
  end

  def update_permissions_in_ledger
    current_user
      .update_permissions_in_ledger(
        pay_as_you_go: params['pay_as_you_go'] == 'yes',
        notify_friends: params['notify_friends'] == 'yes',
        update_global_profile: params['update_global_profile'] == 'yes'
      )
  end
end
