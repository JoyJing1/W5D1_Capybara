# it "new user page has Create New User text" do
#   visit '/users/new'
#   expect(page).to have_content "Create New User"
# end
#
# context 'with valid parameters' do
#   before(:each) do
#     # let(:user) { User.create({username: "my_name", password: "password123"})}
#     post :create, user: {username: 'my_name', password: "password123"}
#   end
#
#   it 'redirects to user\'s show page' do
#     expect(page).to have_content("my_name")
#   end
# end

# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  it "has a new user page" do
    visit '/users/new'
    expect(page).to have_content "Create a New User"
  end

  feature "signing up a user" do
    it "shows username on the homepage after signup" do
      signup('my_name')
      expect(page).to have_content("my_name")
    end
  end

end

feature "logging in" do
  it "redirects to user show page" do
    signup("my_name")
    sign_in('my_name', 'password123')
    expect(current_path).to eq("/users/1")
  end
end

feature "logging in" do
  it "shows username on the homepage after login" do
    signup("my_name")
    sign_in('my_name', 'password123')
    visit '/users'
    expect(page).to have_content('my_name')
  end
end

feature "logging out" do
  it "begins with logged out state" do
    visit "/"
    expect(page).not_to have_content('my_name')
    # expect(logged_in?).to be false
  end

  it "doesn't show username on the homepage after logout" do
    signup('my_name')
    sign_out
    expect(page).not_to have_content('my_name')
  end

end
