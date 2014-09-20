require 'spec_helper'

describe "Static pages" do

let(:base_title) {"Consumer Tadka"}
  describe "Home page" do

    it "should have the title 'Consumer Tadka | Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("#{base_title} | Home")
    end
  end

  describe "About page" do

  it "should have the title 'Consumer Tadka | About'" do
    visit '/static_pages/about'
    expect(page).to have_title("#{base_title} | About")
  end
end

  describe "Help page" do

    it "should have the title 'Consumer Tadka | Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | Help")
    end
  end
end