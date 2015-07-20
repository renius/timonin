
require 'rails_helper'

describe Admin::PostsController do

  before (:each) do
    @user = create :user, :admin
    sign_in @user
  end

  let(:valid_attributes) { attributes_for(:post) }
  let(:article) { create(:post) }
  let(:subject) { assigns(:post) }

  describe 'GET' do
    describe 'GET index' do
      it 'assigns all admin_posts as @admin_posts' do
        get :index
        expect(assigns(:posts)).to eq([article])
      end
    end

    describe 'GET show' do
      it 'assigns the requested admin_post as @admin_post' do
        get :show, id: article.to_param
        is_expected.to eq(article)
      end
    end

    describe 'GET new' do
      it 'assigns a new admin_post as @admin_post' do
        get :new
        is_expected.to be_a_new(Post)
      end
    end

    describe 'GET edit' do
      it 'assigns the requested admin_post as @admin_post' do
        get :edit, id: article.to_param
        is_expected.to eq(article)
      end
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Admin::Post' do
        expect {
          post :create, post: valid_attributes
        }.to change(Post, :count).by(1)
      end

      it 'redirects to the created admin_post' do
        post :create, post: valid_attributes
        expect(response).to redirect_to admin_posts_path
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested admin_post' do
        put :update, id: article.to_param, post: { title: 'Updated' }
        article.reload
        expect(article['title']).to eq('Updated')
      end

      it 'assigns the requested admin_post as @admin_post' do
        put :update, id: article.to_param, post: valid_attributes
        is_expected.to eq(article)
      end

      it 'redirects to the admin_post' do
        put :update, id: article.to_param, post: valid_attributes
        expect(response).to redirect_to admin_post_path
      end
    end
  end

  describe 'DELETE destroy' do

    let!(:article) { create(:post) }

    it 'destroys the requested admin_post' do
      expect {
        delete :destroy, id: article.to_param
      }.to change(Post, :count).by(-1)
    end

    it 'redirects to the admin_posts list' do
      delete :destroy, id: article.to_param
      expect(response).to redirect_to(admin_posts_url)
    end
  end
end
