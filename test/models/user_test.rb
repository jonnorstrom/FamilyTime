require 'test_helper'

class UserTest < ActiveSupport::TestCase
  include ApplicationHelper
  setup do
    @user = User.create(first_name: "Jon", last_name: "Norstrom", email: "email@email.com", password: "default", is_admin: true)
  end

  test "password is hashed by BCrypt" do
    assert(@user.password_digest.length > 30)
  end

  test "password is hashed with BCrypt salt" do
    assert_equal(@user.password_digest[0..6], "$2a$10$")
  end

  test "password authentication works" do
    assert(@user.authenticate("default"))
  end

  test "password authentication fails with wrong password" do
    assert_not(@user.authenticate("not password"))
  end

  test "#need_to_reset_password returns true if password is 'password'" do
    @user.update(password: 'password')
    assert(need_to_reset_password(@user))
  end

  test "password can be changed" do
    @user.update_password("new password")
    assert(@user.authenticate("new password") && !@user.authenticate("password"))
  end

  test "full name returns users first and last name" do
    assert_equal(@user.full_name, "Jon Norstrom")
  end
end
