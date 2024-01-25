*** Settings ***
Documentation        Cenários de autenticação do usuário

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
    User should br logged in    ${user}[name]