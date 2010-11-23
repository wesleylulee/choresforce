Feature:  Service Offer

	As a job seeker
	So that I can offer my services
	I want to make an offer on a job listing
	
	Scenario: Sucessfuly Make an Offer
		Given I am logged in
		And I am on a chores listing page
		When I enter "5" in the service charge field
		And click on submit
		Then I should be taken back to a listings page
		And the page should have a confirmation message
	
	Scenario: Make an Offer With Invalid Amount
		Given I am logged in
		And I am on a chores listing page
		When I enter "x" in the service charge field
		And click on submit
		Then I should be taken back to a listings page
		And the page should have a message saying the field 

