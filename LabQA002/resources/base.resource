*** Settings ***
Documentation       Arquivo principal do projeto

Library             Browser
Resource            actions/automatization.resource

*** Keywords ***
Start suite de Testes

    New Browser     browser=chromium    headless=False
    New Context     viewport={'width': 720, 'height': 650}
    New Page        https://httpbin.org/forms/post

    Wait For Elements State     button    visible     10
    Get Text    button        equal       Submit order

Enviar Formulario

    Click       css=button