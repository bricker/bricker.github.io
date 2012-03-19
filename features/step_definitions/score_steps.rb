Given /^(\d+) scores?$/ do |num|
  @scores = FactoryGirl.create_list(:score, num.to_i)
end

When /^I go to the scores page$/ do
  visit scores_path
end

Then /^I should be on the scores page$/ do
  current_path.should eq scores_path
end

Then /^I should see (\d+) scores? listed$/ do |num|
  page.should have_css ".score-item", count: num.to_i
end

When /^I go to the new score page$/ do
  visit new_score_path
end

When /^I submit a blank score form$/ do
  fill_in "score_title", with: ""
  fill_in "score_description", with: ""
  find("input[type=submit]").click
end

When /^I add a valid score$/ do
  visit new_score_path
  fill_in "score_title", with: "Score Title"
  attach_file(:score_asset, File.join(Rails.root, 'features', 'support', 'test-upload.pdf'))
  fill_in "score_description", with: "Score description."
  find("input[type=submit]").click
end

When /^I change that score's information to something invalid$/ do
  @valid_score = @scores.first
  visit edit_score_path(@scores.first)
  fill_in "score_title", with: ""
  find("input[type=submit]").click
end

Then /^the change should not show on the scores page$/ do
  visit scores_path
  page.should have_content(@valid_score.title)
end

When /^I change that score's information to something valid$/ do
  visit edit_score_path(@scores.first)
  fill_in "score_title", with: "Edited Score Title"
  find("input[type=submit]").click
end

Then /^the changes should show on the scores page$/ do
  visit scores_path
  page.should have_content "Edited Score Title"
end

When /^I delete the first score$/ do
  visit scores_path
  first(".edit-link").click
  find(".delete-link").click
end

When /^I skip cropping$/ do
  click_link "skip-crop"
end

When /^I crop the image$/ do
  find("input[type=submit]").click
end

When /^I change that score's file$/ do
  visit edit_score_path(@scores.first)
  attach_file(:score_asset, File.join(Rails.root, 'features', 'support', 'test-upload2.pdf'))
  find("input[type=submit]").click
end

Then /^I should be asked to crop the thumbnail$/ do
  page.should have_css ".edit_score"
end

When /^I go to edit a score$/ do
  visit edit_score_path(@scores.first)
end

