class ChatSerializer < ActiveModel::Serializer
  attributes :chat_number, :name, :messages_count
  has_one :application
end
