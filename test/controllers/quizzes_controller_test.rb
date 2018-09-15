require 'test_helper'

class QuizzesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz = quizzes(:one)
  end

  test "should get index" do
    get quizzes_url, as: :json
    assert_response :success
  end

  test "should create quiz" do
    assert_difference('Quiz.count') do
      post quizzes_url, params: { quiz: { event_id: @quiz.event_id, event_quiz_number: @quiz.event_quiz_number, filename: @quiz.filename, finish_the_verse: @quiz.finish_the_verse, interrogative: @quiz.interrogative, multiple_answer: @quiz.multiple_answer, question_categories: @quiz.question_categories, quote: @quiz.quote, reference: @quiz.reference, situation: @quiz.situation } }, as: :json
    end

    assert_response 201
  end

  test "should show quiz" do
    get quiz_url(@quiz), as: :json
    assert_response :success
  end

  test "should update quiz" do
    patch quiz_url(@quiz), params: { quiz: { event_id: @quiz.event_id, event_quiz_number: @quiz.event_quiz_number, filename: @quiz.filename, finish_the_verse: @quiz.finish_the_verse, interrogative: @quiz.interrogative, multiple_answer: @quiz.multiple_answer, question_categories: @quiz.question_categories, quote: @quiz.quote, reference: @quiz.reference, situation: @quiz.situation } }, as: :json
    assert_response 200
  end

  test "should destroy quiz" do
    assert_difference('Quiz.count', -1) do
      delete quiz_url(@quiz), as: :json
    end

    assert_response 204
  end
end
