Feature: Managing customers
  In order to track customers
  As a user
  I want to be able to add, edit, and delete customers.

  Scenario: Adding a customer
    Given I am on the home page
    And I follow "Customers"
    And I follow "Add customer"
    When I fill in "First name" with "Bob"
    And I fill in "Last name" with "Thompson"
    And I fill in "Address" with "123 Tool Blvd"
    And I fill in "City" with "Rocky Mount"
    And I fill in "State" with "NC"
    And I fill in "Zip" with "27801"
    And I fill in "Contact" with "252-823-5555"
    And I press "Add customer"
    Then I should be on the "Customers" index page
    And I should see "Customer added"
    And I should see "Bob Thompson"
