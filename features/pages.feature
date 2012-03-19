Feature: Pages
	In order to manage the content on static pages
	I
	Should be able to login and change that content
	
	Background:
		Given I have logged in
	
	Scenario: View page
		Given 1 page
		When I go to that page
		Then I should see a page title
	
	Scenario: Show admin links when logged in
		Given 1 page
		When I go to the home page
		Then I should see a create page link
		When I go to that page
		Then I should see an edit link
		When I go to edit that page
		Then I should see a delete link

	Scenario: Hide admin links if not logged in
		Given I am logged out
		And 1 page
		When I go to that page
		Then I shouldn't see any admin links

	Scenario: Block out unauthorized users from management pages
		Given I am logged out
		And 1 page
		When I go to edit that page
		Then I should be denied access
		When I go to create a new page
		Then I should be denied access
	
	Scenario: Create a valid page
		When I make a new page with valid fields
		Then I should see a success message
		And there should be 1 page
	
	Scenario: Create an invalid page
		When I make a new page with invalid fields
		Then I should be notified of validation errors
		And there should be 0 pages
					
	Scenario: Edit a page with valid information
		Given 1 page
		When I edit that page with valid information
		Then I should see a success message
		And the changes should show on that page
		
	Scenario: Destroy a page
		Given 2 pages
		When I delete the first page
		Then I should see a success message
		And there should be 1 page
