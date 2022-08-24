*** Settings ***
Library  SeleniumLibrary
Library  ../Common/LambdaTestStatus.py

*** Variables ***
${REMOTE_URL}       http://%{LT_USERNAME}:%{LT_ACCESS_KEY}@hub.lambdatest.com/wd/hub
${TIMEOUT}          3000

*** Keywords ***
Open test browser
    [Arguments]     ${TEST_URL}     ${BROWSER}      ${CAPABILITIES}
    [Timeout]       ${TIMEOUT}
    Open browser    ${TEST_URL}     ${BROWSER}
    ...  remote_url=${REMOTE_URL}
    ...  desired_capabilities=${CAPABILITIES}

Close test browser
    Run keyword if  '${REMOTE_URL}' != ''
    ...  report lambdatest status
    ...  ${TEST_NAME}
    ...  ${TEST_STATUS}
    Close Browser
