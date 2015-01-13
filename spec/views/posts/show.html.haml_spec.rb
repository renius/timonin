require 'rails_helper'

RSpec.describe "posts/show", :type => :view do
  before(:each) do
    @post = assign(:post, FactoryGirl.create(:post))
    @comments = assign(:comment, Kaminari.paginate_array([
      FactoryGirl.create(:comment, post: @post)
    ]).page(1))
  end

  it "renders attributes in <p>" do
    render
  end
end
