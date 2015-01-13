require 'rails_helper'

describe 'admin/posts/new' do
  before(:each) do
    assign(:post, create(:post))
  end

  it 'renders new admin_post form' do
    render

    assert_select "form[action=?][method=?]", admin_posts_path, "post" do
    end
  end
end
