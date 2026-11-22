Feature: FR-1 User and Role Support
  As a system user
  I want the system to distinguish among Student, Faculty, and Staff/Administrator roles
  So that appropriate permissions and business rules apply to my account

  Scenario: Student role grants standard reservation permissions
    Given a user has the "STUDENT" role
    When the user accesses the equipment reservation system
    Then student-permitted operations are available
    And staff-only equipment administration operations are restricted

  Scenario: Faculty role is distinguished from Student role
    Given a user has the "FACULTY" role
    When the user accesses the equipment reservation system
    Then the system identifies the user as "FACULTY" rather than "STUDENT"
    And faculty-specific business rules apply

  Scenario: Staff/Administrator role grants equipment management and checkout/return access
    Given a user has the "STAFF" role
    When the user accesses the equipment reservation system
    Then staff operations for managing equipment and processing checkouts/returns are permitted