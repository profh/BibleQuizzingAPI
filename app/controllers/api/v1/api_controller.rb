class Api::V1::ApiController < ApplicationController
  swagger_controller :questions, "For Questions"

  swagger_api :get_questions do
    summary "Fetches Questions"
    notes "This lists 25 or 200 questions based on whether parameters are given, in either random or sequential order. You may choose to use either the corresponding section id or all 3 of the other parameters to find questions."
    param :path, :section_id, :integer, :optional, "Section ID"
    param :path, :book, :string, :optional, "Book Name"
    param :path, :chapter, :integer, :optional, "Chapter Number"
    param :path, :verse, :string, :optional, "Verse Number"
  end

  def get_questions
    if params[:section_id].present?
        render json: Question.in_section(params[:section_id]).order("section_id").limit(20)
    elsif params[:book].present?
        render json: Question.in_book(params[:book])
    else
        # render json: Question.order("RANDOM()").limit(1)
        render json: Question.all.to_a.sample
    end
  end

  swagger_api :get_sections do
    summary "Fetches Sections"
    notes "This endpoint lists all sections that are available in the chosen book, or active in the system."
    param :path, :book, :string, :optional, "Book Name"
  end

  def get_sections
    if params[:book].present?
      @sections = Section.for_book(params[:book])
      render json: @sections
    else
      render json: Section.where(active: true)
    end
  end

  swagger_api :get_books do
    summary "Fetches Books"
    notes "This lists all books that are active for Quizzing"
  end

  def get_books
      @books = Section.where(active: true).distinct.pluck(:book).sort
      render json: @books
  end

  private
    def question_params
      params.require(:question).permit(:question_category_id, :section_id, :book, :chapter, :verse, :question_type_id, :strategy)
    end
end
