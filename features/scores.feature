Feature: Scores
	In order for people to see my music
	Bryan Ricker
	Should be able to manage the scores on the website
	
	Background: 
		Given I have logged in
		
	Scenario: View Empty Scores List
		Given 0 scores
		When I go to the scores page
		Then I should be notified that there are no items to list
		
	Scenario: View Populated Scores List
		Given 2 scores
		When I go to the scores page
		Then I should see 2 scores listed
	
	Scenario: Show admin links when logged in
		Given 2 scores
		When I go to the scores page
		Then I should see edit links
		And I should see a create link
		When I go to edit a score
		Then I should see a delete link

	Scenario: Hide admin links if not logged in
		Given I am logged out
		And 1 score
		When I go to the scores page
		Then I shouldn't see any admin links

	Scenario: Block out unauthorized users from management pages
		Given I am logged out
		And 2 scores
		When I go to the new score page
		Then I should be denied access
		When I go to edit a score
		Then I should be denied access
			
	Scenario: Add invalid score
		When I go to the new score page
		And I submit a blank score form
		Then I should be notified of validation errors
		
	Scenario: Add a valid score without cropping
		When I add a valid score
		And I skip cropping
		Then I should be on the scores page
		And I should see 1 score listed
		
	Scenario: Crop the score's thumbnail
		When I add a valid score
		And I crop the image
		Then I should see a success message
		And I should see 1 score listed
		
	Scenario: Edit an invalid score
		Given 1 score
		When I change that score's information to something invalid
		Then I should be notified of validation errors
		And the change should not show on the scores page
		
	Scenario: Edit a score without attaching a different file
		Given 1 score
		When I change that score's information to something valid
		Then I should see a success message
		And the changes should show on the scores page
		
	Scenario: Attach a different file to a score
		Given 1 score
		When I change that score's file
		Then I should see a success message
		And I should be asked to crop the thumbnail
	
	Scenario: Destroy a score
		Given 2 scores
		When I delete the first score
		Then I should see a success message
		And I should see 1 score listed
