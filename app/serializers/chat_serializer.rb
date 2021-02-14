class ChatSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :chat_number, :name, :messages_count
  has_one :application
end
