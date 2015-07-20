require 'rails_helper'

RSpec.describe "Admin::Posts", type: :request do
  describe "GET /admin_posts" do
    it "works! (now write some real specs)" do
      sign_in_as_a_user(role: :admin)
      get admin_posts_path
      expect(response).to have_http_status(200)
    end

    it "don't works!" do
      sign_in_as_a_user
      get admin_posts_path
      expect(response).to redirect_to(root_url)
    end
  end
end
