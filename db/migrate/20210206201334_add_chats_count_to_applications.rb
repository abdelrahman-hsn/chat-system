class AddChatsCountToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :chats_count, :integer, null: false, default: 0
  end
end
