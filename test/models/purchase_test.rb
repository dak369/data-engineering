require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  test 'gross_revenue' do
    assert_equal 19.98, purchases(:one).gross_revenue
    assert_equal 59.97, purchases(:two).gross_revenue
  end
end
