require 'rails_helper'

RSpec.describe Chat, type: :model do
  it { should belong_to(:application) }
  it "is not valid without a title" do
    chat = Chat.new(chat_number: nil)
    expect(chat).to_not be_valid
  end
end
