Feature: FR-3 Equipment Information
  As a campus user or staff member
  I want each piece of equipment to maintain its identifier, name, type, status, and availability
  So that equipment records remain complete and accurate across the system

  Scenario: Retrieve complete equipment record fields
    Given equipment exists with ID "EQ-101", name "Canon EOS R7", type "Camera", status "AVAILABLE", and availability true
    When equipment "EQ-101" is retrieved
    Then the record contains ID "EQ-101"
    And the record contains name "Canon EOS R7"
    And the record contains type "Camera"
    And the record contains status "AVAILABLE"
    And the record reflects availability as true

  Scenario: Requesting a non-existent equipment identifier
    Given no equipment exists with ID "EQ-999"
    When equipment "EQ-999" is requested
    Then the system rejects the lookup with a not-found error
    And existing equipment records remain unchanged