*** Settings ***
Library        RequestsLibrary

*** Test Cases ***
TC-001 Verify when wrong username or password, API should return error
    # call API with wrong username / password
    Create Session    loginSession    http://localhost:8082
    ${requests_body}=    Create Dictionary    username=doppio22    password=weBuildBestQa
    ${resp}=    POST On Session    loginSession    /login    json=${requests_body}    expected_status=401   
    Log To Console    ${resp.json()}     
    # verify status code is 401
    # verify status message is error
    # verify error message is invalid username or password