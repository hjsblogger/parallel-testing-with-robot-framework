*** Settings ***
Library  SeleniumLibrary

# Changed after a discussion with PM
*** Keywords ***

capture and report exception
    [Arguments]    ${exception_message}
    ${formatted_message}=    Set Variable    ${exception_message}
    Log Many    ${formatted_message}    console=True
    # Documentation - https://www.lambdatest.com/support/docs/lambda-exceptions/
    # Execute JavaScript - https://robotframework.org/SeleniumLibrary/
    # SeleniumLibrary-5.0.0b1.html#Execute%20Javascript
    Execute JavaScript    lambda-exceptions(arguments[0]);    ARGUMENTS     ${formatted_message}     