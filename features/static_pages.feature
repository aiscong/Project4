Feature: Static pages

Scenario: Home page
When I visit the home page
Then I should see website name
Then I should only see website base title
And I should not see home page full title

Scenario: Contact page
When I visit the contact page
Then I should see contact page full title
And I should see contact page key word

Scenario: About page
When I visit the about page
Then I should see about page full title
And I should see about page key word