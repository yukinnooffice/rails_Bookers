class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
  	@book = Book.new
  	@books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path, alert: "不正なアクセスです。"
    end
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
    @books = Book.all
    @user = current_user
    if  @book.save
        flash[:notice] = "Book was successfully created."
  	    redirect_to book_path(@book)
    else
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "Book was successfully updated."
       redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

end
