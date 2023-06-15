*** Settings ***

Resource  	../../Resources/PageObject/KeyDefs/Common.robot
Variables 	../../Resources/PageObject/Locators/Locators.py

Test Teardown  Common.Close test browser

*** Variables ***

${site_url}  		https://lambdatest.github.io/sample-todo-app/

*** Comments ***
# Configuration for first test scenario

*** Variables ***

&{lt_options_1}
    ...  browserName=Chrome
    ...  platformName=Windows 11
    ...  browserVersion=latest
    ...  visual=true
	...	 w3c=true
    ...  name=[ToDoApp - 1] Parallel Testing with Robot framework
	...  build=[ToDoApp Demo - 1] Parallel Testing with Robot framework
    ...  project=[ToDoApp Project - 1] Parallel Testing with Robot framework

${BROWSER_1}	  	  ${lt_options_1['browserName']}
&{CAPABILITIES_1}     LT:Options=&{lt_options_1}

*** Comments ***
# Configuration for second test scenario

*** Variables ***

&{lt_options_2}
    ...  browserName=Safari
    ...  platformName=MacOS Ventura
    ...  browserVersion=16.0
    ...  visual=true
	...	 w3c=true
    ...  name=[ToDoApp - 2] Parallel Testing with Robot framework
	...  build=[ToDoApp Demo - 2] Parallel Testing with Robot framework
    ...  project=[ToDoApp Project - 2] Parallel Testing with Robot framework

${BROWSER_2}	  	  ${lt_options_2['browserName']}
&{CAPABILITIES_2}     LT:Options=&{lt_options_2}

*** Test Cases ***

Example 1: [ToDo] Parallel Testing with Robot framework
	[tags]  ToDo App Automation - 1
	[Timeout]   ${TIMEOUT}
	Open test browser	${site_url}		${BROWSER_1}		${CAPABILITIES_1}
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
	Open test browser	${site_url}		${BROWSER_2}		${CAPABILITIES_2}
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
