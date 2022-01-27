class BooksController < ApplicationController
  def new
  end

  def index
   @user=current_user
   @book=Book.new
   @books=Book.all
  end

  def create
   @book=Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
    flash[:notice]='book save successfully'
    redirect_to book_path(@book.id)
   else
    render :index
   end
  end

  def show
    @user=current_user
    @book=Book.find(params[:id])
    @new_book=Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice]='book update successfully'
     redirect_to book_path(@book)
    else
      render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
