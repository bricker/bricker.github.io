Given /^(\d+) pages?$/ do |num|
  @pages = FactoryGirl.create_list(:page, num.to_i)
end

When /^I go to that page$/ do
    visit view_page_path(@pages.first)
end

Then /^I should see a page title$/ do
  page.should have_content @pages.first.title
end

When /^I go to edit that page$/ do
  visit edit_page_path(@pages.first)
end

When /^I edit that page with valid information$/ do
  visit edit_page_path(@pages.first)
  fill_in "page_title", with: "Edited Page Title"
  fill_in "page_content", with: "Edit page content."
  find("input[type=submit]").click
end

Then /^the changes should show on that page$/ do
  visit view_page_path(@pages.first)
  page.should have_content "Edited Page Title"
end

When /^I make a new page with valid fields$/ do
  visit new_page_path
  fill_in "page_title", with: "Page Title"
  fill_in "page_text_id", with: "page_id"
  fill_in "page_content", with: "This is some page content"
  find("input[type=submit]").click
end

Then /^there should be (\d+) pages?$/ do |num|
  Page.all.count.should eq num.to_i
end

When /^I make a new page with invalid fields$/ do
  visit new_page_path
  fill_in "page_title", with: "Page Title"
  fill_in "page_text_id", with: ""
  fill_in "page_content", with: "This is some page content"
  find("input[type=submit]").click
end

Then /^the changes should not show on that page$/ do
  visit view_page_path(@pages.first)
  page.should_not have_content "Edited Page Title"
end

When /^I delete the first page$/ do
  visit view_page_path(@pages.first)
  first(".edit-link").click
  find(".delete-link").click
end

When /^I go to create a new page$/ do
  visit new_page_path
end

Then /^I should see a create page link$/ do
  page.should have_css ".admin #create-page"
end
