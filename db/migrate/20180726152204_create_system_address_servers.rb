class CreateSystemAddressServers < ActiveRecord::Migration[5.2]
  def change
    create_table :system_address_servers, id: :uuid do |t|
      t.string :name
      t.string :url
      t.uuid :uuid
      t.text :public_key

      t.timestamps
    end
  end
end
