Then /^I should see a success message$/ do
  page.should have_css "#flash .notice"
end

Then /^I should see an error message$/ do
  page.should have_css "#flash .alert"
end

Then /^I should be redirected to the home page$/ do
  current_path.should eq root_path
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^I should be notified that there are no items to list$/ do
  page.should have_css ".empty-list"
end

Then /^I should be notified of (\d+) validation errors?$/ do |num|
  page.should have_css("#error_explanation li", count: num.to_i)
end

Then /^I should be notified of validation errors$/ do
  page.should have_css("#error_explanation")
end

Then /^I should see a delete link$/ do
  page.should have_css ".manage a.delete-link"
end

Then /^I should see (?:an )?edit links?$/ do
  page.should have_css '.manage a.edit-link'
end

Then /^I shouldn't see any? edit links?$/ do
  page.should_not have_content ".manage a.edit-link"
end

Then /^I should see a create link$/ do
  page.should have_css ".manage a.create-link"
end

Then /^I shouldn't see a create link$/ do
  page.should_not have_content ".manage a.create-link"
end

Then /^I shouldn't see any admin links$/ do
  page.should_not have_css '.manage a.edit-link'
  page.should_not have_css '.manage a.delete-link'
  page.should_not have_css '.manage a.create-link'
end

When /^I go to the home page$/ do
  visit root_path
end