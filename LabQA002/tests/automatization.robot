*** Settings ***
Documentation       Suite de Testes

Library             FakerLibrary        locale=pt_BR
Resource            ../resources/base.resource


*** Test Cases ***
Gerando testes automatizados
    ${NOMEFAKE}=        FakerLibrary.Name
    ${PHONENUMBER}=     FakerLibrary.PhoneNumber
    ${EMAILFAKE}=       FakerLibrary.Email
    ${FAKETIME}=        FakerLibrary.Time
    ${TEXTFAKE}=        FakerLibrary.Texts
    ${nome}             Set Variable    ${NOMEFAKE}
    ${phone}            Set Variable    ${PHONENUMBER}
    ${email}            Set Variable    ${EMAILFAKE}
    ${time}             Set Variable    ${FakeTIME}
    ${comments}         Set Variable    ${TEXTFAKE}

    Start suite de Testes
    Preencher campos    ${nome}     ${phone}    ${email}    ${time}     ${comments}
    Salvar evidencia
    Enviar Formulario