require 'test_helper'

class YearBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @year_book = year_books(:one)
  end

  test "should get index" do
    get year_books_url, as: :json
    assert_response :success
  end

  test "should create year_book" do
    assert_difference('YearBook.count') do
      post year_books_url, params: { year_book: { book: @year_book.book, quiz_year_id: @year_book.quiz_year_id } }, as: :json
    end

    assert_response 201
  end

  test "should show year_book" do
    get year_book_url(@year_book), as: :json
    assert_response :success
  end

  test "should update year_book" do
    patch year_book_url(@year_book), params: { year_book: { book: @year_book.book, quiz_year_id: @year_book.quiz_year_id } }, as: :json
    assert_response 200
  end

  test "should destroy year_book" do
    assert_difference('YearBook.count', -1) do
      delete year_book_url(@year_book), as: :json
    end

    assert_response 204
  end
end
