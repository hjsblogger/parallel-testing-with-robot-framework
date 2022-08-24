*** Settings ***

Resource  	../Resources/PageObject/KeyDefs/Common.robot
Variables 	../Resources/PageObject/Locators/Locators.py

Test Teardown  Common.Close test browser

*** Variables ***

${site_url}  		https://lambdatest.github.io/sample-todo-app/

@{_tmp_1}
    ...  browserName: Chrome,
    ...  platform: Windows 11,
    ...  version: latest,
    ...  visual: true,
    ...  network: true,
    ...  console: true,
    ...  name: [ToDo - 1] Parallel Testing with Robot framework,
	...  build: [Demo - 1] Parallel Testing with Robot framework,
    ...  project: [Demo -1] Robot Testing

${CAPABILITIES_1}     ${EMPTY.join(${_tmp_1})}
${BROWSER_1}          Chrome

@{_tmp_2}
    ...  browserName: Opera,
    ...  platform: macOS High Sierra,
    ...  version: latest-2,
    ...  visual: true,
    ...  network: true,
    ...  console: true,
    ...  name: [ToDo - 2] Parallel Testing with Robot framework,
	...  build: [Demo - 2] Parallel Testing with Robot framework,
    ...  project: [Demo - 1] Robot Testing

${CAPABILITIES_2}     ${EMPTY.join(${_tmp_2})}
${BROWSER_2}          Opera

*** Test Cases ***

Example 1: [ToDo] Parallel Testing with Robot framework
	[tags]  ToDo App Automation - 1
	[Timeout]   ${TIMEOUT}
	Open test browser	${site_url}		${BROWSER_1}		${CAPABILITIES_1}
	Page should contain element  ${FirstItem}
	Page should contain element  ${SecondItem}

	Click button  ${FirstItem}	
	Click button  ${SecondItem}	
		
	Input text  ${ToDoText}  ${NewItemText}
	Click button  ${AddButton}
	${response}    Get Text    ${NewAdditionText}
	Should Be Equal As Strings    ${response}    ${NewItemText}

Example 2: [ToDo] Parallel Testing with Robot framework
	[tags]  ToDo App Automation - 2
	[Timeout]   ${TIMEOUT}
	Open test browser	${site_url}		${BROWSER_2}		${CAPABILITIES_2}
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