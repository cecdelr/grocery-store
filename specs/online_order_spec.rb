require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

# TODO: uncomment the next line once you start wave 3
require_relative '../lib/online_order'
require_relative '../lib/customer'
# You may also need to require other classes here

# Because an OnlineOrder is a kind of Order, and we've
# already tested a bunch of functionality on Order,
# we effectively get all that testing for free! Here we'll
# only test things that are different.

describe "OnlineOrder" do
  describe "#initialize" do
    before do
      @online_order = Grocery::OnlineOrder.new(3, {"fish": 123}, Grocery::Customer.new(12, "mom@mom.com", "Planettown"), :pending)
      @online_order_without_status = Grocery::OnlineOrder.new(3, {"fish": 123}, Grocery::Customer.new(12, "mom@mom.com", "Planettown"))
    end

    it "Is a kind of Order" do
      # Check that an OnlineOrder is in fact a kind of Order

      # Instatiate your OnlineOrder here
      @online_order.must_be_kind_of Grocery::Order
    end

    it "Can access Customer object" do
      # TODO: Your test code here!
      @online_order.customer.must_be_instance_of Grocery::Customer
    end

    it "Can access the online order status" do
      # TODO: Your test code here!
      @online_order.status.must_be_instance_of Symbol
      @online_order_without_status.status.must_be_instance_of Symbol
      @online_order_without_status.status.must_equal :pending
    end
  end

  describe "#total" do
    before do
      @online_order = Grocery::OnlineOrder.new(3, {"fish": 12.00, "banana": 18.00}, Grocery::Customer.new(12, "mom@mom.com", "Planettown"), :pending)
      @online_order_without_products = Grocery::OnlineOrder.new(3, {}, Grocery::Customer.new(12, "mom@mom.com", "Planettown"))
    end

    it "Adds a shipping fee" do
      # TODO: Your test code here!
      @online_order.total.must_be_instance_of Float
      @online_order.total.must_equal 42.25

    end

    it "Doesn't add a shipping fee if there are no products" do
      # TODO: Your test code here!
      @online_order_without_products.total.must_equal 0
    end
  end

  describe "#add_product" do
    it "Does not permit action for processing, shipped or completed statuses" do
      # TODO: Your test code here!
    end

    it "Permits action for pending and paid satuses" do
      # TODO: Your test code here!
    end
  end

  describe "OnlineOrder.all" do
    it "Returns an array of all online orders" do
      # TODO: Your test code here!
      # Useful checks might include:
      #   - OnlineOrder.all returns an array
      #   - Everything in the array is an Order
      #   - The number of orders is correct
      #   - The customer is present
      #   - The status is present
      # Feel free to split this into multiple tests if needed
    end
  end

  describe "OnlineOrder.find_by_customer" do
    it "Returns an array of online orders for a specific customer ID" do
      # TODO: Your test code here!
    end
  end
end
