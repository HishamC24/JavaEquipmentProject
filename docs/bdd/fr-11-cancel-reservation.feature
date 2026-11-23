Feature: Cancel Reservation
  As a student
  I want to cancel an existing reservation
  So that equipment I no longer need becomes available to others

  Scenario: Successfully cancel a reservation
    Given a student has an active reservation for equipment 107
    And the reservation is eligible for cancellation
    When the student cancels the reservation
    Then the system marks the reservation as canceled
    And updates the equipment status to AVAILABLE
    And displays a confirmation message

  Scenario: Attempt to cancel another user's reservation
    Given a reservation for equipment 108 belongs to another student
    When a student attempts to cancel that reservation
    Then the system rejects the cancellation
    And displays an error message
    And the reservation remains active

  Scenario: Attempt to cancel an ineligible reservation
    Given a student has a reservation for equipment 109
    And the reservation is no longer eligible for cancellation
    When the student attempts to cancel the reservation
    Then the system rejects the cancellation
    And displays an error message stating that the reservation cannot be canceled
    And the reservation status remains unchanged
