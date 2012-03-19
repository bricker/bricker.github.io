Given /^I am on the login page$/ do
  visit login_path
end

When /^I submit a blank login form$/ do
  fill_in "username", with: ""
  fill_in "password", with: ""
  find("input[type=submit]").click
end

Then /^I should be redirected back to the login page$/ do
  current_path.should eq login_path
end

When /^I submit the login form with a correct password and an incorrect username$/ do
  fill_in "username", with: "Wrong"
  fill_in "password", with: "secret"
  find("input[type=submit]").click
end

When /^I submit the login form with a correct username and an incorrect password$/ do
  fill_in "username", with: "Admin"
  fill_in "password", with: "wrong"
  find("input[type=submit]").click
end

When /^I submit the login form with correct information$/ do
  fill_in "username", with: "Admin"
  fill_in "password", with: "secret"
  find("input[type=submit]").click
end

When /^I go to the logout page$/ do
  visit logout_path
end

Given /^I have logged in$/ do
  visit login_path
  fill_in "username", with: "Admin"
  fill_in "password", with: "secret"
  find("input[type=submit]").click
  current_path.should eq root_path
  page.should have_css "#flash .notice"
end

Given /^I am logged out$/ do
  visit logout_path
  visit login_path
  page.should have_css 'form'
end

Then /^I should be denied access$/ do
  current_path.should eq root_path
  page.should have_css "#flash .alert"
end
