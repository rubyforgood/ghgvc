require 'rails_helper'
RSpec.describe "Climate Home", type: :feature do

  describe "visit path" do
    before do
  	  visit root_path
    end
    it "should display root path" do
      expect(page).to have_content("Ecosystem Climate Regulation Services Calculator")
    end
  end
end
