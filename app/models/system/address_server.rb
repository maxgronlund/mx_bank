class System::AddressServer < ApplicationRecord


  def self.address_servers
    response =
      HTTParty
      .get(default_server+ '/api/v1/mx_address_servers.json', format: :plain)
    JSON.parse( response, symbolize_names: true)
  end

  def self.authorization_server
    authorization_servers.first
  end

  def self.authorization_servers
    url = default_server.url
    response =
      HTTParty
      .get(url + '/api/v1/mx_authorization_providers.json', format: :plain)
    JSON.parse( response, symbolize_names: true)
  end

  def self.public_ledger
    public_ledgers.first
  end

  def self.public_ledgers
    url = default_server.url
    response =
      HTTParty
      .get(url + '/api/v1/mx_public_ledgers.json', format: :plain)
    JSON.parse( response, symbolize_names: true)
  end

  def self.default_server
    first
  end
end
