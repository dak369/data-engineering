require 'test_helper'

class PurchaserTest < ActiveSupport::TestCase
  test 'gross_revenue' do
    assert_equal 79.95, purchasers(:one).gross_revenue
    assert_equal 0, purchasers(:two).gross_revenue
  end
end
