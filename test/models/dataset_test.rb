require 'test_helper'

class DatasetTest < ActiveSupport::TestCase
  test 'upload' do
    dataset = Dataset.upload(users(:one), upload_file)

    assert_not_equal false, dataset

    assert_equal 3, dataset.merchants.size
    assert_equal 3, dataset.purchasers.size
    assert_equal 95, dataset.gross_revenue
  end

  test 'gross_revenue' do
    assert_equal 79.95, datasets(:one).gross_revenue
  end
end
