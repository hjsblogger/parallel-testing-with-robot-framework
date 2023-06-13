*** Settings ***

Resource  	../../Resources/PageObject/KeyDefs/Common.robot
Variables 	../../Resources/PageObject/Locators/Locators.py

Test Teardown  Common.Close local test browser

Library    BuiltIn

*** Variables ***

${site_url}  		https://lambdatest.github.io/sample-todo-app/

*** Comments ***
# Configuration for first test scenario

*** Variables ***

&{lt_options_1}
    ...  browserName=Chrome

${BROWSER_1}	  	  ${lt_options_1['browserName']}

*** Comments ***
# Configuration for second test scenario

*** Variables ***

&{lt_options_2}
    ...  browserName=Safari

${BROWSER_2}	  	  ${lt_options_2['browserName']}

*** Test Cases ***

Example 1: [ToDo] Parallel Testing with Robot framework
	[tags]  ToDo App Automation - 1
	[Timeout]   ${TIMEOUT}
	Open local test browser	${site_url}		${BROWSER_1}
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
	Open local test browser	${site_url}		${BROWSER_2}
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
