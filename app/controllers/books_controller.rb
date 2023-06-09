class BooksController < ApplicationController
  before_action :set_book, except: [:new, :index, :create]
  before_action :set_author, only: [:new, :edit, :show, :create]
  def index
    @book = Book.all
  end
  def show
    @book = Book.find(params[:id])
  end
  def new
    @book = Book.new
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  def update
    @book=Book.find(params[:id])
    if @book.update(params.require(:book).permit(:name, :pages))
      redirect_to show, notice: "Book Updated!"
    else
      render :edit
    end
  end
  def edit
    @book = Book.find(params[:id])
    render :edit
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "Book saved"
    else
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(:name, :pages, :author_id)
  end
end
def set_book
  @book = Book.find(params[:id])
  redirect_to :action => "index", :id => @book.id
end
def set_author
  @author = Author.all
  @authors = Author.all.map{ |c| [c.name, c.id] }
end
