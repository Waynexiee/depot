require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :products
  include ActiveJob::TestHelper
  def new_cart_with_one_product(product_name)
    cart = Cart.create
    cart.add_product(products(product_name))
    cart
  end

  test 'cart should create a new line item when adding a new product' do
    cart = new_cart_with_one_product(:one)
    assert_equal 1, cart.line_items.size
    # Add a new product
    cart.add_product(products(:ruby))
    assert_equal 2, cart.line_items.size
  end

  test "should update an existing line item when adding existing product" do
    cart = Cart.create

    cart.add_product(products(:ruby)).save!
    cart.add_product(products(:ruby)).save!
    assert_equal cart.line_items.size, 1
    assert_equal cart.line_items[0].quantity, 2
    assert_equal cart.total_price, products(:ruby).price * 2
  end
end
