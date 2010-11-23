Feature:  Job Search

	As a job seeker
	So that I can find work
	I want to view job listings in my area

	Scenario: All Categories Search
		Given I enter "gardening" in the search box
		And the category selected as "All"
		When I click search
		And all the results should include "gardening" in the title or category
		
	Scenario: Specific Category Search
		Given I enter "mowing" in the search box
		And the category selected as "Gardening"
		When I click search
		And all the results should be of the cateogry "Gardening"
		And all the results should include "mowing" in the title or category
		
	Scenario: Empty Search
		Given I enter "" in the search box
		And the category selected as "All"
		When I click search
		Then I should see a page with the message "Please enter search parameters."