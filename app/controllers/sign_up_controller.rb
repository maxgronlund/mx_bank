class SignUpController < ApplicationController
  def index
     @authorization_server = System::AddressServer.authorization_server
     @user = User.new
  end
end
