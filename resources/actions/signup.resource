*** Settings ***
Documentation   Ações, steps e elementos da funcionalidade de cadastro

Library     Browser

*** Keywords ***
Va para pagina de cadastro
    Click       css=a[href="/signup"]

    Wait For Elements State     form h1     visible     5000
    Get Text    form h1     equal   Faça seu cadastro

Preencha os campos do formulario
    [Arguments]     ${dog_walker}
    Fill Text   css=input[name=name]                ${dog_walker}[name]
    Fill Text   css=input[name=email]               ${dog_walker}[email]
    Fill Text   css=input[name=cpf]                 ${dog_walker}[cpf]
    Fill Text   css=input[name=cep]                 ${dog_walker}[cep]

    Click       css=input[type=button][value$=CEP]

#    ${addressStreet}        Set Variable    css=input[name=addressStreet]
#    ${addressDistrict}      Set Variable    css=input[name=addressDistrict]
#    ${addressCityUf}        Set Variable    css=input[name=addressCityUf]

#    Get Property     css=input[name=addressStreet]       value   equal   ${addressStreet}
#    Get Property     css=input[name=addressDistrict]     value   equal   ${addressDistrict} 
#    Get Property     css=input[name=addressCityUf]       value   equal   ${addressCityUf} 

    Fill Text   css=input[name=addressNumber]       ${dog_walker}[addressNumber]
    Fill Text   css=input[name=addressDetails]      ${dog_walker}[addressDetails]

    Upload File By Selector      css=input[type=file]        ${EXECDIR}/resources/fixtures/${dog_walker}[cnh]

Adiciona Servico
    [Arguments]      ${adiccional_service}

    Click       xpath=//span[text()="${adiccional_service}"]/..

Envio do formulario de cadastro

    Click       css=.button-register

verificacao de popup
    [Arguments]         ${expected_text}
    Wait For Elements State     css=.swal2-html-container       visible     5
    Get Text                    css=.swal2-html-container       equal       ${expected_text}

Validacao de Alertas
    [Arguments]     ${expected_text}

    Wait For Elements State      css=.alert-error >> text=${expected_text}
    ...     visible     5