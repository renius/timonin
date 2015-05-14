class WelcomeController < ApplicationController
  respond_to :html

  def index
    @posts = Post.page(params[:page]).per(3)
    respond_with(@posts)
  end

  def about
  end
end
