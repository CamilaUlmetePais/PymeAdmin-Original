require 'test_helper'

class OutflowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outflow = outflows(:one)
  end

  test "should get index" do
    get outflows_url
    assert_response :success
  end

  test "should get new" do
    get new_outflow_url
    assert_response :success
  end

  test "should create outflow" do
    assert_difference('Outflow.count') do
      post outflows_url, params: { outflow: { total: @outflow.total, cash: @outflow.cash } }
    end

    assert_redirected_to outflow_url(Outflow.last)
  end

  test "should show outflow" do
    get outflow_url(@outflow)
    assert_response :success
  end

  test "should get edit" do
    get edit_outflow_url(@outflow)
    assert_response :success
  end

  test "should update outflow" do
    patch outflow_url(@outflow), params: { outflow: { total: @outflow.total, cash: @outflow.cash } }
    assert_redirected_to outflow_url(@outflow)
  end

  test "should destroy outflow" do
    assert_difference('Outflow.count', -1) do
      delete outflow_url(@outflow)
    end

    assert_redirected_to outflows_url
  end
end
