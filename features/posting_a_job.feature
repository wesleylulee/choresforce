Feature: Posting a Job

	As a employer
	So that I can find a worker
	I want to post a work opportunity

	Scenario: Successful Posting
		Given I am on the job posting page
		And I enter "Lawn Mowing" in the title field
		And I select "Gardening" in the category menu
		And I enter "test!!" in the description field
		When I click submit
		And I should see the public job page
		And I should see a message "Job Successfully Posted" at the top of the page
		
	Scenario: Posting a Job with Empty Fields
		Given I am on the job posting page
		And I enter "" in the title field
		When I click submit
		Then I should see a page
		And it should have a message saying which fields are empty