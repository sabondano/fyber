require 'rails_helper'

feature 'user fills out form to see offers available' do
  before do
    allow(Time).to receive(:now).and_return(Time.at(1444019276))
  end

  context 'successfulyy when uid, pub0 and page are provided' do
    scenario 'when no offers are found' do
      VCR.use_cassette 'features/user_fills_out_form_but_no_offers_found' do
        visit root_path

        fill_in 'uid', with: 'player1'
        fill_in 'pub0', with: 'campaign2'
        fill_in 'page', with: '1'
        click_button 'Find Offers'

        expect(current_path).to eq(offers_path)
        expect(page).to have_content("No offers available.")
      end
    end

    scenario 'when offers are found' do
      VCR.use_cassette 'features/user_fills_out_form_and_offers_are_found' do
        visit root_path

        fill_in 'uid', with: 'player1'
        fill_in 'pub0', with: 'campaign2'
        fill_in 'page', with: '1'
        click_button 'Find Offers'

        expect(current_path).to eq(offers_path)
        expect(page).to have_css(".offer", count: 30)
        first_offer = page.first(".offer")
        expect(first_offer.text).to eq("Title: Gratis Prepaid-SIM Payout: 76600")
        first_image = page.first("img").native.attributes["src"].value
        expect(first_image).to eq("http://cdn3.sponsorpay.com/assets/15196/offerwall-02_square_60.jpg")
      end
    end
  end
end
