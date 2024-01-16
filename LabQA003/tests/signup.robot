*** Settings ***
Documentation        Cenários de teste de cadastro de usuários

Resource        ../resources/base.robot

Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve poder cadastrar um novo usuário
    
    ${user}        Create Dictionary
    ...        name=Robson Cerqueira
    ...        email=robson@teste.com
    ...        password=pwd123


    Remove user from database    ${user}[email]
    
    Go To    http://localhost:3000/signup

    Wait For Elements State    css=h1    visible    5
    Get Text                   css=h1    equal      Faça seu cadastro

    Fill Text    css=#name        ${user}[name]
    Fill Text    css=#email       ${user}[email]
    Fill Text    css=#password    ${user}[password]

    Click    css=#buttonSignup
    
    Wait For Elements State        css=.notice p    visible      5
    Get Text                       css=.notice p    equal        Boas vindas ao Mark85, o seu gerenciador de tarefas.


Nao deve permitir cadastrar email duplicado
    [Tags]    dup

    ${user}        Create Dictionary
    ...        name=Robson Cerqueira
    ...        email=robson@maker.com
    ...        password=pwd123

    Remove user from database    ${user}[email]
    Insert user from database    ${user}
    
    Go To    http://localhost:3000/signup

    Wait For Elements State    css=h1    visible    5
    Get Text                   css=h1    equal      Faça seu cadastro

    Fill Text    css=#name        ${user}[name]
    Fill Text    css=#email       ${user}[email]
    Fill Text    css=#password    ${user}[password]

    Click    css=#buttonSignup
    
    Wait For Elements State        css=.notice p    visible      5
    Get Text                       css=.notice p    equal        Oops! Já existe uma conta com o e-mail informado.
