*** Settings ***

Resource  	../../Resources/PageObject/KeyDefs/Common.robot
Resource  	../../Resources/PageObject/KeyDefs/SeleniumDrivers.robot
Variables 	../../Resources/PageObject/Locators/Locators.py

Test Teardown  Common.Close local test browser

Library    BuiltIn

*** Variables ***

${site_url}  		https://www.lambdatest.com/selenium-playground/

*** Comments ***
# Configuration for first test scenario

*** Variables ***

&{lt_options}
    ...  browserName=Firefox

${BROWSER}	  	  	${lt_options['browserName']}

*** Test Cases ***

Example 2: [Playground] Parallel Testing with Robot framework
	[tags]  Selenium Playground Automation
	[Timeout]   ${TIMEOUT}
	${firefox_driver_path}=   Update Firefox Webdriver
	# Open local test browser	${site_url}		${BROWSER}
	Open local test browser 	${site_url}		${BROWSER}	${firefox_driver_path}
	Maximize Browser Window
	Page should contain element  xpath://a[.='Input Form Submit']

	Click link  ${SubmitButton}
	Page should contain element  ${Name}
	# Enter details in the input form

	# Name
	Input text  ${Name}   TestName
	# Email
	Input text  ${email}       testing@gmail.com
        # Password  
	Input text  ${passwd}       Password1
	# Company 
	Input text  ${company}      LambdaTest
	# Website
	Input text  ${website}      https://wwww.lambdatest.com
	# Country
	select from list by value    ${country}     US
        # City
	Input text  ${city}       San Jose
	# Address 1
	Input text  ${address1}      Googleplex, 1600 Amphitheatre Pkwy
	# Website
	Input text  ${address2}       Mountain View, CA 94043
	# State
	Input text    ${state}          California
        # City
	Input text  ${city}       San Jose
	# Zip Code
	Input text  ${zipcode}      94088
	Sleep  5s

	Click button  	  ${FinalSubmission}
	Execute JavaScript    window.scrollTo(0, 0)
	Page should contain  ${SuccessText}
	Sleep  2s

        Log    Completed - Example 2: [Playground] Parallel Testing with Robot framework
