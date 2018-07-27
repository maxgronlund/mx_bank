class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.uuid :uuid
      t.string :name
      t.string :given_name
      t.string :family_name
      t.string :nickname
      t.string :preferred_username
      t.string :profile
      t.string :picture
      t.string :website
      t.string :email
      t.boolean :email_verified
      t.string :gender
      t.string :birthdate
      t.string :zoneinfo
      t.string :locale
      t.string :phone_number
      t.boolean :phone_number_verified
      t.json :address
      t.text :public_key

      t.timestamps
    end
  end
end
