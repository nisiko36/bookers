class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
    def index
    @book = Book.new
    @books = Book.all
    end
  
  def create
      @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "Submitted successfully."
        redirect_to book_path(@book.id)
      else
        @books = Book.all
        flash.now[:alert] = "Submission failed."
        render :index
      end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash.now[:alert] = "Editing failed."
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
