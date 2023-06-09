class AuthorsController < ApplicationController
  def index
    @author = Author.all
  end
  def show
    @author = Author.find(params[:id])
  end
  def update
    @author=Author.find(params[:id])
    if @author.update(params.require(:author).permit(:name))
      redirect_to show, notice: "Author Updated!"
    else
      render :edit
    end
  end
  def edit
    @author = Author.find(params[:id])
    render :edit
  end
  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to books_path
  end
end