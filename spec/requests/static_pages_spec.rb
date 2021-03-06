require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }
    title_test('Sample App', full_title('Home'))
    
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, :user => user, :content => "Lorem ipsum")
        FactoryGirl.create(:micropost, :user => user, :content => "Dolor sit amet")
        sign_in(user)
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("tr##{item.id}", :text => item.content)
        end
      end
      
      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before { user.follow!(other_user) }

        it { should have_selector('a', :href => following_user_path(user),
                                       :content => "0 following") }
        it { should have_selector('a', :href => followers_user_path(user),
                                       :content => "1 follower") }
      end
    end
  end

  describe "Help page" do
    before { visit help_path }    
    title_test('Help', full_title('Help'))
  end

  describe "About page" do
    before { visit about_path }
    title_test('About', full_title('About Us'))
  end

  describe "Contact page" do
    before { visit contact_path }
    title_test('Contact', full_title('Contact'))
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', :text => full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', :text => full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', :text => full_title('Contact')
    click_link "Home"
    page.should have_selector 'title', :text => full_title('Home')
    click_link "Sign up now!"
    page.should have_selector 'title', :text => full_title('Sign up')
  end
end