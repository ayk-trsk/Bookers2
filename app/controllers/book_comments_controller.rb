class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.build(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comments = @book.book_comments
    if @book_comment.save
      render :index
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comments = @book.book_comments
    @book_comment = BookComment.find(params[:id])
    if @book_comment.destroy
      render :index
    end
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment, :user_id, :book_id)
  end
end
