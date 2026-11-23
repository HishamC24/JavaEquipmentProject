Feature: Checkout Equipment
  As a staff member
  I want to check out equipment to eligible university users
  So that students and faculty can borrow equipment

  Scenario: Successful equipment checkout
    Given equipment 110 is eligible for checkout
    And a student is eligible to borrow equipment
    And an authorized staff member is processing the checkout
    When the staff member checks out equipment 110 to the student
    Then the system creates a checkout record
    And records the checkout date and due date
    And changes the equipment status to CHECKED_OUT
    And generates a checkout notification

  Scenario: Attempt to check out unavailable equipment
    Given equipment 111 is already checked out
    And an authorized staff member is processing a checkout
    When the staff member attempts to check out equipment 111 to another student
    Then the system rejects the checkout
    And displays an error message stating that the equipment is unavailable
    And the equipment status remains CHECKED_OUT

  Scenario: Unauthorized user attempts to check out equipment
    Given equipment 112 is available
    And a student does not have staff authorization
    When the student attempts to process a checkout for equipment 112
    Then the system rejects the checkout
    And displays an error message stating that the user is not authorized
    And the equipment status remains AVAILABLE
