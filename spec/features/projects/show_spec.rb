require 'rails_helper'

RSpec.describe "Project's Show Page" do
  before(:each) do 
    @recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create!(name: "Boardfit", material: "Cardboard Boxes")

    @upholstery_tux = @furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create!(name: "Litfit", material: "Lamp")
  end

  describe "When I visit a project's show page ('/projects/:id')" do 
    it 'exists' do
      visit "/projects/#{@news_chic.id}"

      expect(current_path).to eq("/projects/#{@news_chic.id}")
    end

    it "I see that project's name, material, and challenge" do
      visit "/projects/#{@news_chic.id}"

      expect(page).to have_content("News Chic")
      expect(page).to have_content("Material: Newspaper")
      expect(page).to have_content("Challenge Theme: Recycled Material")
    end
  end
end