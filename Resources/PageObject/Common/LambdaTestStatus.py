import json
import traceback
import os
import sys
from robot.libraries.BuiltIn import BuiltIn

def report_lambdatest_status(name, status):
    selenium = BuiltIn().get_library_instance('SeleniumLibrary')

    BuiltIn().log_to_console("Inside report_lambdatest_status")
    BuiltIn().log_to_console(status)

    # Mark test status pass/failed
    lambda_status = "passed" if status == "PASS" else "failed"
    lambda_status_script = 'lambda-status={}'.format(lambda_status)
    selenium.execute_javascript(lambda_status_script)

    # Update test name
    lambda_name_script = 'lambda-name={}'.format(name)
    selenium.execute_javascript(lambda_name_script)