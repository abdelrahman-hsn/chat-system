class AddChatNumberToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :chat_number, :integer, null: false, default: 1
  end
end
