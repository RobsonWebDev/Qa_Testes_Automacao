*** Settings ***
Documentation        Cenários de teste de cadastro de usuários

Resource        ../resources/base.robot

*** Variables ***
${name}            Robson Cerqueira
${email}           robson@teste.com
${password}        pwd123


*** Test Cases ***
Deve poder cadastrar um novo usuário

    Remove user from database    ${email}

    Start Session    
    
    Go To    http://localhost:3000/signup

    Wait For Elements State    css=h1    visible    5
    Get Text                   css=h1    equal      Faça seu cadastro

    Fill Text    css=#name        ${name}
    Fill Text    css=#email       ${email}
    Fill Text    css=#password    ${password}

    Click    css=#buttonSignup
    
    Wait For Elements State        css=.notice p    visible      5
    Get Text                       css=.notice p    equal        Boas vindas ao Mark85, o seu gerenciador de tarefas.

Nao deve permitir cadastrar email duplicado
    [Tags]    dup

    Start Session    
    
    Go To    http://localhost:3000/signup

    Wait For Elements State    css=h1    visible    5
    Get Text                   css=h1    equal      Faça seu cadastro

    Fill Text    css=#name        ${name}
    Fill Text    css=#email       ${email}
    Fill Text    css=#password    ${password}

    Click    css=#buttonSignup
    
    Wait For Elements State        css=.notice p    visible      5
    Get Text                       css=.notice p    equal        Oops! Já existe uma conta com o e-mail informado.
