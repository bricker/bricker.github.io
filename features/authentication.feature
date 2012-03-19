Feature: Login
	In order to manage the website's contents
	Bryan Ricker
	Should be able to login
	
	Background:
		Given I am on the login page
		
	Scenario: Submit blank form
		When I submit a blank login form
		Then I should be redirected back to the login page
		And I should see an error message
		
	Scenario: Incorrect username
		When I submit the login form with a correct password and an incorrect username
		Then I should be redirected back to the login page
		And I should see an error message
			
	Scenario: Incorrect password
		When I submit the login form with a correct username and an incorrect password
		Then I should be redirected back to the login page
		And I should see an error message
			
	Scenario: Correct login
		When I submit the login form with correct information
		Then I should be redirected to the home page
		And I should see a success message
		
	Scenario: Visit Logout
		When I go to the logout page
		Then I should be redirected to the home page
		And I should see a success message