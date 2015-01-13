require 'rails_helper'

describe User do
  it "has a valid trait" do
    post = FactoryGirl.create(:post, :with_comments)
    expect(user).to be_valid
  end
end
