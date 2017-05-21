require "rails_helper"

RSpec.describe "Climate Home" do
  describe "visit path" do
    before { visit root_path }

    it "should display root path" do
      expect(page).to have_content("Ecosystem Climate Regulation Services Calculator")
    end

    context "Running Calaculator With No Selected Ecosystem" do
      before { find("#run_ghgvc_calculator").click }

      it "should fail to calculate" do
        expect(page.driver.browser.switch_to.alert.text)
          .to have_content("Please check one or more ecosystems")
      end
    end
  end
  describe "Running Calaculator", js: true do
    context "Running Calaculator With No Selected Ecosystem" do
      before do
        visit root_path
        find('#run.ghgvc.calculator').click
      end

      it "should fail to calculate" do
        expect(page).to_not have_content('ok')
      end
    end
  end
end
