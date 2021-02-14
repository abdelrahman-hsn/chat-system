require 'rails_helper'

RSpec.describe Application, type: :model do
  it { should have_many(:chats).dependent(:destroy) }
  it "is not valid without a title" do
    chat = Application.new(name: nil)
    expect(chat).to_not be_valid
  end
end
