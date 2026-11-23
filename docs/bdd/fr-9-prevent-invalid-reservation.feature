Feature: Prevent Invalid Reservation
  As a student
  I want the system to prevent invalid reservations
  So that I cannot reserve unavailable equipment

  Scenario: Attempt to reserve already reserved equipment
    Given equipment 101 is already reserved
    When a student attempts to reserve equipment 101
    Then the system rejects the reservation
    And displays an error message stating that the equipment is unavailable
    And the equipment status remains RESERVED

  Scenario: Attempt to reserve equipment under maintenance
    Given equipment 102 is under maintenance
    When a student attempts to reserve equipment 102
    Then the system rejects the reservation
    And displays an error message stating that the equipment is unavailable
    And the equipment status remains MAINTENANCE

  Scenario: Attempt to reserve checked-out equipment
    Given equipment 103 is already checked out
    When a student attempts to reserve equipment 103
    Then the system rejects the reservation
    And displays an error message stating that the equipment is unavailable
    And the equipment status remains CHECKED_OUT
