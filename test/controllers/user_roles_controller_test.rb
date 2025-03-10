require "test_helper"

class UserRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_role = user_roles(:one)
  end

  test "should get index" do
    get user_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_user_role_url
    assert_response :success
  end

  test "should create user_role" do
    assert_difference("UserRole.count") do
      post user_roles_url, params: { user_role: { active_status: @user_role.active_status, creator_id: @user_role.creator_id, del_status: @user_role.del_status, entity_code: @user_role.entity_code, role_code: @user_role.role_code, user_code: @user_role.user_code } }
    end

    assert_redirected_to user_role_url(UserRole.last)
  end

  test "should show user_role" do
    get user_role_url(@user_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_role_url(@user_role)
    assert_response :success
  end

  test "should update user_role" do
    patch user_role_url(@user_role), params: { user_role: { active_status: @user_role.active_status, creator_id: @user_role.creator_id, del_status: @user_role.del_status, entity_code: @user_role.entity_code, role_code: @user_role.role_code, user_code: @user_role.user_code } }
    assert_redirected_to user_role_url(@user_role)
  end

  test "should destroy user_role" do
    assert_difference("UserRole.count", -1) do
      delete user_role_url(@user_role)
    end

    assert_redirected_to user_roles_url
  end
end
