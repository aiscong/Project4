When /^I visit the home page$/ do
  visit root_path
end

Then /^I should see website name$/ do
   expect(page).to have_content('Raccoon')
end

Then /^I should only see website base title$/ do
  expect(page).to have_title('Raccoon') 
end

And /^I should not see home page full title$/ do
  expect(page).not_to have_title('| Home')
end


When /^I visit the contact page$/ do
  visit contact_path
end

Then /^I should see contact page full title$/ do
 expect(page).to have_title('Raccoon | Contact')
end

And /^I should see contact page key word$/ do
  expect(page).to have_title('Raccoon | Contact')
end

When /^I visit the about page$/ do
  visit about_path
end

Then /^I should see about page full title$/ do
  expect(page).to have_title('Raccoon | About Us')
end

And /^I should see about page key word$/ do
  expect(page).to have_title('Raccoon | About') 
end