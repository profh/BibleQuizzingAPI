class Api::V0::YearBooksController < ApplicationController
  before_action :set_year_book, only: [:show, :update, :destroy]

  # GET /year_books
  def index
    @year_books = YearBook.all

    render json: @year_books
  end

  # GET /year_books/1
  def show
    render json: @year_book
  end

  # POST /year_books
  def create
    @year_book = YearBook.new(year_book_params)

    if @year_book.save
      render json: @year_book, status: :created, location: @year_book
    else
      render json: @year_book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /year_books/1
  def update
    if @year_book.update(year_book_params)
      render json: @year_book
    else
      render json: @year_book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /year_books/1
  def destroy
    @year_book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_year_book
      @year_book = YearBook.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def year_book_params
      params.require(:year_book).permit(:quiz_year_id, :book)
    end
end
