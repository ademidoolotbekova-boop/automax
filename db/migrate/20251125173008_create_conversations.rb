class CreateConversations < ActiveRecord::Migration[8.0]
  def change
    create_table :conversations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :country, null: false
      t.datetime :started_at
      t.datetime :last_message_at

      t.timestamps
    end

    add_index :conversations, [:user_id, :created_at]
  end
end
