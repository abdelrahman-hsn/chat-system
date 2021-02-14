class ApplicationSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :token, :chats_count
  has_many :chats
end
