require "application_system_test_case"

class ColleaguesTest < ApplicationSystemTestCase
  setup do
    @colleague = colleagues(:one)
  end

  test "visiting the index" do
    visit colleagues_url
    assert_selector "h1", text: "Colleagues"
  end

  test "creating a Colleague" do
    visit colleagues_url
    click_on "New Colleague"

    fill_in "Name", with: @colleague.name
    fill_in "Pastry", with: @colleague.pastry
    check "Selectioned" if @colleague.selectioned
    click_on "Create Colleague"

    assert_text "Colleague was successfully created"
    click_on "Back"
  end

  test "updating a Colleague" do
    visit colleagues_url
    click_on "Edit", match: :first

    fill_in "Name", with: @colleague.name
    fill_in "Pastry", with: @colleague.pastry
    check "Selectioned" if @colleague.selectioned
    click_on "Update Colleague"

    assert_text "Colleague was successfully updated"
    click_on "Back"
  end

  test "destroying a Colleague" do
    visit colleagues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Colleague was successfully destroyed"
  end
end
