Feature: Audio
	In order for people to hear my music
	Bryan Ricker
	Should be able to manage the audio list on the website
	
	Background: 
		Given I have logged in
		
	Scenario: View Empty Audio List
		Given 0 audio items
		When I go to the audio page
		Then I should be notified that there are no items to list
		
	Scenario: View Populated Audio List
		Given 5 audio items
		When I go to the audio page
		Then I should see 5 audio items listed
	
	Scenario: Show admin links when logged in
		Given 2 audio items
		When I go to the audio page
		Then I should see edit links
		And I should see a create link
		When I go to edit an audio item
		Then I should see a delete link

	Scenario: Hide admin links if not logged in
		Given I am logged out
		And 2 audio items
		When I go to the audio page
		Then I shouldn't see any admin links

	Scenario: Block out unauthorized users from management pages
		Given I am logged out
		And 2 audio items
		When I go to the new audio page
		Then I should be denied access
		When I go to edit an audio item
		Then I should be denied access
			
	Scenario: Add invalid audio item
		When I go to the new audio page
		And I submit a blank audio form
		Then I should be notified of 2 validation errors
		
	Scenario: Add a valid audio item
		When I add a valid audio item
		Then I should see a success message
		And I should see 1 audio item listed
		
	Scenario: Edit an invalid audio item
		Given 1 audio item
		When I change that audio item's information to something invalid
		Then I should be notified of validation errors
		And the change should not show on the audio page
		
	Scenario: Edit an audio item
		Given 1 audio item
		When I change that audio item's information to something valid
		Then I should see a success message
		And the changes should show on the audio page
	
	Scenario: Destroy an audio item
		Given 2 audio items
		When I delete the first audio item
		Then I should see a success message
		And I should see 1 audio item listed
