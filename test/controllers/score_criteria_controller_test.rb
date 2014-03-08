require 'test_helper'

class ScoreCriteriaControllerTest < ActionController::TestCase
  setup do
    @score_criterium = score_criteria(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:score_criteria)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create score_criterium" do
    assert_difference('ScoreCriterium.count') do
      post :create, score_criterium: { amount: @score_criterium.amount, name: @score_criterium.name }
    end

    assert_redirected_to score_criterium_path(assigns(:score_criterium))
  end

  test "should show score_criterium" do
    get :show, id: @score_criterium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @score_criterium
    assert_response :success
  end

  test "should update score_criterium" do
    patch :update, id: @score_criterium, score_criterium: { amount: @score_criterium.amount, name: @score_criterium.name }
    assert_redirected_to score_criterium_path(assigns(:score_criterium))
  end

  test "should destroy score_criterium" do
    assert_difference('ScoreCriterium.count', -1) do
      delete :destroy, id: @score_criterium
    end

    assert_redirected_to score_criteria_path
  end
end
