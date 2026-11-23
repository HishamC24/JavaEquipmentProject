Feature: Reservation Limits
  As a student
  I want the system to enforce reservation limits
  So that equipment is distributed fairly among users

  Scenario: Reservation within allowed limit
    Given a student has fewer active reservations than the allowed maximum
    And equipment 104 is available
    When the student attempts to reserve equipment 104
    Then the system creates the reservation
    And updates the student's active reservation count
    And changes the equipment status to RESERVED

  Scenario: Reservation limit exceeded
    Given a student has reached the maximum number of active reservations
    And equipment 105 is available
    When the student attempts to reserve equipment 105
    Then the system rejects the reservation
    And displays a message stating that the reservation limit has been reached
    And the equipment status remains AVAILABLE

  Scenario: Reservation and checkout limit exceeded
    Given a student has reached the maximum combined number of active reservations and checkouts
    And equipment 106 is available
    When the student attempts to reserve equipment 106
    Then the system rejects the reservation
    And displays a message stating that the reservation and checkout limit has been reached
    And the equipment status remains AVAILABLE
