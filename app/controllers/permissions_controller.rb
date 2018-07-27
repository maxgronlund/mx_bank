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

  # def update_local_db
  #   return if user_from_ledger.nil?
  #   import_names
  #   import_phone
  #   #store_permissions_in_ledger
  #   current_user.update(permission_options)
  # end

  # def import_names
  #   #return unless params['import_name'] == 'yes'
  #   permission_options[:name] = user_from_ledger[:name] if current_user.name.nil?
  #   permission_options[:given_name] = user_from_ledger[:given_name] if current_user.given_name.nil?
  #   permission_options[:family_name] = user_from_ledger[:family_name] if current_user.family_name.nil?
  #   permission_options[:nickname] = user_from_ledger[:nickname] if current_user.nickname.nil?
  #   permission_options[:preferred_username] = user_from_ledger[:preferred_username] if current_user.preferred_username.nil?
  #   permission_options[:nickname] = user_from_ledger[:nickname] if current_user.nickname.nil?
  # end

  # def import_phone
  #   #return unless params['phone_number'] == 'yes'
  #   permission_options[:phone_number] = user_from_ledger[:phone_number] if current_user.phone_number.nil?
  # end

  def update_permissions_in_ledger
    current_user
      .update_permissions_in_ledger(
        pay_as_you_go: params['pay_as_you_go'] == 'yes',
        notify_friends: params['notify_friends'] == 'yes',
        update_global_profile: params['update_global_profile'] == 'yes'
      )
  end

  # def permission_options
  #   @user_update_options ||= {}
  # end
end
