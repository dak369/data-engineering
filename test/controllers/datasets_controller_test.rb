require 'test_helper'

class DatasetsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
  end

  test 'should get index' do
    get :index

    assert_response :success
    assert_not_nil assigns(:datasets)
    assert_not_nil assigns(:dataset)
  end

  test 'should create dataset' do
    assert_difference('Dataset.count') do
      post :create, dataset: { file: upload_file }
    end

    assert_redirected_to datasets_path
  end

  test 'should destroy dataset' do
    assert_difference('Dataset.count', -1) do
      delete :destroy, id: datasets(:one)
    end

    assert_redirected_to datasets_path
  end
end
