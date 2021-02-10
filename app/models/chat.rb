# frozen_string_literal: true

class Chat < ApplicationRecord
  include Counter::Cache
  counter_cache_on column: :chats_count, # application.chats_count
                   relation: :application,
                   relation_class_name: 'Application',
                   method: :calculate_chats_count # This is a method on the application.

  before_validation :assign_chat_number, on: :create
  belongs_to :application
  has_many :messages, dependent: :destroy
  validates :chat_number, presence: true
  validates :chat_number, uniqueness: { scope: :application_id }, on: :create

  def calculate_messages_count
    messages.count
  end

  private

  def assign_chat_number
    application.with_lock do
      self.chat_number = latest_number + 1
    end
  end

  def latest_number
    application.chats_count
  end
end
