Feature: Managing AC Units
  In order to track the warranties and the type of AC units customers have
  As a business owner
  I want to be able to manage AC units

  Scenario: Adding an AC unit
    Given I am on the home page
    And I follow "Units"
    And I follow "Add unit"
    When I fill in "Customer" with "###CUSTOMER?###"
    And I fill in "Model" with "Blaster Master"
    And I fill in "Serial number" with "ABC123456"
    And I press "Add"
    Then I should be on the "Units" index page
    And I should see "##Customer Name##"
    And I should see "Blaster Master"
    And I should see "ABC123456"
