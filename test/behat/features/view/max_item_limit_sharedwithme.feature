@javascript @core @core_view @core_portfolio
 Feature: Adjusting the max items limit on the Shared with me page.

In order to be able to display a set amount of items on the shared with me page

As an admin
  So I can view only a limited amount of pages at one time.

 Scenario: Making sure that the max items per page drop down limits to correct amount of pages (Bug 1409369)
  Given the following "users" exist:
     | username | password | email | firstname | lastname | institution | authname | role |
     | userA | Password1 | test01@example.com | Pete | Mc | mahara | internal | member |
     | userB | Password1 | test02@example.com | Simon | Mc | mahara | internal | member |
  And I log in as "userA" with password "Password1"
  And the following "pages" exist:
     | title | description| ownertype | ownername |
     | A's Page 01 | UserA's page 01 | user | userA |
     | A's Page 02 | UserA's page 02 | user | userA |
     | A's Page 03 | UserA's page 03 | user | userA |
     | A's Page 04 | UserB's page 04 | user | userA |
     | A's Page 05 | UserA's page 05 | user | userA |
     | A's Page 06 | UserA's page 06 | user | userA |
     | A's Page 07 | UserA's page 07 | user | userA |
     | A's Page 08 | UserA's page 08 | user | userA |
     | A's Page 09 | UserA's page 01 | user | userA |
     | A's Page 10 | UserA's page 02 | user | userA |
     | A's Page 11 | UserA's page 01 | user | userA |
     | A's Page 12 | UserA's page 02 | user | userA |
     | A's Page 13 | UserA's page 03 | user | userA |
     | A's Page 14 | UserB's page 04 | user | userA |
     | A's Page 15 | UserA's page 05 | user | userA |
     | A's Page 16 | UserA's page 06 | user | userA |
     | A's Page 17 | UserA's page 07 | user | userA |
     | A's Page 18 | UserA's page 08 | user | userA |
     | A's Page 19 | UserA's page 01 | user | userA |
     | A's Page 20 | UserA's page 02 | user | userA |
     | A's Page 21 | UserA's page 01 | user | userA |
     | A's Page 22 | UserA's page 02 | user | userA |
     | A's Page 23 | UserA's page 03 | user | userA |
     | A's Page 24 | UserB's page 04 | user | userA |
     | A's Page 25 | UserA's page 05 | user | userA |
     | A's Page 26 | UserA's page 06 | user | userA |
     | A's Page 27 | UserA's page 07 | user | userA |
     | A's Page 28 | UserA's page 08 | user | userA |
     | A's Page 29 | UserA's page 01 | user | userA |
     | A's Page 30 | UserA's page 02 | user | userA |
     | A's Page 31 | UserA's page 01 | user | userA |
     | A's Page 32 | UserA's page 02 | user | userA |
     | A's Page 33 | UserA's page 03 | user | userA |
     | A's Page 34 | UserB's page 04 | user | userA |
     | A's Page 35 | UserA's page 05 | user | userA |
     | A's Page 36 | UserA's page 06 | user | userA |
     | A's Page 37 | UserA's page 07 | user | userA |
     | A's Page 38 | UserA's page 08 | user | userA |
     | A's Page 39 | UserA's page 01 | user | userA |
     | A's Page 40 | UserA's page 02 | user | userA |
     | A's Page 41 | UserA's page 01 | user | userA |
     | A's Page 42 | UserA's page 02 | user | userA |
     | A's Page 43 | UserA's page 03 | user | userA |
     | A's Page 44 | UserB's page 04 | user | userA |
     | A's Page 45 | UserA's page 05 | user | userA |
     | A's Page 46 | UserA's page 06 | user | userA |
     | A's Page 47 | UserA's page 07 | user | userA |
     | A's Page 48 | UserA's page 08 | user | userA |
     | A's Page 49 | UserA's page 01 | user | userA |
     | A's Page 50 | UserA's page 02 | user | userA |
     | A's Page 51 | UserA's page 01 | user | userA |
  When I follow "Portfolio"
  And I follow "A's Page 01"
  And I follow "Edit this page"
  And I follow "Share page"
  And I follow "Select all"
  And I press "Public"
  And I press "editaccess_submit"
  And I follow "Logout"
  And I log in as "userB" with password "Password1"
  And I choose "Shared with me" in "Portfolio"
  And I click on "Advanced options"
  And I click on "Select all"
  And I select "title" from "sort"
  And I press "search_submit"
  Then I should see "Results per page:"
  And I select "1" from "limit"
  And I wait until the page is ready
  And I should see "A's Page 01"
  And I should not see "A's Page 02"
  And I select "10" from "limit"
  And I wait until the page is ready
  And I should see "A's Page 10"
  And I should not see "A's Page 11"
  And I select "20" from "limit"
  And I wait until the page is ready
  And I should see "A's Page 20"
  And I should not see "A's Page 21"
  And I select "50" from "limit"
  And I wait until the page is ready
  And I should see "A's Page 50"
  And I should not see "A's Page 51"
