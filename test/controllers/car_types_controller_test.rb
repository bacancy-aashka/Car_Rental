# frozen_string_literal: true

require 'test_helper'

class CarTypesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get car_types_index_url
    assert_response :success
  end
end
