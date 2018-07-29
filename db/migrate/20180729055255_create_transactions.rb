class CreateTransactions < ActiveRecord::Migration[5.2]
  def up
    drop_table :payments
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

  def down
    drop_table :transactions
    create_table :payments, id: :uuid do |t|
      t.uuid :uuid
      t.decimal :amount
      t.uuid :sender
      t.uuid :recipient
      t.hstore :meta

      t.timestamps
    end
  end
end
