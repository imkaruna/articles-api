module Api::V1
class ArticlesController < ApplicationController
  before_action :authenticate_request! only: [:new, :edit]
  def index
    @articles = Article.all
    render json: @articles
  end

  def new
    render json: {'logged_in' => true}
  end

  def edit
    render json: {'logged_in' => true}
  end
end
end
