Feature: FR-2 View User Activity
  As a student or faculty member
  I want to view my current reservations and active checkouts
  So that I can track the equipment I have reserved or currently hold

  Scenario: View current reservations and active checkouts
    Given a user has 1 active reservation for equipment "EQ-101"
    And the user has 1 active checkout for equipment "EQ-204"
    When the user requests their current activity
    Then the response includes the active reservation for "EQ-101"
    And the response includes the active checkout for "EQ-204"

  Scenario: View user activity when none exist
    Given a user has no current reservations and no active checkouts
    When the user requests their current activity
    Then the response returns an empty set of reservations and active checkouts

  Scenario: Completed returns are excluded from active checkouts
    Given a user previously checked out equipment "EQ-305"
    And equipment "EQ-305" has already been returned
    When the user requests their active checkouts
    Then equipment "EQ-305" is not listed as an active checkout