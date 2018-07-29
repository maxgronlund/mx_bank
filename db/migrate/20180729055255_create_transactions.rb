class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions, id: :uuid do |t|
      t.string :transaction_type
      t.string :state, default: 'pending'
      t.uuid :uuid
      t.decimal :amount
      t.uuid :sender
      t.uuid :recipient
      t.hstore :meta

      t.timestamps
    end
  end
end
