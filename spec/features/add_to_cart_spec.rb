require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
  end

  scenario "visit the home page and click 'Add to Cart' buttons for one of the products." do
    # ACT
    visit root_path
    expect(page).to have_content('My Cart (0)')
    # DEBUG
    save_screenshot

    click_on("Add")
  
    expect(page).to have_content('My Cart (1)')

    # DEBUG
    save_screenshot

  end

end
