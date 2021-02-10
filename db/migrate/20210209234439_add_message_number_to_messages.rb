class AddMessageNumberToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :message_number, :integer, null: false, default: 1
  end
end
