*** Settings ***
Library    SeleniumLibrary
Library     Browser
Test Setup  open the url
Test Teardown  Close Browser

Resource        resource.robot

*** Variables ***
${username}    test007@gmail.com
${password}    test@007
${logout_button}      css:a[href="/logout"]


*** Test Cases ***
Automation Practice
    open web application        ${username}     ${password}

*** Keywords ***
open web application
    [arguments]     ${username}     ${password}
        Click Element      css:a[href="/login"]
        Input Text         css:input[name="email"]    ${username}
        Input Text         css:input[name="password"]    ${password}
        Click Element      css:button[data-qa="login-button"]
        Wait Until Element Is Visible    ${logout_button}       timeout=5s  error=Logout button is not visible and login failed
        ${status}    ${error_msg}=    Run Keyword And Ignore Error    Element Should Be Visible    ${logout_button}

        IF    '${status}' == 'PASS'
            Set Test Message    SUCCESS: Element is present on screen.
        ELSE
            Set Test Message    FAILURE: Element was missing. System said: ${error_msg}    level=WARN
        END
