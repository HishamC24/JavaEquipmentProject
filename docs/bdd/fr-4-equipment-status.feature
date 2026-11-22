Feature: FR-4 Equipment Status
  As a staff member or system user
  I want equipment to support AVAILABLE, RESERVED, CHECKED_OUT, and MAINTENANCE states
  So that item states accurately reflect the equipment lifecycle

  Scenario: Equipment supports all required status values
    Given the system defines equipment statuses "AVAILABLE", "RESERVED", "CHECKED_OUT", and "MAINTENANCE"
    When equipment records are inspected across these states
    Then each valid status is accepted and represented accurately

  Scenario: Reject invalid equipment status value
    Given equipment "EQ-101" is in status "AVAILABLE"
    When an operation attempts to set its status to "BROKEN_UNKNOWN"
    Then the operation is rejected
    And equipment "EQ-101" remains in status "AVAILABLE"