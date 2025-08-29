# Changelog Know Your Customer Age Verification

## Table of Contents

- **[r1.3](#r13)**
- [r1.2](#r12)
- **~~[r1.1](#r11)~~**

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for an alpha release, the delta with respect to the previous release
* for the first release-candidate, all changes since the last public release
* for subsequent release-candidate(s), only the delta to the previous release-candidate
* for a public release, the consolidated changes since the previous public release


# r1.3

## Release Notes

This public release contains the definition and documentation of
* kyc-age-verification v0.2.1


The API definition(s) are based on
* Commonalities v0.6.0 [r3.3](https://github.com/camaraproject/Commonalities/releases/tag/r3.3)
* Identity and Consent Management v0.4.0 [r3.3](https://github.com/camaraproject/IdentityAndConsentManagement/releases/tag/r3.3)


## kyc-age-verification v0.2.1

- kyc-age-verification v0.2.1 API definition **with inline documentation**:
  - OpenAPI [YAML spec file](https://github.com/camaraproject/KnowYourCustomerAgeVerification/blob/r1.3/code/API_definitions/kyc-age-verification.yaml)
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/KnowYourCustomerAgeVerification/r1.3/code/API_definitions/kyc-age-verification.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/KnowYourCustomerAgeVerification/r1.3/code/API_definitions/kyc-age-verification.yaml&nocors)

### Added
 * Create kyc-age-verification User Story by @ToshiWakayama-KDDI in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/23

### Changed
 * N/A

### Fixed
 * Alignment with Commonalities r3.3 by @ToshiWakayama-KDDI in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/25

### Removed
 * N/A

### New Contributors
 * N/A

**Full Changelog**: https://github.com/camaraproject/KnowYourCustomerAgeVerification/compare/r1.2...r1.3


# r1.2

## Release Notes

This pre-release contains the definition and documentation of
* kyc-age-verification v0.2.1-rc.2


The API definition(s) are based on
* Commonalities v0.6.0
* Identity and Consent Management v0.4.0


## kyc-age-verification v0.2.1-rc.2

**kyc-age-verification v0.2.1-rc.2 is the second release-candidate version for v0.2.1 of the CAMARA KnowYourCustomer Age Verification API**



- kyc-age-verification v0.2.1-rc.2 API definition **with inline documentation**:
  - OpenAPI [YAML spec file](https://github.com/camaraproject/KnowYourCustomerAgeVerification/blob/r1.2/code/API_definitions/kyc-age-verification.yaml)
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/KnowYourCustomerAgeVerification/r1.2/code/API_definitions/kyc-age-verification.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/KnowYourCustomerAgeVerification/r1.2/code/API_definitions/kyc-age-verification.yaml&nocors)


### Added
 * [kyc-age-verification] Add text on undocumented errors to OAS definition by @GillesInnov35 in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/10
 * [kyc-age-verification] add note to verifiedStatus description by @ToshiWakayama-KDDI in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/13
 * [kyc-age-verification] add line 13 (API description for marketing) to API readiness checklists by @hdamker-bot in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/8

### Changed
 * [kyc-age-verification] Update x-correlator format by @GillesInnov35 in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/12

### Fixed
 * Fix for YAML syntax error and other errors detected by linters by @rartych https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/18
 * Swagger UI link within CHANGELOG.md for r1.1 is not correct Issue #17 https://github.com/camaraproject/KnowYourCustomerAgeVerification/issues/17 (fixed by Release r1.2 PR)

### Removed
 * [kyc-age-verification] Remove AUTHENTICATION_REQUIRED error code by @GillesInnov35 in https://github.com/camaraproject/KnowYourCustomerAgeVerification/pull/7

### New Contributors
 * N/A

**Full Changelog**: https://github.com/camaraproject/KnowYourCustomerAgeVerification/commits/r1.2


# ~~r1.1~~

**Pre-release r1.1 has been revoked and removed in favor of the pre-release r1.2**, in order to fix a YAML syntax error.


# History of Changelog Know Your Customer Age Verification

**The repository KnowYourCustomerAgeVerification was created for kyc-age-verification v0.2.0 and the previous versions of the kyc-age-verification API were stored in the old repository KnowYourCustomer.  Please refer to the CHANGELOG.md in [the old repository KnowYourCustomer](https://github.com/camaraproject/KnowYourCustomer) for Spring25 and before.**









