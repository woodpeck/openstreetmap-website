class CreateMessageKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :message_keys do |t|
      t.string :replyable_type, :null => false
      t.integer :replyable_id, :null => false
      t.integer :reply_sender_id, :null => false
      t.integer :reply_recipient_id, :null => false
      t.uuid :key, :null => false
      t.timestamps :null => false
    end

    add_index :message_keys, :key, :unique => true
    add_foreign_key :message_keys, :users, :column => :reply_sender_id, :name => "message_keys_reply_sender_id_fkey"
    add_foreign_key :message_keys, :users, :column => :reply_recipient_id, :name => "message_keys_reply_recipient_id_fkey"

  end
end
