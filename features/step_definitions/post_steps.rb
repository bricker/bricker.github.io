Given /^(\d+) blog posts?$/ do |num|
  @posts = FactoryGirl.create_list(:post, num.to_i)
end

When /^I go to the blog page$/ do
  visit posts_path
  current_path.should eq posts_path
end

Then /^I should see (\d+) blog posts? listed$/ do |num|
  visit posts_path
  page.should have_css ".blog-post", count: num.to_i
end

Then /^there should be pagination$/ do
  page.should have_css "nav.pagination"
  page.should have_css ".pagination .page", count: 2
end

When /^I go to the new post page$/ do
  visit new_post_path
end

When /^I submit a blank post form$/ do
  fill_in "post_title", with: ""
  fill_in "post_body", with: ""
  find("input[type=submit]").click
end

When /^I add a valid blog post$/ do
  visit new_post_path
  fill_in "post_title", with: "Post title"
  fill_in "post_body", with: "Post body."
  find("input[type=submit]").click
end

When /^I go to the page for the first post$/ do
  visit post_path(@posts.first)
  current_path.should eq post_path(@posts.first)
end

Then /^I should see the information for only that post$/ do
  page.should have_content @posts.first.title
  page.should_not have_content @posts[1].title
end

When /^I change that blog post's information to something invalid$/ do
  @valid_post = @posts.first
  visit edit_post_path(@posts.first)
  fill_in "post_title", with: ""
  fill_in "post_body", with: ""
  find("input[type=submit]").click
end

Then /^the change should not show on the blog page$/ do
  visit posts_path
  page.should have_content(@valid_post.title)
end

When /^I change that blog post's information to something valid$/ do
  visit edit_post_path(@posts.first)
  fill_in "post_title", with: "New Post Title"
  fill_in "post_body", with: "New Post Body"
  find("input[type=submit]").click
  current_path.should eq post_path(@posts.first)
end

Then /^the changes should show on the blog page$/ do
  visit posts_path
  page.should have_content "New Post Title"
end

When /^I delete the first blog post$/ do
  visit posts_path
  first(".edit-link").click
  find(".delete-link").click
end

When /^I go to edit a post$/ do
  visit edit_post_path(@posts.first)
end
