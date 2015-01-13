require 'rails_helper'

describe 'admin/posts/index' do
  before(:each) do
    assign(:posts,Kaminari.paginate_array([
      FactoryGirl.create(:post),
      FactoryGirl.create(:post)
    ]).page(1))
  end

  it 'renders a list of admin/posts' do
    render
  end
end
