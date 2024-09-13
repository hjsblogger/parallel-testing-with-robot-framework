*** Settings ***

Resource  	../../Resources/PageObject/KeyDefs/Common.robot
Resource  	../../Resources/PageObject/KeyDefs/SeleniumDrivers.robot
Variables 	../../Resources/PageObject/Locators/Locators.py

Library     SeleniumLibrary
Library     OperatingSystem
Library     BuiltIn
Resource	../../Resources/PageObject/Common/ExceptionHandler.robot

# Test Teardown  Common.Close test browser

*** Variables ***

${site_url}  		https://lambdatest.github.io/sample-todo-app/

${EXEC_PLATFORM}  %{EXEC_PLATFORM}

*** Keywords ***
Capture Exception A Report
    [Arguments]    ${exception_message}
    ${formatted_message}=    Set Variable    ${exception_message}
    Log Many    ${formatted_message}    console=True
    Execute JavaScript    lambda-exceptions(arguments[0]);    ARGUMENTS     ${formatted_message}

*** Comments ***
# Configuration for first test scenario

*** Variables ***

&{lt_options_1}
    ...  browserName=Chrome
    ...  platformName=Windows 11
    ...  browserVersion=latest-1
    ...  visual=true
    ...  console=true
    ...	 w3c=true
    ...	 geoLocation=US
    ...  name=[ToDoApp - 1] Parallel Testing with Robot framework
    ...  build=[ToDoApp Demo - 1] Parallel Testing with Robot framework
    ...  project=[ToDoApp Project - 1] Parallel Testing with Robot framework

${BROWSER_1}	      ${lt_options_1['browserName']}
&{CAPABILITIES_1}     LT:Options=&{lt_options_1}

*** Keywords ***

Test Teardown
	IF  '${EXEC_PLATFORM}' == 'local'
        Log To Console	Closing the browser on local machine
        Common.Close local test browser
    ELSE IF 	'${EXEC_PLATFORM}' == 'cloud'
        Log To Console	Closing the browser on cloud grid
		Common.Close test browser
    END

*** Comments ***
# Configuration for second test scenario

*** Variables ***

&{lt_options_2}
    ...  browserName=Chrome
    ...  platformName=MacOS Ventura
    ...  browserVersion=latest
    ...  visual=true
    ...  console=true
    ...	 w3c=true
    ...	 geoLocation=US
    ...  name=[ToDoApp - 2] Parallel Testing with Robot framework
    ...  build=[ToDoApp Demo - 2] Parallel Testing with Robot framework
    ...  project=[ToDoApp Project - 2] Parallel Testing with Robot framework

${BROWSER_2}	      ${lt_options_2['browserName']}
&{CAPABILITIES_2}     LT:Options=&{lt_options_2}

&{lt_options_3}
    ...  browserName=Chrome
    ...  platformName=Windows 11
    ...  browserVersion=latest-1
    ...  visual=true
    ...  console=true
    ...	 w3c=true
    ...	 geoLocation=US
    ...  name=[ToDoApp Exception] Exception: Parallel Testing with Robot framework
    ...  build=[ToDoApp Exception] Exception: Parallel Testing with Robot framework
    ...  project=[ToDoApp Exception] PException: Parallel Testing with Robot framework

${BROWSER_3}	      ${lt_options_3['browserName']}
&{CAPABILITIES_3}     LT:Options=&{lt_options_3}

*** Test Cases ***

Example 1: [ToDo] Parallel Testing with Robot framework
	[tags]  ToDo App Automation - 1
	[Timeout]   ${TIMEOUT}
	# Before the introduction of Selenium Manager
	# Open test browser	${site_url}		${BROWSER_1}		${CAPABILITIES_1}

	# After the introduction of Selenium Manager
	Open test browser	${site_url}		${BROWSER_1}		${lt_options_1}

	Maximize Browser Window
	Sleep  3s
	Page should contain element  ${FirstItem}
	Page should contain element  ${SecondItem}

	Click button  ${FirstItem}	
	Click button  ${SecondItem}	
		
	Input text  ${ToDoText}  ${NewItemText}
	Click button  ${AddButton}
	${response}    Get Text    ${NewAdditionText}
	Should Be Equal As Strings    ${response}    ${NewItemText}
	Sleep  5s
        Log    Completed - Example 1: [ToDo] Parallel Testing with Robot framework

	[Teardown]  Test Teardown

Example 2: [ToDo] Parallel Testing with Robot framework
	[tags]  ToDo App Automation - 2
	[Timeout]   ${TIMEOUT}
	# Before the introduction of Selenium Manager
	# Open test browser	${site_url}		${BROWSER_2}		${CAPABILITIES_2}

	# After the introduction of Selenium Manager
	Open test browser	${site_url}		${BROWSER_2}		${lt_options_2}
	Maximize Browser Window
	Sleep  3s
	Page should contain element  ${FirstItem}
	Page should contain element  ${SecondItem}
	Page should contain element  ${FifthItem}

	Click button  ${FirstItem}	
	Click button  ${SecondItem}
	Click button  ${FifthItem}	
		
	Input text  ${ToDoText}  ${NewItemText}
	Click button  ${AddButton}
	${response}    Get Text    ${NewAdditionText}
	Should Be Equal As Strings    ${response}    ${NewItemText}
	Sleep  5s
        Log    Completed - Example 2: [ToDo] Parallel Testing with Robot framework

	[Teardown]  Test Teardown

Example 3: [ToDo] Exception Handling in Robot Framework
	[tags]  ToDo App Automation - 3
	[Timeout]   ${TIMEOUT}
	Open test browser	${site_url}		${BROWSER_3}		${lt_options_3}

	Maximize Browser Window
	Sleep  3s
	Page should contain element  ${FirstItem}
	Page should contain element  ${SecondItem}

	Click button  ${FirstItem}	
	Click button  ${SecondItem}

	${result}=    Run Keyword And Ignore Error	Page should contain element  ${ToDoTextError}
	# Only for debugging, can be removed in prod
	Log		${result[0]}		console=true
	Log		${result[1]}		console=true
	
	IF    '${result[0]}' == 'FAIL'
		${test_status}=    Set Variable    FAIL
		# This error is sufficient for the end user since it mentions the issue in gist
		# Missing locator, element not clickable, etc.
		${exception_array}=   Create List    ${result[1]}
		capture and report exception		 ${exception_array}
	
		# Used global variable, defined in Locators.py
		${status}=  ${test_status}
		${status}=    Set Variable If    '${result[0]}' == FAIL    ${test_status}
		Log    ${status}	console=true
	ELSE
		Input text  ${ToDoText}  ${NewItemText}
		Click button  ${AddButton}
		${response}    Get Text    ${NewAdditionText}
		Should Be Equal As Strings    ${response}    ${NewItemText}
	END
	
	Sleep  5s
    Log    Completed - Example 3: [ToDo] Parallel Testing with Robot framework

	[Teardown]  Test Teardown