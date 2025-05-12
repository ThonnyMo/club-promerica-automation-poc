*** Settings ***
Library     SeleniumLibrary

*** Variables ***
# FORMULARIO DE CONTACTENOS
${INPUT_NAME}          id=FullName
${INPUT_EMAIL}         id=Email
${INPUT_COMMENT}       id=Enquiry
${BUTTON_SUBMIT}       name=send-email
${SUCCESS_MESSAGE}     xpath=//div[@class='result' and contains(text(),'Su comentario ha sido enviado con éxito')]
${COMMENT_TEXT}        Este es un mensaje de prueba automatizado. 




*** Keywords ***
User Fills Contact Us Form
    [Arguments]    ${name}    ${email}
    TRY
        Input Text    ${INPUT_NAME}      ${name}
        Input Text    ${INPUT_EMAIL}     ${email}
        Input Text    ${INPUT_COMMENT}   ${COMMENT_TEXT}
        Click Element   ${BUTTON_SUBMIT}
        Wait Until Page Contains Element    ${SUCCESS_MESSAGE}    timeout=10s
    EXCEPT
        Log    Error al enviar el formulario de contacto   level=ERROR
        Fail    No se pudo enviar el formulario
    FINALLY
        Log    Finalizando intento de enviar formulario    level=INFO
    END            