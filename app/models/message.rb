# frozen_string_literal: true

require 'elasticsearch/model'

class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Counter::Cache
  counter_cache_on column: :messages_count, # chat.messages_count
                   relation: :chat,
                   relation_class_name: 'Chat',
                   method: :calculate_messages_count # This is a method on the chat.
  before_validation :assign_number, on: :create
  belongs_to :chat
  validates :message_number, :body, presence: true
  validates :message_number, uniqueness: { scope: :chat_id }, on: :create

  settings do
    mappings dynamic: false do
      indexes :message_number, type: :long
      indexes :chat_number, type: :long
      indexes :body, type: :text, analyzer: 'english'
    end
  end

  def self.search(query)
    __elasticsearch__.search(
      query: {
        match: {
          body: query
        }
      }
    )
  end

  private

  def assign_number
    with_lock do
      self.message_number = latest_number + 1
    end
  end

  def latest_number
    chat.messages_count
  end
end
