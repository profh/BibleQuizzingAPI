module Api::V1
  class ApiController < ApplicationController
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
          questions = Question.for_section(params[:section_id])
      elsif params[:starting].present? && params[:ending].present?
          questions = Question.for_section_range(params[:starting], params[:ending])
      elsif params[:book].present?
          questions = Question.for_book(params[:book])
      else
          questions = Question.all.to_a
      end

      render json: questions
    end
  
    swagger_api :get_questions_for_year do
      summary "Fetches Questions"
      notes "This lists all the questions from the current quizzing year."
    end

    def get_questions_for_year
      questions = Question.for_current_year

      # render json: questions
      render json: QuestionSerializer.new(questions).serialized_json
      # Completed 200 OK in 4621ms (Views: 0.2ms | ActiveRecord: 462.2ms)
      # Completed 200 OK in 13366ms (Views: 0.1ms | ActiveRecord: 202.2ms)
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

    ####################

    include Filterable

    # BOOLEAN_FILTERING_PARAMS = [[:approved, :unapproved],[:district, :local]]
    # BOOLEAN_FILTERING_PARAMS = [:refs, :memory, :int_only, :ma_only, :int_and_ma]
    PARAM_FILTERING_PARAMS = [:refs, :memory, :int_only, :ma_only, :int_and_ma]

    def get_questions_for_sections
      @questions = Question.for_book("Luke").set_size(params[:limit]).all
      @questions = param_filter(@questions, PARAM_FILTERING_PARAMS)
      if params[:starting].present? && params[:ending].present?
        @questions = @questions.for_chapter_range(params[:starting], params[:ending])
      elsif params[:starting].present? && !params[:ending].present?
        @questions = @questions.for_chapter_range(params[:starting], params[:starting])
      else
        @questions = @questions
      end

      render json: @questions
    end


    private
      def question_params
        params.require(:question).permit(:question_category_id, :section_id, :book, :chapter, :verse, :question_type_id, :strategy)
      end
  end
end
