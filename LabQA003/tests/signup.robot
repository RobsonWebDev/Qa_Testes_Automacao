*** Settings ***
Documentation        Cenários de teste de cadastro de usuários

Resource        ../resources/base.resource


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

Campos Obrigatórios
    [Tags]    required

    ${user}    Create Dictionary
    ...        name=${EMPTY}
    ...        email=${EMPTY}
    ...        password=${EMPTY}
    
    Go to signup page
    Submit signup form    ${user}

    Alert should be        Informe seu nome completo
    Alert should be        Informe seu e-email  
    Alert should be        Informe uma senha com pelo menos 6 digitos

Não deve cadastrar com email inválido

    [Tags]    inv_email

    ${user}        Create Dictionary
    ...        name=Charles Xavier
    ...        email=xavier.com.br
    ...        password=123456
  
    Go to signup page
    Submit signup form    ${user}
    Alert should be       Digite um e-mail válido

Não deve cadastrar com senha de 1 digito
    [Tags]    short_pass

    ${user}        Create Dictionary
    ...        name=Charles Xavier
    ...        email=xavier@teste.com
    ...        password=1
  
    Go to signup page
    Submit signup form    ${user}
    Alert should be       Informe uma senha com pelo menos 6 digitos

Não deve cadastrar com senha de 2 digitos
    [Tags]    short_pass

    ${user}        Create Dictionary
    ...        name=Charles Xavier
    ...        email=xavier@teste.com
    ...        password=12
  
    Go to signup page
    Submit signup form    ${user}
    Alert should be       Informe uma senha com pelo menos 6 digitos

Não deve cadastrar com senha de 3 digitos
    [Tags]    short_pass

    ${user}        Create Dictionary
    ...        name=Charles Xavier
    ...        email=xavier@teste.com
    ...        password=123
  
    Go to signup page
    Submit signup form    ${user}
    Alert should be       Informe uma senha com pelo menos 6 digitos

Não deve cadastrar com senha de 4 digitos
    [Tags]    short_pass

    ${user}        Create Dictionary
    ...        name=Charles Xavier
    ...        email=xavier@teste.com
    ...        password=1234
  
    Go to signup page
    Submit signup form    ${user}
    Alert should be       Informe uma senha com pelo menos 6 digitos

Não deve cadastrar com senha de 5 digitos
    [Tags]    short_pass

    ${user}        Create Dictionary
    ...        name=Charles Xavier
    ...        email=xavier@teste.com
    ...        password=12345
  
    Go to signup page
    Submit signup form    ${user}
    Alert should be       Informe uma senha com pelo menos 6 digitos