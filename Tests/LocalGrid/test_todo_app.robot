*** Settings ***

Resource  	../../Resources/PageObject/KeyDefs/Common.robot
Resource  	../../Resources/PageObject/KeyDefs/SeleniumDrivers.robot
Variables 	../../Resources/PageObject/Locators/Locators.py

# Test Teardown  Common.Close local test browser

Library     SeleniumLibrary
Library     OperatingSystem
Library     BuiltIn

*** Variables ***

${site_url}  		https://lambdatest.github.io/sample-todo-app/

*** Comments ***
# Configuration for first test scenario

*** Variables ***

${EXEC_PLATFORM}  %{EXEC_PLATFORM}

&{lt_options_1}
    ...  browserName=Chrome

${BROWSER_1}	  	  ${lt_options_1['browserName']}

*** Comments ***
# Configuration for second test scenario

*** Variables ***

&{lt_options_2}
    ...  browserName=Edge

${BROWSER_2}	  	  ${lt_options_2['browserName']}

&{lt_options_3}
    ...  browserName=Firefox

${BROWSER_3}	  	  ${lt_options_3['browserName']}

*** Keywords ***
Test Teardown
	IF  '${EXEC_PLATFORM}' == 'local'
        Log To Console	Closing the browser on local machine
        Common.Close local test browser
    ELSE IF 	'${EXEC_PLATFORM}' == 'cloud'
        Log To Console	Closing the browser on cloud grid
		Common.Close test browser
    END

*** Test Cases ***

Example 1: [ToDo] Parallel Testing with Robot framework
	[tags]  ToDo App Automation - 1
	[Timeout]   ${TIMEOUT}
	${chrome_driver_path}=    Update Chrome Webdriver
	# Open Browser    ${site_url}    chrome    executable_path=${chrome_driver_path}
	Open local test browser 	${site_url}		${BROWSER_1}	${chrome_driver_path}
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

Example 2: [ToDo] Parallel Testing with Robot framework
	[tags]  ToDo App Automation - 2
	[Timeout]   ${TIMEOUT}
	${edge_driver_path}=   Update Edge Webdriver
    # Open Browser    ${site_url}    edge	executable_path=${edge_driver_path}
	Open local test browser 	${site_url}		${BROWSER_2}	${edge_driver_path}
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

Example 3: [ToDo] Parallel Testing with Robot framework
	[tags]  ToDo App Automation - 2
	[Timeout]   ${TIMEOUT}
	${firefox_driver_path}=   Update Firefox Webdriver
    # Open Browser    ${site_url}    firefox	executable_path=${firefox_driver_path}
	Open local test browser 	${site_url}		${BROWSER_3}	${firefox_driver_path}
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