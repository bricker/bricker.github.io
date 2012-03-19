Given /^(\d+) audio items?$/ do |num|
  @audios = FactoryGirl.create_list(:audio, num.to_i)
end

When /^I go to the audio page$/ do
  visit audios_path
  current_path.should eq audios_path
end

Then /^I should see (\d+) audio items? listed$/ do |num|
  page.should have_css ".audio-item", count: num.to_i
end

When /^I go to the new audio page$/ do
  visit new_audio_path
end

When /^I submit a blank audio form$/ do
  fill_in "audio_title", with: ""
  fill_in "audio_description", with: ""
  fill_in "audio_soundcloud_id", with: ""
  find("input[type=submit]").click
end

When /^I add a valid audio item$/ do
  visit new_audio_path
  fill_in "audio_title", with: "Audio Title"
  fill_in "audio_description", with: "audio description"
  fill_in "audio_soundcloud_id", with: "000000"
  find("input[type=submit]").click
end

When /^I change that audio item's information to something invalid$/ do
  @valid_audio = @audios.first
  visit edit_audio_path(@audios.first)
  fill_in "audio_title", with: ""
  fill_in "audio_soundcloud_id", with: ""
  find("input[type=submit]").click
end

Then /^the change should not show on the audio page$/ do
  visit audios_path
  page.should have_content(@valid_audio.title)
end

When /^I change that audio item's information to something valid$/ do
  visit edit_audio_path(@audios.first)
  fill_in "audio_title", with: "Edited Audio Title"
  fill_in "audio_soundcloud_id", with: "12345"
  find("input[type=submit]").click
end

Then /^the changes should show on the audio page$/ do
  visit audios_path
  page.should have_content "Edited Audio Title"
end

When /^I delete the first audio item$/ do
  visit audios_path
  first(".edit-link").click
  find(".delete-link").click
end

When /^I go to edit an audio item$/ do
  visit edit_audio_path(@audios.first)
end


