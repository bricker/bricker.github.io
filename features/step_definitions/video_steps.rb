Given /^(\d+) videos?$/ do |num|
  @videos = FactoryGirl.create_list(:video, num.to_i)
end

When /^I go to the videos page$/ do
  visit videos_path
  current_path.should eq videos_path
end

Then /^I should see (\d+) videos? listed$/ do |num|
  page.should have_css ".video-item", count: num.to_i
end

When /^I go to the new video page$/ do
  visit new_video_path
end

When /^I submit a blank video form$/ do
  fill_in "video_title", with: ""
  fill_in "video_description", with: ""
  fill_in "video_youtube_id", with: ""
  fill_in "video_vimeo_id", with: ""
  find("input[type=submit]").click
end

When /^I add a video with only a vimeo source$/ do
  @video = FactoryGirl.create :video, youtube_id: nil, vimeo_id: '012345'
  @video.youtube_id.should be_nil
end

Then /^I should see the vimeo video$/ do
  visit videos_path
  page.should have_css 'iframe.vimeo'
end

Then /^I should not see a youtube icon$/ do
  visit videos_path
  page.should_not have_css "img.youtube-icon"
end

When /^I add a video with only a youtube source$/ do
  @video = FactoryGirl.create :video, youtube_id: '012345', vimeo_id: nil
  @video.vimeo_id.should be_nil
end

Then /^I should see the youtube video$/ do
  visit videos_path
  page.should have_css 'iframe.youtube'
end

When /^I add a video with both video sources$/ do
  @video = FactoryGirl.create :video, youtube_id: '012345', vimeo_id: "78910"
end

Then /^I should see a youtube icon$/ do
  visit videos_path
  page.should have_css "img.youtube-icon"
end

When /^I add a valid video$/ do
  visit new_video_path
  fill_in "video_title", with: "Video Title"
  fill_in "video_description", with: "Video description."
  fill_in "video_youtube_id", with: "012345"
  fill_in "video_vimeo_id", with: "678910"
  find("input[type=submit]").click
end

When /^I change that video's information to something invalid$/ do
  @valid_video = @videos.first
  visit edit_video_path(@videos.first)
  fill_in "video_youtube_id", with: ""
  fill_in "video_vimeo_id", with: ""
  find("input[type=submit]").click
end

Then /^the change should not show on the videos page$/ do
  visit videos_path
  page.should have_content(@valid_video.title)
end

When /^I change that video's information to something valid$/ do
  visit edit_video_path(@videos.first)
  fill_in "video_title", with: "Edited Video Title"
  fill_in "video_description", with: "Edited Video description."
  fill_in "video_youtube_id", with: "0123456"
  fill_in "video_vimeo_id", with: "6789106"
  find("input[type=submit]").click
end

Then /^the changes should show on the videos page$/ do
  visit videos_path
  page.should have_content "Edited Video Title"
end

When /^I delete the first video$/ do
  visit videos_path
  first(".edit-link").click
  find(".delete-link").click
end

When /^I go to edit a video$/ do
  visit edit_video_path(@videos.first)
end
