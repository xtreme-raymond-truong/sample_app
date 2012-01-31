require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }
    title_test('Sample App', 'Home')
  end

  describe "Help page" do
    before { visit help_path }    
    title_test('Help', 'Help')
  end

  describe "About page" do
    before { visit about_path }
    title_test('About', 'About Us')
  end

  describe "Contact page" do
    before { visit contact_path }
    title_test('Contact', 'Contact')
  end
end