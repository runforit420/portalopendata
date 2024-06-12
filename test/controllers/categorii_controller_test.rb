require "test_helper"

class CategoriiControllerTest < ActionDispatch::IntegrationTest
  test "should get Castiguri" do
    get categorii_Castiguri_url
    assert_response :success
  end

  test "should get Sanatate" do
    get categorii_Sanatate_url
    assert_response :success
  end

  test "should get Populatie" do
    get categorii_Populatie_url
    assert_response :success
  end

  test "should get Educatie" do
    get categorii_Educatie_url
    assert_response :success
  end

  test "should get Cultura" do
    get categorii_Cultura_url
    assert_response :success
  end

  test "should get Sport" do
    get categorii_Sport_url
    assert_response :success
  end
end
