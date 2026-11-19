# Changelog KnowYourCustomerAgeVerification

<!-- TOC:START -->
## Table of Contents
- [r2.2](#r22)
- [r2.1](#r21)
<!-- TOC:END -->

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for an alpha release, the delta with respect to the previous release
* for the first release-candidate, all changes since the last public release
* for subsequent release-candidate(s), only the delta to the previous release-candidate
* for a public release, the consolidated changes since the previous public release

# r2.2

## Release Notes

This release candidate contains the definition and documentation of
* kyc-age-verification 0.3.0-rc.2

The API definition(s) are based on
* Commonalities r4.4 (0.9.0)
* Identity and Consent Management r4.2 (0.5.0)

## kyc-age-verification 0.3.0-rc.2

**kyc-age-verification 0.3.0-rc.2 is a release-candidate version of this API.**

Changes documented below are compared to version 0.3.0-rc.1.

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/KnowYourCustomerAgeVerification/r2.2/code/API_definitions/kyc-age-verification.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/KnowYourCustomerAgeVerification/r2.2/code/API_definitions/kyc-age-verification.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/KnowYourCustomerAgeVerification/blob/r2.2/code/API_definitions/kyc-age-verification.yaml)

### Breaking changes

* N/A

### Added

* Documented the `429 TOO_MANY_REQUESTS` error response by @GillesInnov35 in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/59
* Added test scenarios for `400 INVALID_ARGUMENT` (request body not compliant with the schema, missing required property, invalid `x-correlator`), `403 PERMISSION_DENIED` and `429 TOO_MANY_REQUESTS` by @GillesInnov35 in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/66
* Added test scenarios `03b_identity_mismatch` and `400.08_out_of_range_provider_range` by @albertoramosmonagas in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/81
* Added test scenario `06` to check that neither of `contentLock` / `parentalControl` is returned when the request flags are absent or false by @albertoramosmonagas in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/86.

### Changed

* Replaced "CSP" and "MNO" with "network operator" in the API description by @GillesInnov35 in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/59
* Clarified in the API description what the response contains when `ageCheck` is `not_available`: `verifiedStatus` and `identityMatchScore` are not returned, while `contentLock` and `parentalControl` may still be returned because they are evaluated independently by @ToshiWakayama-KDDI in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/62
* Aligned with Commonalities r4.4: error responses use the Commonalities response and example definitions (status and error codes unchanged, example messages reworded), and test definitions follow the r4.4 templates (renamed scenario tags, operation `verifyAge`) by @GillesInnov35 in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/66
* Clarified the API provider behaviour in the API description as listed below by @albertoramosmonagas in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/81
  - Identity mismatch: `ageCheck` always refers to the contract holder; a mismatch of the optional identity attribute is only reflected in `identityMatchScore` (new `Note3`)
  - Outcomes: the Errors section states when `404 IDENTIFIER_NOT_FOUND`, `422 SERVICE_NOT_APPLICABLE`, and `200` with `ageCheck: not_available` apply.
  - ageThreshold: a value outside the scheme range, or outside the range agreed at onboarding, returns `400 OUT_OF_RANGE`
  - Examples: for `familyNameAtBirth: YYYY`, YYYY was replaced by a realistic value.
* Replaced the terms related to the contract holder such as subscriber, user, contract owner, and so on, with “contract holder” as the single term for the subject of `ageCheck` in `info.description`, the `POST /verify` description and the `AgeCheck` schema, consistent with `Note3` by @albertoramosmonagas in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/86

### Fixed

* Corrected the expired access token test scenario so that it only expects the error code `UNAUTHENTICATED` by @GillesInnov35 in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/59
* Fixed defects in the test definition as below by @GillesInnov35 in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/74:
  - Modify scenario `03` that `verifiedStatus` and `identityMatchScore` are not returned.
  - Add a precondition to scenarios `04` and `05` that the API Provider implements the functionality.
  - Several minor items.
* Fixed a formatting typo by adding a blank line directly after the `BEGIN` markers of the `authorization-and-authentication` and `request-body-strictness` in the API description by @GillesInnov35 in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/74
* Fixed description of 400 error, description of 403 error, and an email address example by @ToshiWakayama-KDDI in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/79
* Fixed test scenarios `04` and `05` to check that the requested property (`contentLock` / `parentalControl`) is returned by @albertoramosmonagas in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/86

### Removed

* N/A

**Full Changelog**: https://github.com/camaraproject/KnowYourCustomerAgeVerification/compare/r2.1...r2.2

# r2.1

## Release Notes

This release candidate contains the definition and documentation of
* kyc-age-verification 0.3.0-rc.1

The API definition(s) are based on
* Commonalities 0.8.0
* Identity and Consent Management 0.5.0

## kyc-age-verification 0.3.0-rc.1

**kyc-age-verification 0.3.0-rc.1 is a release-candidate version of this API.**

Changes documented below are compared to version 0.2.1.

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/KnowYourCustomerAgeVerification/r2.1/code/API_definitions/kyc-age-verification.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/KnowYourCustomerAgeVerification/r2.1/code/API_definitions/kyc-age-verification.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/KnowYourCustomerAgeVerification/blob/r2.1/code/API_definitions/kyc-age-verification.yaml)

### Breaking changes

* N/A

### Added

* N/A

### Changed

* Enhance KYC age verification documentation by @GillesInnov35 in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/48
* Commonalities alignment and fix validation warnings by @GillesInnov35 in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/47

### Fixed

* Align_language_when_phoneNumber_required by @ToshiWakayama-KDDI in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/42

### Removed

* Delete kyc-age-verification-API-Readiness-Checklist.md by @GillesInnov35 in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/50

**Full Changelog**: https://github.com/camaraproject/KnowYourCustomerAgeVerification/compare/r1.3...r2.1

