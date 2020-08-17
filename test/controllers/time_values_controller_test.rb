require 'test_helper'

class TimeValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_value = time_values(:one)
  end

  test "should get index" do
    get time_values_url, as: :json
    assert_response :success
  end

  test "should create time_value" do
    assert_difference('TimeValue.count') do
      post time_values_url, params: { time_value: { break_time: @time_value.break_time, schedule_id: @time_value.schedule_id, work_time: @time_value.work_time } }, as: :json
    end

    assert_response 201
  end

  test "should show time_value" do
    get time_value_url(@time_value), as: :json
    assert_response :success
  end

  test "should update time_value" do
    patch time_value_url(@time_value), params: { time_value: { break_time: @time_value.break_time, schedule_id: @time_value.schedule_id, work_time: @time_value.work_time } }, as: :json
    assert_response 200
  end

  test "should destroy time_value" do
    assert_difference('TimeValue.count', -1) do
      delete time_value_url(@time_value), as: :json
    end

    assert_response 204
  end
end
