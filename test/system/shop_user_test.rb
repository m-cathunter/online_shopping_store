require "application_system_test_case"

class ShopUserTest < ApplicationSystemTestCase
  test "using shop" do
    visit("/")
    assert_text("Welcome to our online store")
    click_on(">>")
    assert_current_path("/products")
    click_on("Add to Cart")
    assert_current_path("/cart/order_items")
    click_on("Checkout")
    assert_current_path("/cart/checkout")
    fill_in("First name", with: "Anna")
    fill_in("Last name", with: "Kowalska")
    fill_in("Address", with: "Rzeszów")
    fill_in("Email", with: "a.kowalska@gmail.com")

    clink_on("Send the order")
  end
end
