*** Settings ***

Resource  	../../Resources/PageObject/KeyDefs/Common.robot
Variables 	../../Resources/PageObject/Locators/Locators.py

Test Teardown  Common.Close test browser

*** Variables ***

${site_url}  		https://www.lambdatest.com/selenium-playground/

*** Comments ***
# Configuration for first test scenario

*** Variables ***

&{lt_options}
    ...  browserName=Firefox
    ...  platformName=MacOS Monterey
    ...  browserVersion=latest-4
    ...  visual=true
    ...	 w3c=true
    ...  name=[Playground - 1] Parallel Testing with Robot framework
    ...  build=[Playground Demo - 1] Parallel Testing with Robot framework
    ...  project=[Playground Project - 1] Parallel Testing with Robot framework

${BROWSER}	    ${lt_options['browserName']}
&{CAPABILITIES}     LT:Options=&{lt_options}

*** Test Cases ***

Example 2: [Playground] Parallel Testing with Robot framework
	[tags]  Selenium Playground Automation
	[Timeout]   ${TIMEOUT}
	Open test browser	${site_url}		${BROWSER}		${CAPABILITIES}
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
	Input text  ${state}          California
	# Zip Code
	Input text  ${zipcode}      94088
	Sleep  5s

	Click button  	  ${FinalSubmission}
	Execute JavaScript    window.scrollTo(0, 0)
	Page should contain  ${SuccessText}
	Sleep  2s

        Log    Completed - Example 2: [Playground] Parallel Testing with Robot framework
