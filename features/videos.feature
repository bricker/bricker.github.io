Feature: Video
	In order for people to see my work
	Bryan Ricker
	Should be able to manage the videos on the website
	
	Background: 
		Given I have logged in
		
	Scenario: View Empty Video List
		Given 0 videos
		When I go to the videos page
		Then I should be notified that there are no items to list
		
	Scenario: View Populated Video List
		Given 5 videos
		When I go to the videos page
		Then I should see 5 videos listed
	
	Scenario: Show admin links when logged in
		Given 2 videos
		When I go to the videos page
		Then I should see edit links
		And I should see a create link
		When I go to edit a video
		Then I should see a delete link

	Scenario: Hide admin links if not logged in
		Given I am logged out
		And 2 videos
		When I go to the videos page
		Then I shouldn't see any admin links

	Scenario: Block out unauthorized users from management pages
		Given I am logged out
		And 2 videos
		When I go to the new video page
		Then I should be denied access
		When I go to edit a video
		Then I should be denied access
			
	Scenario: Add invalid video
		When I go to the new video page
		And I submit a blank video form
		Then I should be notified of 2 validation errors
	
	Scenario: Fill in only vimeo source
		When I add a video with only a vimeo source
		Then I should see the vimeo video
		And I should not see a youtube icon
		
	Scenario: Fill in only youtube source
		When I add a video with only a youtube source
		Then I should see the youtube video

	Scenario: Fill in both sources
		When I add a video with both video sources
		Then I should see the vimeo video
		And I should see a youtube icon
			
	Scenario: Add a valid video
		When I add a valid video
		Then I should see a success message
		And I should see 1 video listed
		
	Scenario: Edit an invalid video
		Given 1 video
		When I change that video's information to something invalid
		Then I should be notified of validation errors
		And the change should not show on the videos page
		
	Scenario: Edit a video
		Given 1 video
		When I change that video's information to something valid
		Then I should see a success message
		And the changes should show on the videos page
	
	Scenario: Destroy a video
		Given 2 videos
		When I delete the first video
		Then I should see a success message
		And I should see 1 video listed
