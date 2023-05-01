Perform the following steps for running the Robot tests in parallel on the Selenium Grid:

## Installation of Python packages

1. Packages that need to be installed are present in *pyproject.toml* Execution is performed on the LambdaTest Selenium Grid. We are using Selenium 4.9.0 for the execution.  

Install the Python packages by running the *poetry install* command on the terminal

```bash
poetry install
```

It installs the libraries that are required for testing. Shown below is the execution snapshot:

<img width="1080" alt="Screenshot 2022-09-16 at 2 10 49 PM" src="https://user-images.githubusercontent.com/1688653/196665109-f5a39ba0-2442-4e4b-8ff2-5f6b6d7f83dd.png">
<img width="822" alt="Screenshot 2022-09-16 at 2 12 17 PM" src="https://user-images.githubusercontent.com/1688653/190631088-2a01af38-3b1a-43a6-95bc-07847a839c8c.png">
<img width="823" alt="Screenshot 2022-09-16 at 2 12 04 PM" src="https://user-images.githubusercontent.com/1688653/190631089-bf274eed-1703-46a5-8f69-0f890a396612.png">
<img width="819" alt="Screenshot 2022-09-16 at 2 12 29 PM" src="https://user-images.githubusercontent.com/1688653/190631083-b8b1f5c6-393d-4330-96bd-33fedc8ff023.png">
<img width="806" alt="Screenshot 2022-09-16 at 2 12 46 PM" src="https://user-images.githubusercontent.com/1688653/190631076-23bcc619-3f72-487d-8a0a-7d5f36e539be.png">

Install the project dependencies by running ```poetry install``` on the terminal

<img width="1004" alt="Robot_Poetry_Install" src="https://user-images.githubusercontent.com/1688653/235434976-aab55a98-4e5e-4240-a65d-186aa8ea60ce.png">

The global dependencies (i.e. Robot Framework 6.0 and Selenium 4.9.0) are installed by running ```pip install -r requirements.txt``` on the terminal

<img width="1405" alt="Robot_Requirements_Install" src="https://user-images.githubusercontent.com/1688653/235434959-dda506bd-f5c0-4762-88d3-92724690ab27.png">

## Configure Environment Variables

Before the tests are run, please set the environment variables LT_USERNAME & LT_ACCESS_KEY from the terminal. The account details are available on your [LambdaTest Profile](https://accounts.lambdatest.com/detail/profile) page.

For macOS:

```bash
export LT_USERNAME=LT_USERNAME
export LT_ACCESS_KEY=LT_ACCESS_KEY
```

For Linux:

```bash
export LT_USERNAME=LT_USERNAME
export LT_ACCESS_KEY=LT_ACCESS_KEY
```

For Windows:

```bash
set LT_USERNAME=LT_USERNAME
set LT_ACCESS_KEY=LT_ACCESS_KEY
```

## Splitting test execution at the suite level

As stated in the [official documentation of Robot framework](https://docs.robotframework.org/docs/parallel#usage), Pabot splits execution on suite level (by default). That means that each process will run a single suite. Test Cases from the suite will be executed sequentially.

Run the following command ```pabot --verbose --processes 4 Tests/``` on the terminal to run tests in parallel at the suite-level. This command will run the tests in the respective .robot files in parallel, whereas individual tests in each robot file will run in a sequential manner.

Shown below is the terminal screenshot of successful execution:

<img width="1428" alt="Robot_Suite_Level_Execution_Terminal" src="https://user-images.githubusercontent.com/1688653/235423782-d2eb29d2-2ae2-4228-8b9b-395411e41fc7.png">

As seen on the [LambdaTest Automation Dashboard](https://automation.lambdatest.com/build), three tests - 2 from *Tests/test_todo_app.robot* and 1 from *Tests/test_sel_playground.robot* are run in parallel

<img width="1428" alt="Robot_Suite_Level_Execution_Progress" src="https://user-images.githubusercontent.com/1688653/235423049-4263ffcb-786c-4cd2-8ccc-22266cf3e6da.png">

Here is the successful execution status as seen in the [LambdaTest Automation Dashboard](https://automation.lambdatest.com/build)

<img width="1440" alt="Robot_Suite_Level_Execution_Completion" src="https://user-images.githubusercontent.com/1688653/235423018-23cc7ce1-649c-4f55-9d77-84c0b45ccfb4.png">

## Splitting test execution on the test level

Run the following command ```pabot --verbose --processes 4 --testlevelsplit Tests/``` on the terminal to run tests in parallel at the test-level. This command will run the tests in the respective .robot files in parallel.

Shown below is the terminal screenshot of successful execution:

<img width="1411" alt="Robot_Test_Level_Execution" src="https://user-images.githubusercontent.com/1688653/235419139-7e2a661a-83f0-4f3c-89e6-a85d4a21a28e.png">

As seen on the [LambdaTest Automation Dashboard](https://automation.lambdatest.com/build), three tests - 2 from *Tests/test_todo_app.robot* and 1 from *Tests/test_sel_playground.robot* are run in parallel

<img width="1428" alt="Robot_Test_Level_Execution_Progress" src="https://user-images.githubusercontent.com/1688653/235419768-7d79ed7b-c0c6-46d8-979e-2f3a88c33580.png">

Here is the successful execution status as seen in the [LambdaTest Automation Dashboard](https://automation.lambdatest.com/build)

<img width="1428" alt="Robot_Test_Level_Execution_Completion" src="https://user-images.githubusercontent.com/1688653/235419907-e09fee67-8325-4c0f-afb1-298f00aea7c1.png">