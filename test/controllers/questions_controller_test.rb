require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get questions_url, as: :json
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post questions_url, params: { question: { answer: @question.answer, approval_level: @question.approval_level, approval_reason: @question.approval_reason, approved_by: @question.approved_by, approved_on: @question.approved_on, book: @question.book, chapter: @question.chapter, created_on: @question.created_on, difficulty_ranking: @question.difficulty_ranking, keyword: @question.keyword, question_category_id: @question.question_category_id, question_type_id: @question.question_type_id, section_id: @question.section_id, text: @question.text, verse: @question.verse, written_by: @question.written_by } }, as: :json
    end

    assert_response 201
  end

  test "should show question" do
    get question_url(@question), as: :json
    assert_response :success
  end

  test "should update question" do
    patch question_url(@question), params: { question: { answer: @question.answer, approval_level: @question.approval_level, approval_reason: @question.approval_reason, approved_by: @question.approved_by, approved_on: @question.approved_on, book: @question.book, chapter: @question.chapter, created_on: @question.created_on, difficulty_ranking: @question.difficulty_ranking, keyword: @question.keyword, question_category_id: @question.question_category_id, question_type_id: @question.question_type_id, section_id: @question.section_id, text: @question.text, verse: @question.verse, written_by: @question.written_by } }, as: :json
    assert_response 200
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete question_url(@question), as: :json
    end

    assert_response 204
  end
end
