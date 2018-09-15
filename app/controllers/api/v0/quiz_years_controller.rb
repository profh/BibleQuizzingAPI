class Api::V0::QuizYearsController < ApplicationController
  before_action :set_quiz_year, only: [:show, :update, :destroy]

  # GET /quiz_years
  def index
    @quiz_years = QuizYear.all

    render json: @quiz_years
  end

  # GET /quiz_years/1
  def show
    render json: @quiz_year
  end

  # POST /quiz_years
  def create
    @quiz_year = QuizYear.new(quiz_year_params)

    if @quiz_year.save
      render json: @quiz_year, status: :created, location: @quiz_year
    else
      render json: @quiz_year.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quiz_years/1
  def update
    if @quiz_year.update(quiz_year_params)
      render json: @quiz_year
    else
      render json: @quiz_year.errors, status: :unprocessable_entity
    end
  end

  # DELETE /quiz_years/1
  def destroy
    @quiz_year.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_year
      @quiz_year = QuizYear.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quiz_year_params
      params.require(:quiz_year).permit(:year, :has_situations, :active)
    end
end
