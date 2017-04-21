class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comments_params)
    @blog = @comment.blog
    @notification = @comment.notifications.build(user_id: @blog.user_id)

    respond_to do |format|
      @comment.save if @comment.valid?
      format.js { render :index }

      unless @comment.blog.user_id == current_user.id
        @comment.notify_new_comment
      end
      @comment.notify_num_unread_comments
    end
=begin
      if @comment.save
        #format.html { redirect_to blog_path(@blog), notice: "コメントを投稿しました"}
        #format.json { render :show, status: :created, location: @comment, notice: "コメントを投稿しました!"}
        #format.html { render :new }
      else
        #format.html { render :new }
        #format.json { render json: @comment.errors ,status: :unprocessable_entity }
        format.js { render :index }
        binding.pry
      end
=end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @blog = @comment.blog

    respond_to do |format|
      @comment.destroy
      format.js { render :index }
    end
    #redirect_to blog_path(blog), notice: "コメントを削除しました"
  end

  private
  def comments_params
    params.require(:comment).permit(:blog_id, :content)
  end
end
