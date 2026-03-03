*** Settings ***
Documentation   Test case to execute for automation practice website
Library    SeleniumLibrary

*** Variables ***
${BROWSER}      Chrome
${URL}      https://automationexercise.com/


*** Keywords ***
open the url
    Open Browser    ${URL}    ${BROWSER}