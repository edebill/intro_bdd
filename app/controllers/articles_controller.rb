class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find params[:id]
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new params[:article]
    @article.user_id = current_user.id
    if @article.valid?
      @article.save
      redirect_to root_url, :notice => "New article created"
    else
      render :new
    end
  end

  def update
    @article = Article.new params[:article]
    @article.user_id = current_user.id
    if @article.valid?
      @article.save
      redirect_to root_url, :notice => "Article updated."
    else
      render :new
    end
  end
end
