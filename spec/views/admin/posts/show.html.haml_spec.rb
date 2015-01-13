require 'rails_helper'

describe 'admin/posts/show' do
  before(:each) do
    sign_in_as_a_user
    @post = assign(:post, create(:post))
    @comments = assign(:comment, Kaminari.paginate_array([
      FactoryGirl.create(:comment, post: @post)
    ]).page(1))
  end

  it 'renders attributes in <p>' do
    render
  end
end
