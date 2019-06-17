require "application_system_test_case"

class BusinessCardsTest < ApplicationSystemTestCase
  setup do
    @business_card = business_cards(:one)
  end

  test "visiting the index" do
    visit business_cards_url
    assert_selector "h1", text: "Business Cards"
  end

  test "creating a Business card" do
    visit business_cards_url
    click_on "New Business Card"

    fill_in "Imdb", with: @business_card.imdb
    fill_in "Twitter", with: @business_card.twitter
    fill_in "User", with: @business_card.user_id
    click_on "Create Business card"

    assert_text "Business card was successfully created"
    click_on "Back"
  end

  test "updating a Business card" do
    visit business_cards_url
    click_on "Edit", match: :first

    fill_in "Imdb", with: @business_card.imdb
    fill_in "Twitter", with: @business_card.twitter
    fill_in "User", with: @business_card.user_id
    click_on "Update Business card"

    assert_text "Business card was successfully updated"
    click_on "Back"
  end

  test "destroying a Business card" do
    visit business_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Business card was successfully destroyed"
  end
end
