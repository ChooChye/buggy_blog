require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "index lists categories" do
    get categories_url

    assert_response :success
    assert_select "td a", text: "Technology"
  end

  test "creating a category" do
    assert_difference "Category.count", 1 do
      post categories_url, params: { category: { name: "Music" } }
    end

    assert_redirected_to categories_url
  end

  test "an invalid category re-renders the form with errors" do
    post categories_url, params: { category: { name: "" } }

    assert_response :unprocessable_content
    assert_select ".error-messages li", text: "Name can't be blank"
  end
end
