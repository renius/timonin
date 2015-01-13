require 'rails_helper'

RSpec.describe "posts/index", :type => :view do
  before(:each) do
    assign(:posts,Kaminari.paginate_array([
      FactoryGirl.create(:post),
      FactoryGirl.create(:post)
    ]).page(1))
  end

  it "renders a list of posts" do
    render
  end
end
