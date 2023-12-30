*** Settings ***
Documentation   Suite de testes de cadastro do walkerdog

Resource        ../resources/base.resource

Test Setup      Start session
Test Teardown   Finish session

*** Test Cases ***
Deve poder cadastrar um novo Dog Walker

    ${dog_walker}       Create Dictionary
    ...     name=August King
    ...     email=agustking@test.com
    ...     cpf=00000014141
    ...     cep=04534011
    ...     addressNumber=1000
    ...     addressDetails=Apt 28
    ...     cnh=toretto.jpg

    Va para pagina de cadastro
    Preencha os campos do formulario        ${dog_walker}
    Envio do formulario de cadastro
    verificacao de popup        Recebemos o seu cadastro e em breve retornaremos o contato.

Nao deve cadastrar se os campos obrigatorios nao forem preenchidos
    [Tags]      required

    Va para pagina de cadastro
    Envio do formulario de cadastro

    Validacao de Alertas    Informe o seu nome completo

    Validacao de Alertas    Informe o seu melhor email

    Validacao de Alertas    Informe o seu CPF

    Validacao de Alertas    Informe o seu CEP

    Validacao de Alertas    Informe um número maior que zero

    Validacao de Alertas    Adcione um documento com foto (RG ou CHN)

Deve poder cadastrar um novo Dog Walker que saiba cuidar

    ${dog_walker}       Create Dictionary
    ...     name=August King
    ...     email=agustking@test.com
    ...     cpf=00000014141
    ...     cep=04534011
    ...     addressNumber=1000
    ...     addressDetails=Apt 28
    ...     cnh=toretto.jpg

    Va para pagina de cadastro
    Preencha os campos do formulario        ${dog_walker}
    Adiciona Servico    Cuidar
    Envio do formulario de cadastro
    verificacao de popup        Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um novo Dog Walker que saiba adestrar

    ${dog_walker}       Create Dictionary
    ...     name=August King
    ...     email=agustking@test.com
    ...     cpf=00000014141
    ...     cep=04534011
    ...     addressNumber=1000
    ...     addressDetails=Apt 28
    ...     cnh=toretto.jpg

    Va para pagina de cadastro
    Preencha os campos do formulario        ${dog_walker}
    Adiciona Servico    Adestrar
    Envio do formulario de cadastro
    verificacao de popup        Recebemos o seu cadastro e em breve retornaremos o contato.