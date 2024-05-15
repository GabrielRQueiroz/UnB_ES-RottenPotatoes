Feature: User can manually add movie

Scenario: Add a Movie
   Given I am on the RottenPotatoes home page
   When I follow "Add a new movie"
   Then I should be on the Create New Movie page
   When I fill in "Title" with "Men In Black"
   And I select "PG-13" from "Rating"
   And I press "Save Changes"
   Then I should be on the "Men In Black" details page
   When I follow "Back to movie list"
   Then I should be on the RottenPotatoes home page
   And I should see "Men In Black"