require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { active: @user.active, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, password_hash: @user.password_hash, password_reset_sent_at: @user.password_reset_sent_at, password_reset_token: @user.password_reset_token, password_salt: @user.password_salt, username: @user.username } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { active: @user.active, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, password_hash: @user.password_hash, password_reset_sent_at: @user.password_reset_sent_at, password_reset_token: @user.password_reset_token, password_salt: @user.password_salt, username: @user.username } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), as: :json
    end

    assert_response 204
  end
end
