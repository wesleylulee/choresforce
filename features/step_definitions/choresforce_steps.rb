include AuthenticatedSystem


class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end

Given /^I click on the register link$/ do
  visit path_to("the home page")
  click_link("Register")
end

Given /^I enter "([^"]*)" in the login field$/ do |arg1|
  fill_in("Login", :with => arg1)
end

Given /^I enter "([^"]*)" in the email field$/ do |arg1|
  fill_in("Email", :with => arg1)
end

Given /^I enter "([^"]*)" in the password field$/ do |arg1|
  fill_in("Password", :with => arg1)
  fill_in("Confirm Password", :with => arg1)
end

Given /^I enter "([^"]*)" in the zip code field$/ do |arg1|
  fill_in("Zip Code", :with => arg1)
end

Given /^I enter "([^"]*)" in the description field$/ do |arg1|
  fill_in("Description", :with => arg1)
end

When /^I click on sign up$/ do
  click_button("Sign up")
end

Then /^I should see a page saying that I am logged in$/ do
 # response.should contain("Thanks for signing up! You are now logged in!")
end

Then /^I should see an error message telling me the login field is too short$/ do
  response.should contain("Login is too short")
end
Given /^I enter "([^"]*)" in the search box$/ do |arg1|
  visit path_to("the home page")
  fill_in("title[title]", :with => arg1)

end

Given /^the category selected as "([^"]*)"$/ do |arg1|
  select(arg1, :from => "category")
end

When /^I click search$/ do
  click_button("Search")

end

Then /^all the results should include "([^"]*)" in the title or category$/ do |arg1|
  pending
  response.entries should include arg1	
end



Then /^all the results should be of the cateogry "([^"]*)"$/ do |arg1|
  pending
  response.entries should have_category arg1
end

Then /^I should see a page with the message "([^"]*)"$/ do |arg1|
  pending
  response.should contain(arg1)
end

Given /^I see a frame with all the offers$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I click the accept button for an offer$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the offers frame should be replaced by the message "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^it should show a link to the worker's profile$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I enter "([^"]*)" in the title field$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I select "([^"]*)" in the category menu$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I click submit$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I should see the public job page$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I should see a message "([^"]*)" at the top of the page$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^it should have a message saying which fields are empty$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I am logged in$/ do

#  assert current_user
end

Given /^I am on a chores listing page$/ do

end

Then /^I enter "([^"]*)" in the service charge field$/ do |arg1|
 # fill_in("amount", :with => arg1)
end

When /^click on submit$/ do
 # click_button("Submit")
end

Then /^I should be taken back to a listings page$/ do
#  visit path_to("a chores listing page")
end

Then /^the page should have a confirmation message$/ do
 # response.should contain("Offer successfully submitted.")
end

Then /^the page should have a message saying the field$/ do
  pending # express the regexp above with the code you wish you had
end


Given /^I click the username of "test_worker"$/ do
  visit path_to("the home page")
  click_link("Login")
  fill_in("login", :with => "test_worker")
  fill_in("password", :with=> "password")
  click_button("Log in")
end

Then /^I should see "test_worker"'s profile$/ do
  #visit path_to("the home page")
  #click_link("Login")
  #fill_in("login", :with => "test_worker")
  #fill_in("password", :with=> "password")
  #click_button("Log in")
  #click_link("Account")
  #response.should contain("test_worker's Profile")
  #response.should contain("Dashboard")
end

Then /^I should see the worker's username "([^"]*)", and his rating (\d+) out of (\d+), and description "([^"]*)"$/ do |arg1, arg2, arg3, arg4|
 # output.messages.should include(arg1)
end

