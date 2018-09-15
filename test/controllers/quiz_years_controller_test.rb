require 'test_helper'

class QuizYearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz_year = quiz_years(:one)
  end

  test "should get index" do
    get quiz_years_url, as: :json
    assert_response :success
  end

  test "should create quiz_year" do
    assert_difference('QuizYear.count') do
      post quiz_years_url, params: { quiz_year: { active: @quiz_year.active, has_situations: @quiz_year.has_situations, year: @quiz_year.year } }, as: :json
    end

    assert_response 201
  end

  test "should show quiz_year" do
    get quiz_year_url(@quiz_year), as: :json
    assert_response :success
  end

  test "should update quiz_year" do
    patch quiz_year_url(@quiz_year), params: { quiz_year: { active: @quiz_year.active, has_situations: @quiz_year.has_situations, year: @quiz_year.year } }, as: :json
    assert_response 200
  end

  test "should destroy quiz_year" do
    assert_difference('QuizYear.count', -1) do
      delete quiz_year_url(@quiz_year), as: :json
    end

    assert_response 204
  end
end
