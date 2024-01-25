*** Settings ***
Documentation    Elementos e ações da página de cadastro

Library        Browser
Resource        ../env.resource

*** Keywords ***
Go to signup page

    Go To    ${BASE_URL}/signup

    Wait For Elements State    css=h1    visible    5
    Get Text                   css=h1    equal      Faça seu cadastro
Submit signup form
    [Arguments]        ${user}

    Fill Text    css=#name        ${user}[name]
    Fill Text    css=#email       ${user}[email]
    Fill Text    css=#password    ${user}[password]

    Click    css=#buttonSignup
Notice should be
    [Arguments]    ${expected_text}

    ${element}    Set Variable    css=.notice p

    Wait For Elements State        ${element}    visible      5
    Get Text                       ${element}    equal        ${expected_text}

Alert should be
    [Arguments]    ${expected_text}

    Wait For Elements State    css=.alert-error >> text=${expected_text}
    ...        visible        5
    