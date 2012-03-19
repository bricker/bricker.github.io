Feature: Blog Posts
	In order to express my thoughts
	I
	Should be able to make blog posts
	
	Background:
		Given I have logged in

		Scenario: View Empty Blog List
			Given 0 blog posts
			When I go to the blog page
			Then I should be notified that there are no items to list

		Scenario: View Populated Blog List (Paginated)
			Given 10 blog posts
			When I go to the blog page
			Then I should see 5 blog posts listed
			And there should be pagination

		Scenario: Show admin links when logged in
			Given 2 blog posts
			When I go to the blog page
			Then I should see edit links
			And I should see a create link
			When I go to edit a post
			Then I should see a delete link

		Scenario: Hide admin links if not logged in
			Given I am logged out
			And 2 blog posts
			When I go to the blog page
			Then I shouldn't see any admin links

		Scenario: Block out unauthorized users from management pages
			Given I am logged out
			And 2 blog posts
			When I go to the new post page
			Then I should be denied access
			When I go to edit a post
			Then I should be denied access

		Scenario: Add invalid blog post
			When I go to the new post page
			And I submit a blank post form
			Then I should be notified of 2 validation errors

		Scenario: Add a valid blog post
			When I add a valid blog post
			Then I should see a success message
			And I should see 1 blog post listed

		Scenario: View a blog post
			Given 2 blog posts
			When I go to the page for the first post
			Then I should see the information for only that post
			
		Scenario: Edit an invalid blog post
			Given 1 blog post
			When I change that blog post's information to something invalid
			Then I should be notified of validation errors
			And the change should not show on the blog page

		Scenario: Edit a blog post
			Given 1 blog post
			When I change that blog post's information to something valid
			Then I should see a success message
			And the changes should show on the blog page

		Scenario: Destroy a blog post
			Given 2 blog posts
			When I delete the first blog post
			Then I should see a success message
			And I should see 1 blog post listed
