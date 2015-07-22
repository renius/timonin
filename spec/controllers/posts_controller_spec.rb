require 'rails_helper'

describe PostsController do
  let(:post) { create(:post) }

  describe 'GET index' do
    it 'assigns all posts as @posts' do
      get :index
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe 'GET show' do
    it 'assigns the requested post as @post' do
      get :show, id: post.to_param
      expect(assigns(:post)).to eq(post)
    end
  end
end
