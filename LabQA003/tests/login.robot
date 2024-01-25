*** Settings ***
Documentation        Cenários de autenticação do usuário

Library         Collections
Resource        ../resources/base.resource
Resource        ../resources/pages/LoginPage.resource

Test Setup          Start Session
Test Teardown       Take Screenshot

*** Test Cases ***
Deve logar com um usuário pré-cadastrado

    ${user}    Create Dictionary
    ...    name=Robson Cerqueira
    ...    email=robson@teste.com
    ...    password=pwd123
    
    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Submit login form    ${user}
    User should be logged in    ${user}[name]

Não deve logar com a senha Inválida
    [Tags]    inv_pass
    ${user}    Create Dictionary
    ...    name=Steve Woz
    ...    email=woz@apple.com
    ...    password=pwd123
    
    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Set To Dictionary    ${user}    password=123456

    Submit login form    ${user}
    Notice should be     Ocorreu um erro ao fazer login, verifique suas credenciais.