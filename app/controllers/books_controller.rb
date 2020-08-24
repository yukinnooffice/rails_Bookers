class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
  	@book = Book.new
  	@books = Book.all
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
    if  @book.save
  	    redirect_to book_path(@book)
    else
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book)
    else
      render :edit
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
