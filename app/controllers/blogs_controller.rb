class BlogsController < ApplicationController

  before_action :set_blog, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!

  def index
    @blogs = Blog.all

    respond_to do |format|
      format.html
      format.json { render json: @blogs }
    end
  end

  def show
    @comment = @blog.comments.build
    #@comment1 = Comment.new(user_id: current_user.id)
    @comments = @blog.comments
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]

  end

  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blogs_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
      NoticeMailer.sendmail_blog(@blog, current_user.email).deliver
    else
      render 'new'
      #redirect_to new_blog_path
    end
  end

  def confirm
    @blog = Blog.new(blogs_params)
    #render :new if @blog.invalid?
    if @blog.invalid?
      render 'new'
    end
  end

  def edit
  end

  def update
    if @blog.update(blogs_params)
      redirect_to blogs_path, notice: "ブログを更新しました！"
    else
      render 'edit'
      #redirect_to new_blog_path
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました！"
  end

  private
    def blogs_params
      params.require(:blog).permit(:title, :content)
    end
    def set_blog
      @blog = Blog.find(params[:id])
    end
end
