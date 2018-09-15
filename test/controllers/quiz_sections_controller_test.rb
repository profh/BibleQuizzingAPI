require 'test_helper'

class QuizSectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz_section = quiz_sections(:one)
  end

  test "should get index" do
    get quiz_sections_url, as: :json
    assert_response :success
  end

  test "should create quiz_section" do
    assert_difference('QuizSection.count') do
      post quiz_sections_url, params: { quiz_section: { quiz_id: @quiz_section.quiz_id, section_id: @quiz_section.section_id } }, as: :json
    end

    assert_response 201
  end

  test "should show quiz_section" do
    get quiz_section_url(@quiz_section), as: :json
    assert_response :success
  end

  test "should update quiz_section" do
    patch quiz_section_url(@quiz_section), params: { quiz_section: { quiz_id: @quiz_section.quiz_id, section_id: @quiz_section.section_id } }, as: :json
    assert_response 200
  end

  test "should destroy quiz_section" do
    assert_difference('QuizSection.count', -1) do
      delete quiz_section_url(@quiz_section), as: :json
    end

    assert_response 204
  end
end
