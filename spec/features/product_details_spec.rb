require 'rails_helper'

# RSpec.feature "ProductDetails", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end


RSpec.feature "Product details", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel4.jpg'),
        quantity: 10,
        price: 64.99
      )
  end

  scenario "click one of the product partials in order to navigate directly to a product detail page." do
    # ACT
    visit root_path
    find_link("Details").trigger("click")
    # VERIFY
    expect(page).to have_css 'section.products-show'
    # DEBUG
    save_screenshot
  end
end
