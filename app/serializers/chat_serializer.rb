class ChatSerializer < ActiveModel::Serializer
  attributes :name
  has_one :application
end
