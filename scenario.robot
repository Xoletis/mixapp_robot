*** Settings ***
Documentation     A test suite with a single test to purchase an item.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot
Test Teardown    Close Browser
*** Test Cases ***
ScenarioAcheteur
    Open Browser To Welcome Page
    Sleep    2