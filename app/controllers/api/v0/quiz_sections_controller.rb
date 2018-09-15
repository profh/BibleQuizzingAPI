class Api::V0::QuizSectionsController < ApplicationController
  before_action :set_quiz_section, only: [:show, :update, :destroy]

  # GET /quiz_sections
  def index
    @quiz_sections = QuizSection.all

    render json: @quiz_sections
  end

  # GET /quiz_sections/1
  def show
    render json: @quiz_section
  end

  # POST /quiz_sections
  def create
    @quiz_section = QuizSection.new(quiz_section_params)

    if @quiz_section.save
      render json: @quiz_section, status: :created, location: @quiz_section
    else
      render json: @quiz_section.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quiz_sections/1
  def update
    if @quiz_section.update(quiz_section_params)
      render json: @quiz_section
    else
      render json: @quiz_section.errors, status: :unprocessable_entity
    end
  end

  # DELETE /quiz_sections/1
  def destroy
    @quiz_section.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_section
      @quiz_section = QuizSection.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quiz_section_params
      params.require(:quiz_section).permit(:quiz_id, :section_id)
    end
end
