require "application_system_test_case"

class ShopManageTest < ApplicationSystemTestCase
  test "managing shop" do
    visit("/admin/products")
    click_on("Add new")
    assert_current_path("/admin/products/new")
    fill_in("Product code", with: "FR1")
    fill_in("Name", with: "Fruit tea")
    fill_in("Price", with: "3.11")
    fill_in("Discount", with: "buy-one-get-one-free")
    click_on("Create product")
    click_on("Fruit tea")
  end
end
