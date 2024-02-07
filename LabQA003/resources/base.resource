*** Settings ***

Library        libs/database.py
Library        Browser
Library        JSONLibrary

Resource        env.resource

Resource        pages/components/Header.resource
Resource        pages/components/Notice.resource
Resource        pages/components/Alert.resource

Resource        pages/LoginPage.resource
Resource        pages/SignupPage.resource
Resource        pages/TaskCreatePage.resource
Resource        pages/TasksPage.resource

*** Keywords ***
Start Session

    New Browser     browser=chromium    headless=False
    New Page        ${BASE_URL}

Get fixture
    [Arguments]        ${file_name}        ${scenario}

    ${data}    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8

    [Return]    ${data}[${scenario}]


# Short password
#     [Arguments]    ${short_pass}

#     ${user}        Create Dictionary
#     ...        name=Charles Xavier
#     ...        email=xavier@teste.com
#     ...        password=${short_pass}
  
#     Go to signup page
#     Submit signup form    ${user}
#     Alert should be       Informe uma senha com pelo menos 6 digitos