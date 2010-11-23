Feature:  Create New Account

	As a new user
	So that I can use the application
	I want to be able to create an account

	Scenario: Successful Account Creation
		Given I click on the register link
		And I enter "test" in the login field
		And I enter "test@test.com" in the email field
		And I enter "password" in the password field
		And I enter "94704" in the zip code field
		And I enter "blah blah blah" in the description field
		When I click on sign up
		Then I should see a page saying that I am logged in
	
	Scenario: Unsuccessful Account Creation
		Given I click on the register link
		And I enter "ab" in the login field
		And I enter "test@test.com" in the email field
		And I enter "password" in the password field
		And I enter "94704" in the zip code field
		And I enter "blah blah blah" in the description field
		When I click on sign up
		Then I should see an error message telling me the login field is too short

