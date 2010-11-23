Feature:  View Worker Ratings

	As an employer
	So that I can choose a worker
	I want to be able to view ratings and profiles of the workers 

	Scenario: View User Rating and Description
		Given I click the username of "test_worker"
		Then I should see "test_worker"'s profile
		And I should see the worker's username "test_worker", and his rating 3 out of 5, and description "I am a test worker"