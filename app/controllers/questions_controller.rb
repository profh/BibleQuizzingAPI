class QuestionsController < ApplicationController

  def get_questions_for_year
    questions = Question.for_current_year

    render json: QuestionSerializer.new(questions).serialized_json

  end
end
