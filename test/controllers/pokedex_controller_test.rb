require 'test_helper'

class PokedexControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get findPokemon" do
    get :findPokemon
    assert_response :success
  end

  test "should get viewPC" do
    get :viewPC
    assert_response :success
  end

  test "should get viewEntry" do
    get :viewEntry
    assert_response :success
  end

end
