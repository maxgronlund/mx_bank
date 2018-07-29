class CreateSystemAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :system_admins, id: :uuid do |t|
      t.uuid :uuid

      t.timestamps
    end
  end
end
