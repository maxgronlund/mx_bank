class User < ApplicationRecord
  attr_accessor :password, :password_confirmation

  def update_permissions_in_ledger(permissions = {})
    headers = {
      "GrantedTo"  => Rails.configuration.uuid,
      "GivenBy" => uuid
    }

    response =
      HTTParty
      .put(
        User.public_ledger[:url] + '/api/v1/permissions/'+ SecureRandom.uuid,
        format: :plain,
        headers: headers,
        body: {permissions: permissions}
      )
    JSON.parse( response, symbolize_names: true)
  end

  def copy_profile_from_ledger(user_from_ledger)
    user_from_ledger.delete_if { |key, value| value.blank? }
    user_from_ledger.delete :uuid
    update(user_from_ledger)
  end

  def update_profile_in_ledger
    headers = {
      "Id"  => uuid
    }

    params = serializable_hash
    params.delete 'id'
    params.delete 'uuid'
    params.delete 'created_at'
    params.delete 'updated_at'
    params.delete_if { |key, value| value.blank? }
    ap params
    response =
      HTTParty
      .put(
        User.public_ledger[:url] + '/api/v1/users/'+ SecureRandom.uuid,
        format: :plain,
        headers: headers,
        body: {profile: params}
      )
    JSON.parse( response, symbolize_names: true)
  end

  def balance
    Transaction.where(recipient: uuid).sum(:amount) - Transaction.where(sender: uuid).sum(:amount)
  end

  def self.from_ledger(id)
    headers = {
      "GivenBy"  => id,
      "GrantedTo"  => Rails.configuration.uuid
    }

    response =
      HTTParty
      .get(
        public_ledger[:url] + '/api/v1/users/'+ SecureRandom.uuid,
        format: :plain,
        headers: headers)
    JSON.parse( response, symbolize_names: true)
  end

  def self.permission_from_ledger(id)
    headers = {
      "Id" => id
    }

    response =
      HTTParty
      .get(
        public_ledger[:url] + '/api/v1/permissions/'+ SecureRandom.uuid,
        format: :plain,
        headers: headers)
    JSON.parse( response, symbolize_names: true)
  end

  def self.from_ledger_by_email(email)
    headers = {
      "Email"  => email
    }

    response =
      HTTParty
      .get(
        public_ledger[:url] + '/api/v1/user_by_email/'+ SecureRandom.uuid,
        format: :plain,
        headers: headers)
    JSON.parse( response, symbolize_names: true)
  end

  def self.public_ledger
    System::AddressServer.public_ledger
  end

  def retrive_transactions
    headers = {
      "Requester" => uuid,
      "TransactionType" => 'transaction_request'
    }
    response =
      HTTParty
      .get(
        User.public_ledger[:url]+ '/api/v1/retrieve_transaction_requests',
        format: :plain,
        headers: headers)
    JSON.parse( response, symbolize_names: true)

    # System::AddressServer.public_ledger
    # User.public_ledger[:url] + '/api/v1/retrieve_transaction_requests'

  end
end
