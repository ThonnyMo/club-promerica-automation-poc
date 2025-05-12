*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/common.robot
Resource    ../Resources/PageObjects/contactenosTabPO.robot


*** Variables ***
${NAME}              Automated user
${EMAIL_ADDRESS}     automateduser@gmail.com



*** Test Cases ***

Complete Navigation and Interaction Flow ClubPromerica
    [Documentation]    Test completo para navegar, interactuar, validar, capturar pantalla y finalizar correctamente.
    [Tags]             complete_flow
    # Parte 1: Acceso y Navegación
    Given The user opens club promerica page
    When User access Tab     ${TAB_PROMO_DESCUENTO}    ${BENEFICIOS_EPIC_IMAGE}
    # Parte 2: Interacción con Elementos
    Then User access Tab    ${TAB_CONTACTENOS}     ${VALIDACION_CONTACTENOS_TAB}
    And User Fills Contact Us Form     ${NAME}    ${EMAIL_ADDRESS}   
    # Parte 3: Validación
    Then User access Tab    ${TAB_COMERCIOS}    ${VALIDACION_COMERCIOS_TAB}
    # Parte 4:  Capturas de pantalla y reportes
    Log     Capturas de pantalla de Home Page y tab navegada guardadas en Results/Screenshot     level=INFO
    Log     Reporte generado en la carpeta Results
    # Parte 5: Limpiar y finalizar
    TRY
        Close All Browsers
    EXCEPT
        Log    Error al cerrar navegadores e instancias de Selenium WebDriver    level=ERROR
    FINALLY
        Log    Navegador y Selenium Driver cerrado correctamente    level=INFO   
    END       