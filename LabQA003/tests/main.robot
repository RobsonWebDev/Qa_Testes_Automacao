*** Settings ***
Documentation        Online

Resource    ../resources/base.robot

*** Test Cases ***
Abrindo navegador
    Start Session
    Get Title       equal        Mark85 by QAx