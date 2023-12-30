*** Settings ***
Documentation       Step by step para à automacao web

Library             Browser


*** Keywords ***
Preencher campos
    [Arguments]     ${nome}     ${phone}    ${email}    ${time}     ${comments}

    Fill Text   css=input[name="custname"]      ${nome}
    Fill Text   css=input[name="custtel"]       ${phone}
    Fill Text   css=input[name="custemail"]     ${email}

    Click       css=input[value="small"]
    Click       css=input[value="bacon"]
    Click       css=input[value="cheese"]

    Fill Text   css=input[name="delivery"]      ${time}
    Fill Text   css=textarea[name="comments"]   ${comments}

Salvar evidencia

    Take Screenshot
