require 'spec_helper'
require 'rails_helper'

feature "Creating Goals" do
  context "while user is logged in" do
    before(:each) do
      signup('my_name')
      visit '/goals/new'
    end

    it "has a form to create new goals" do
      expect(page).to have_content('Create New Goal')
    end

    it "accepts a Description and Title for new goal" do
      expect(page).to have_content('Description')
      expect(page).to have_content('Title')
    end

    it "accepts a boolean for whether a goal is private" do
      expect(page).to have_content("Private?")
    end

    it "validates title is present" do
      click_button "Create New Goal"
      expect(page).to have_content("Title can't be blank")
    end

    it "redirect to users show page" do
      fill_in "Title", with: "This is my Goal!"
      click_button "Create New Goal"
      expect(page).to have_content "This is my Goal"
      expect(current_path).to eq("/users/#{User.last.id}")
      expect(page).not_to have_content "Title can't be blank"
    end

    it "accepts text in description" do
      fill_in "Description", with: "test description"
      fill_in "Title", with: "This is my goal!"
      click_button "Create New Goal"
      expect(page).to have_content "test description"
    end

    it "redirects back to new form when save fails" do
      fill_in "Description", with: "test description"
      click_button "Create New Goal"
      expect(page).to have_content("test description")
    end
  end

  context 'while user is logged out' do
    it "redirects user to login page" do
      visit '/goals/new'
      expect(current_path).to eq('/session/new')
    end
  end


end

feature "Viewing Goals" do
  before(:each) do
    signup("RealName")
    create_goal(title: "PublicGoal1", author_id: User.last.id)
    create_goal(title: "PublicGoal2", author_id: User.last.id)
    create_goal(title: "PrivateGoal", private_goal: true, author_id: User.last.id)
  end

  it "Public goals can be viewed by everyone" do
    sign_out
    signup("SecondName")
    visit "/goals"
    expect(page).to have_content "PublicGoal1"
    expect(page).to have_content "PublicGoal2"
  end

  it "Private goals are hidden from other users" do
    sign_out
    signup("SecondName")
    visit "/goals"
    expect(page).not_to have_content "PrivateGoal"
  end

  it "Private goals are viewable by creator" do
    visit "/goals"
    expect(page).to have_content "PrivateGoal"
  end
end

feature "Update and Delete Goals" do
end
