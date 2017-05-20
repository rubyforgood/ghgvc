require 'rails_helper'
RSpec.describe "Climate Home" do

  describe "visit path" do
    before do
  	  visit root_path
    end

    it "should display root path" do
      expect(page).to have_content("Ecosystem Climate Regulation Services Calculator")
    end
  end

  describe "Running Calaculator", js: true do
  	context "Running Calaculator With No Selected Ecosystem" do
  	  before do
  		find('#run.ghgvc.calculator').click
  	  end
  	  
  	  it "should fail to calculate" do
  		expect(page).to_not have_content('ok')
      end
    end
  end
end
