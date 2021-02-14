class MessageSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :message_number, :body
  has_one :chat
end
