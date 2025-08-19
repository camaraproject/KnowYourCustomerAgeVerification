# KYC Age Verification API User Story

| **Item** | **Details** |
|------|---------|
|_**Summary**_ | As an application developer of an age-restricted site or application, I want to verifiy the age of an End-User with Subcriber's information held by the MNO.|
|_**Roles, Actors and Scope**_ | **Roles:** End-User <br>**Actors:** API Provider, API Consumer <br>**Scope:** Any mobile phone line (not limited to 4G, 5G)|
|_**Pre-condition**_ | The preconditions are listed below:<ol><li>The End-User has provided mandatory/optional information of its identity to API Consumer</li><li>API Consumer has onboarded to API Provider's API</li><li>API Consumer has API credentials</li><li>Privacy legal base requirement has been agreed between parties (End-User privacy)</li>|
|_**Activities/Steps**_ | **Starts when:** The API Consumer application server makes a request to the Age Verification service (API) with the age restricted value. <br>**Ends when:** The API Provider service returns **_True_** if the age has been correctly verified else it returns **_False_**.  Optionally the API Providers returns also an identityMatchScore, whether the data used has been verified, and whether a contentLock and parentalControl are in place. |
|_**Post-conditions**_ | The API Consumer can make decision to use the returned answer to follow-up its process. |
|_**Exceptions**_ | Several exceptions might occur during the KYC Age Verification API operations: <ul><li>Unauthorized: Not valid credentials (e.g. use of already expired access token).</li><li>Not Found: The phone number provided is not managed by the API Provider. </li><li>Invalid input: Not all mandatory input data to invoke operation (e.g. phone number).</li>|
