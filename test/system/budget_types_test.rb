require "application_system_test_case"

class BudgetTypesTest < ApplicationSystemTestCase
  setup do
    @budget_type = budget_types(:one)
  end

  test "visiting the index" do
    visit budget_types_url
    assert_selector "h1", text: "Budget Types"
  end

  test "creating a Budget type" do
    visit budget_types_url
    click_on "New Budget Type"

    fill_in "Name", with: @budget_type.name
    click_on "Create Budget type"

    assert_text "Budget type was successfully created"
    click_on "Back"
  end

  test "updating a Budget type" do
    visit budget_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @budget_type.name
    click_on "Update Budget type"

    assert_text "Budget type was successfully updated"
    click_on "Back"
  end

  test "destroying a Budget type" do
    visit budget_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Budget type was successfully destroyed"
  end
end
