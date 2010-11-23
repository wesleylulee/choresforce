Feature: Offer Acceptance

	As an employer
	So that I can choose a worker
	I want to be able to accept an offer

	Scenario: Accepting an Offer
		Given I am on a job listing page that I own
		And I see a frame with all the offers
		When I click the accept button for an offer
		Then the offers frame should be replaced by the message "Offer for [username of worker] successful"
		And it should show a link to the worker's profile