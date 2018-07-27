class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

  end

  # GET /users/1
  # GET /users/1.json
  def show
    if @user.name.nil?
      flash[:notice] = 'You have to provide a name'
      redirect_to edit_user_path(@user.uuid)
      return
    end
  end

  def edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    uuid = user_params[:uuid]
    @user = User.find_by(uuid: uuid)
    if @user.update(user_params)
      @user.update_profile_in_ledger
      redirect_to user_path(@user.uuid)
    else
      render :edit
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by(uuid: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user)
      .permit(
        :name,
        :given_name,
        :family_name,
        :nickname,
        :preferred_username,
        :profile, :picture,
        :website,
        :email,
        :email_verified,
        :gender,
        :birthdate,
        :zoneinfo,
        :locale,
        :phone_number,
        :phone_number_verified,
        :address,
        :uuid
      )
  end
end
