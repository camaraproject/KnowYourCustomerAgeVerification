Feature: CAMARA KYC Age Verification API, vwip - Operation verifyAge
  # Input to be provided by the implementation to the tester
  #
  # Implementation indications:
  #
  # Testing assets:
  # * A mobile line identified by its phone number "phoneNumber"
  #
  # References to OAS spec schemas refer to schemas specifies in kyc-age-verification.yaml, version vwip

  Background: Common verifyAge setup
    Given an environment at "apiRoot"
    And the resource "/kyc-age-verification/vwip/verify"
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" complies with the schema at "#/components/schemas/XCorrelator"
    And the request body is set by default to a request body compliant with the schema

  # Happy path scenarios

  @verifyAge_1_verify_age_true
  Scenario Outline: Validate successful response when ageCheck is true
    Given a valid testing phone number supported by the service, identified by the access token or provided in the request body
    And the request body property "$.ageThreshold" is set to a valid value compliant with the OAS schema at "#/components/schemas/AgeThreshold"
    And the age information associated with the mobile subscription is equal or greater that the age threshold provided
    And the request body optionally contains the property "<request_body_property>" with a value compliant with OAS schema at "<oas_spec_schema>"
    When the request "verifyAge" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/VerifyResponseBody"
    And the response property "$.ageCheck" is "true"
    And if the response contains property "$.verifiedStatus", the value is one of [true, false]
    And if the response contains property "$.identityMatchScore", the value is compliant with OAS schema at "#/components/schemas/IdentityMatchScore"

    Examples:
      | request_body_property | oas_spec_schema                       |
      | $.idDocument          | /components/schemas/IdDocument        |
      | $.name                | /components/schemas/Name              |
      | $.givenName           | /components/schemas/GivenName         |
      | $.familyName          | /components/schemas/FamilyName        |
      | $.middleNames         | /components/schemas/MiddleNames       |
      | $.familyNameAtBirth   | /components/schemas/FamilyNameAtBirth |
      | $.birthdate           | /components/schemas/Birthdate         |
      | $.email               | /components/schemas/Email             |

  @verifyAge_2_verify_age_false
  Scenario Outline: Validate successful response when ageCheck is false
    Given a valid testing phone number supported by the service, identified by the access token or provided in the request body
    And the request body property "$.ageThreshold" is set to a valid value compliant with the OAS schema at "#/components/schemas/AgeThreshold"
    And the age information associated with the mobile subscription is lower that the age threshold provided
    And the request body optionally contains the property "<request_body_property>" with a value compliant with OAS schema at "<oas_spec_schema>"
    When the request "verifyAge" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/VerifyResponseBody"
    And the response property "$.ageCheck" is "false"
    And if the response contains property "$.verifiedStatus", the value is one of [true, false]
    And if the response contains property "$.identityMatchScore", the value is compliant with OAS schema at "#/components/schemas/IdentityMatchScore"

    Examples:
      | request_body_property | oas_spec_schema                       |
      | $.idDocument          | /components/schemas/IdDocument        |
      | $.name                | /components/schemas/Name              |
      | $.givenName           | /components/schemas/GivenName         |
      | $.familyName          | /components/schemas/FamilyName        |
      | $.middleNames         | /components/schemas/MiddleNames       |
      | $.familyNameAtBirth   | /components/schemas/FamilyNameAtBirth |
      | $.birthdate           | /components/schemas/Birthdate         |
      | $.email               | /components/schemas/Email             |

  @verifyAge_3_verify_age_not_available
  Scenario Outline: Validate successful response when ageCheck is not available
    Given a valid testing phone number supported by the service, identified by the access token or provided in the request body
    And the request body property "$.ageThreshold" is set to a valid value compliant with the OAS schema at "#/components/schemas/AgeThreshold"
    And the API Provider cannot verify the age information
    And the request body optionally contains the property "<request_body_property>" with a value compliant with OAS schema at "<oas_spec_schema>"
    When the request "verifyAge" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/VerifyResponseBody"
    And the response property "$.ageCheck" is "not_available"
    And if the response contains property "$.verifiedStatus", the value is one of [true, false]
    And if the response contains property "$.identityMatchScore", the value is compliant with OAS schema at "#/components/schemas/IdentityMatchScore"

    Examples:
      | request_body_property | oas_spec_schema                       |
      | $.idDocument          | /components/schemas/IdDocument        |
      | $.name                | /components/schemas/Name              |
      | $.givenName           | /components/schemas/GivenName         |
      | $.familyName          | /components/schemas/FamilyName        |
      | $.middleNames         | /components/schemas/MiddleNames       |
      | $.familyNameAtBirth   | /components/schemas/FamilyNameAtBirth |
      | $.birthdate           | /components/schemas/Birthdate         |
      | $.email               | /components/schemas/Email             |

  @verifyAge_4_verify_age_contentLock
  Scenario: Validate successful response when contentLock is requested
    Given a valid testing phone number supported by the service, identified by the access token or provided in the request body
    And the request body property "$.ageThreshold" is set to a valid value compliant with the OAS schema at "#/components/schemas/AgeThreshold"
    And the request body property "$.includeContentLock" is set to true
    When the request "verifyAge" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/VerifyResponseBody"
    And the response contains property "$.ageCheck" whose value is one of ["true", "false", "not_available"]
    And the response contains property "$.contentLock" whose value is one of ["true", "false", "not_available"]

  @verifyAge_5_verify_age_parentalControl
  Scenario: Validate successful response when parentalControl is requested
    Given a valid testing phone number supported by the service, identified by the access token or provided in the request body
    And the request body property "$.ageThreshold" is set to a valid value compliant with the OAS schema at "#/components/schemas/AgeThreshold"
    And the request body property "$.includeParentalControl" is set to true
    When the request "verifyAge" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/VerifyResponseBody"
    And the response contains property "$.ageCheck" whose value is one of ["true", "false", "not_available"]
    And the response contains property "$.parentalControl" whose value is one of ["true", "false", "not_available"]

   # Generic 400 errors

  @kyc-age-verification_verifyAge_400.01_schema_not_compliant
  Scenario: Invalid Argument. Generic Syntax Exception
    Given the request body is included but is not compliant with the schema at "#/components/schemas/VerifyRequestBody"
    When the request "verifyAge" is sent
    Then the response status code is 400
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @kyc-age-verification_verifyAge_400.02_no_request_body
  Scenario: Missing request body
    Given the request body is not included
    When the request "verifyAge" is sent
    Then the response status code is 400
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @kyc-age-verification_verifyAge_400.03_empty_request_body
  # 3-legged scenario only. It happens when request body has at least one required property
  # NOTE: Recommended value for "$.message" (NOT NORMATIVE) is "Missing mandatory parameter(s)"
  Scenario: Empty object as request body
    Given the request body is set to {}
    When the request "verifyAge" is sent
    Then the response status code is 400
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

# applicable to properties in the request body which are of type object, and have required properties or minProperties in their value
  @kyc-age-verification_verifyAge_400.04_empty_property
  Scenario Outline: Error response for empty property in request body
    Given the request body property "<required_property>" is set to {}
    When the request "verifyAge" is sent
    Then the response status code is 400
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

    Examples:
      | required_property |
      | $.ageThreshold    |

  @kyc-age-verification_verifyAge_400.05_missing_required_property
  Scenario Outline: Error response for missing required property in request body
    Given the request body property "<required_property>" is not included
    When the request "verifyAge" is sent
    Then the response status code is 400
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

    Examples:
      | required_property |
      | $.ageThreshold    |

  @kyc-age-verification_verifyAge_400.06_invalid_x-correlator
  Scenario: Invalid x-correlator header
    Given the header "x-correlator" does not comply with the schema at "#/components/schemas/XCorrelator"
    When the request "verifyAge" is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

  @kyc-age-verification_verifyAge_400.07_out_of_range
  Scenario: Error when ageThreshold is out of range
    Given the request body property "$.ageThreshold" is set to a value that is not withing the range defined in OAS schema "#/components/schemas/AgeThreshold"
    When the request "verifyAge" is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "OUT_OF_RANGE"
    And the response property "$.message" contains a user friendly text

  # Service Error scenarios

  ## Authentication/Authorization errors

    # Generic 401 errors

  @kyc-age-verification_verifyAge_401.01_no_authorization_header
  Scenario: Error response for no header "Authorization"
    Given the header "Authorization" is not sent
    When the request "verifyAge" is sent
    Then the response status code is 401
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @kyc-age-verification_verifyAge_401.02_expired_access_token
  Scenario: Error response for expired access token
    Given the header "Authorization" is set to an expired access token
    When the request "verifyAge" is sent
    Then the response status code is 401
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @kyc-age-verification_verifyAge_401.03_invalid_access_token
  Scenario: Error response for invalid access token
    Given the header "Authorization" is set to an invalid access token
    When the request "verifyAge" is sent
    Then the response status code is 401
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  # Generic 403 errors

  @kyc-age-verification_verifyAge_403.01_missing_access_token_scope
  Scenario: Missing access token scope
    Given the header "Authorization" is set to an access token that does not include scope "kyc-age-verification:verify"
    When the request "verifyAge" is sent
    Then the response status code is 403
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 403
    And the response property "$.code" is "PERMISSION_DENIED"
    And the response property "$.message" contains a user friendly text

  @kyc-age-verification_verifyAge_403.02_api_client_token_mismatch
  Scenario: "/verify" not created by the API client given in the access token
    # To test this, a token has to be obtained for a different client
    Given the header "Authorization" is set to a valid access token emitted to an API client which did not have rights to access/manage the "/verify"
    When the request "verifyAge" is sent
    Then the response status code is 403
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 403
    And the response property "$.code" is "PERMISSION_DENIED"
    And the response property "$.message" contains a user friendly text

  # Generic 429 scenarios

  @kyc-age-verification_verifyAge_429.01_Too_Many_Requests
  #To test this scenario environment has to be configured to reject requests reaching the threshold limit set.
  Scenario: Request is rejected due to threshold policy
    Given a valid request for "verifyAge"
    And the header "Authorization" is set to a valid access token
    And the threshold of requests has been reached
    When the request "verifyAge" is sent
    Then the response status code is 429
    And the response property "$.status" is 429
    And the response property "$.code" is "TOO_MANY_REQUESTS"
    And the response property "$.message" contains a user friendly text

    # Error scenarios for management of input parameter phoneNumber

  @kyc-age-verification_C02.01_phone_number_not_schema_compliant
  Scenario: Phone number value does not comply with the schema
    Given the header "Authorization" is set to a valid access token which does not identify a single phone number
    And the request body property "$.phoneNumber" does not comply with the OAS schema at "#/components/schemas/PhoneNumber"
    When the request "verifyAge" is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text

# Typically with a 2-legged access token
  @kyc-age-verification_C02.02_phone_number_not_found
  Scenario: Phone number not found
    Given the header "Authorization" is set to a valid access token which does not identify a single phone number
    And the request body property "$.phoneNumber" is compliant with the schema but does not identify a valid phone number
    When the request "verifyAge" is sent
    Then the response status code is 404
    And the response property "$.status" is 404
    And the response property "$.code" is "IDENTIFIER_NOT_FOUND"
    And the response property "$.message" contains a user friendly text

# Only with a 3-legged access token
  @kyc-age-verification_C02.03_unnecessary_phone_number
  Scenario: Phone number not to be included when it can be deduced from the access token
    Given the header "Authorization" is set to a valid access token identifying a phone number
    And  the request body property "$.phoneNumber" is set to a valid phone number
    When the request "verifyAge" is sent
    Then the response status code is 422
    And the response property "$.status" is 422
    And the response property "$.code" is "UNNECESSARY_IDENTIFIER"
    And the response property "$.message" contains a user friendly text

  @kyc-age-verification_C02.04_missing_phone_number
  Scenario: Phone number not included and cannot be deduced from the access token
    Given the header "Authorization" is set to a valid access token which does not identify a single phone number
    And the request body property "$.phoneNumber" is not included
    When the request "verifyAge" is sent
    Then the response status code is 422
    And the response property "$.status" is 422
    And the response property "$.code" is "MISSING_IDENTIFIER"
    And the response property "$.message" contains a user friendly text

    # When the service is only offered to certain type of subscriptions, e.g. IoT, , B2C, etc
  @kyc-age-verification_C02.05_phone_number_not_supported
  Scenario: Service not available for the phone number
    Given that the service is not available for all phone numbers commercialized by the operator
    And a valid phone number, identified by the token or provided in the request body, for which the service is not applicable
    When the request "verifyAge" is sent
    Then the response status code is 422
    And the response property "$.status" is 422
    And the response property "$.code" is "SERVICE_NOT_APPLICABLE"
    And the response property "$.message" contains a user friendly text
