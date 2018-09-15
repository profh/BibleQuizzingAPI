class Api::V0::QuestionCategoriesController < ApplicationController
  before_action :set_question_category, only: [:show, :update, :destroy]

  # GET /question_categories
  def index
    @question_categories = QuestionCategory.all

    render json: @question_categories
  end

  # GET /question_categories/1
  def show
    render json: @question_category
  end

  # POST /question_categories
  def create
    @question_category = QuestionCategory.new(question_category_params)

    if @question_category.save
      render json: @question_category, status: :created, location: @question_category
    else
      render json: @question_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /question_categories/1
  def update
    if @question_category.update(question_category_params)
      render json: @question_category
    else
      render json: @question_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /question_categories/1
  def destroy
    @question_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_category
      @question_category = QuestionCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_category_params
      params.require(:question_category).permit(:name)
    end
end
