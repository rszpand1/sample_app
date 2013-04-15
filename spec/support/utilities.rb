include ApplicationHelper

def valid_signin(user)
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def valid_signup(user)
  fill_in "Name", with: user.name
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  fill_in "Confirm Password", with: user.password
end

def sign_in(user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-success', text: message)
  end
end

RSpec::Matchers.define :have_expected_header do |header|
  match do |page|
    page.should have_selector('h1', text: header)
  end
end

RSpec::Matchers.define :have_expected_title do |title|
  match do |page|
    page.should have_selector('title', text: title)
  end
end