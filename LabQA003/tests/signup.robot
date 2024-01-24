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
    
    Go to signup page
    Submit signup form        ${user}
    Notice should be          Boas vindas ao Mark85, o seu gerenciador de tarefas.
  
Nao deve permitir cadastrar email duplicado
    [Tags]    dup

    ${user}        Create Dictionary
    ...        name=Robson Cerqueira
    ...        email=robson@maker.com
    ...        password=pwd123

    Remove user from database    ${user}[email]
    Insert user from database    ${user}
    
    Go to signup page
    Submit signup form          ${user}
    Notice should be            Oops! Já existe uma conta com o e-mail informado.
