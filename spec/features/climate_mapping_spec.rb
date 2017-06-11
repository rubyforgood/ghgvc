require "rails_helper"

RSpec.describe "Climate Mapping" do
  describe "visit path" do
    before { visit root_path }

    it "should display root path" do
      expect(page).to have_content("Ecosystem Climate Regulation Services Calculator")
    end

  describe "Running Calculator", js: true do
    context "Running Calaculator With No Selected Ecosystem" do
      before do
        visit root_path
        page.accept_alert 'Please check one or more ecosystems' do
          find("#run_ghgvc_calculator").click
        end
      end

      it "should fail to calculate" do

      end
    end
    #TODO: Make this pass
    xcontext "Running Calculator With A Selected Ecosystem" do
      before do
        find(:xpath, ".//*[@id='map_canvas']/div/div/div[1]/div[1]/div[1]/div/div/div[12]").click
        find(:xpath, ".//*[@id='biome_instance-1']/div[4]/div/div[1]/label/input").set(true)
        find(:xpath, "//div[@id='run_ghgvc_calculator']").click
      end

      it "should calculate" do
        expect(page).to have_content('lala')
      end
    end
  end

  describe "Removing Location", js: true do
    context "when no location selected" do
      before do
        visit root_path
        find(:xpath, ".//*[@id='biome_instance-1']/div[2]").click
      end

      it "should fail to remove location" do
        expect(page).to have_content("Missing values (particularly common for biophysical components) indicate that climate regulating values cannot be calculated because of insufficient data.")
      end
    end
  end

  describe "Selecting Map Locations" do
    context "locating a location" do
      before do
        visit root_path
      end

      it "should have map" do
        expect(page).to have_css('.gm-style>div>div>div')
      end
    end
  end
end
end
