require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  fixtures :pages

  setup do
    @pages_uri = "/"
  end

  test "home" do
    get @pages_uri
    assert_response :success
  end

  test "show" do
    get "#{@pages_uri}/#{pages(:test_page).slug}"
    assert_response :success
  end
end
