Perform the following steps for running the Robot tests in paralle on the Selenium Grid:

## Installation of Python packages

1. Packages that need to be installed are present in *pyproject.toml* Execution is performed on the LambdaTest Selenium Grid. We are using Selenium 3.141.0 for the execution.  

Install the Python packages by running the *poerty install* command on the terminal

```bash
poetry install
```

It installs the libraries that are required for testing. Shown below is the execution snapshot:

<img width="1080" alt="Screenshot 2022-09-16 at 2 10 49 PM" src="https://user-images.githubusercontent.com/1688653/196665109-f5a39ba0-2442-4e4b-8ff2-5f6b6d7f83dd.png">
<img width="822" alt="Screenshot 2022-09-16 at 2 12 17 PM" src="https://user-images.githubusercontent.com/1688653/190631088-2a01af38-3b1a-43a6-95bc-07847a839c8c.png">
<img width="823" alt="Screenshot 2022-09-16 at 2 12 04 PM" src="https://user-images.githubusercontent.com/1688653/190631089-bf274eed-1703-46a5-8f69-0f890a396612.png">
<img width="819" alt="Screenshot 2022-09-16 at 2 12 29 PM" src="https://user-images.githubusercontent.com/1688653/190631083-b8b1f5c6-393d-4330-96bd-33fedc8ff023.png">
<img width="806" alt="Screenshot 2022-09-16 at 2 12 46 PM" src="https://user-images.githubusercontent.com/1688653/190631076-23bcc619-3f72-487d-8a0a-7d5f36e539be.png">

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

Run the following command on the terminal to run split test execution at 

## Splitting test execution on the test level



