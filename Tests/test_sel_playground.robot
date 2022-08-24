*** Settings ***

Resource  	../Resources/PageObject/KeyDefs/Common.robot
Variables 	../Resources/PageObject/Locators/Locators.py

Test Teardown  Common.Close test browser

*** Variables ***

${site_url}  		https://www.lambdatest.com/selenium-playground/
@{_tmp}
    ...  browserName: Firefox,
    ...  platform: MacOS Monterey,
    ...  version: latest-4,
    ...  visual: true,
    ...  network: true,
    ...  console: true,
    ...  name: [Playground - 1] Parallel Testing with Robot framework,
	...  build: [Demo - 2] Parallel Testing with Robot framework,
    ...  project: [Demo - 2] Robot Testing

${BROWSER}          Firefox
${CAPABILITIES}     ${EMPTY.join(${_tmp})}

*** Test Cases ***

Example 2: [Playground] Parallel Testing with Robot framework
	[tags]  Selenium Playground Automation
	[Timeout]   ${TIMEOUT}
	Open test browser	${site_url}		${BROWSER}		${CAPABILITIES}
	Page should contain element  xpath://a[.='Input Form Submit']

	Click link  ${SubmitButton}
	Page should contain element  ${Name}
	# Enter details in the input form

	# Name
	Input text  ${Name}   TestName
	Sleep   5
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
	Input text  ${address1}      94088