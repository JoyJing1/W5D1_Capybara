ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
# The `.rspec` file also contains a few flags that are not defaults but that
# users commonly want.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.include Capybara::DSL
  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

end


def signup(username)
  visit '/users/new'
  fill_in "username", with: username
  fill_in 'password', with: 'password123'
  click_button 'Sign Up'
end

def sign_in(username, password)
  visit '/session/new'
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button 'Sign In'
end

def sign_out
  visit '/users'
  click_button 'Sign Out'
end

def create_goal(options = {})
  default = {title: "DefaultTitle",
             description: "default_description",
             private_goal: false,
             author_id: 1
           }
  Goal.create(default.merge(options))
end
