
*** Settings ***
Library     SeleniumLibrary


*** Variables ***
# CONFIGURACIÓN
${URL}                  https://www.clubpromerica.com/costarica/
${BROWSER}              chrome      #headlesschrome
${SELENIUM_SPEED}       .2s
${SELENIUM_TIMEOUT}     10s

#HOME PAGE
${HOME_PAGE_TEXT}       Club Promerica Costa Rica
#TABS
${TAB_PROMO_DESCUENTO}           xpath=//a[@href='/costarica/promociones-y-descuentos']
${BENEFICIOS_EPIC_IMAGE}         //a[@href='/costarica/programa-line-up-epic']/img[contains(@src,'se-parte-de-los-beneficios-exclusivos-epic_635.png')]                    
${TAB_CONTACTENOS}               xpath=//a[@href='/costarica/contactus']
${VALIDACION_CONTACTENOS_TAB}    //p[contains(text(),'Mayor información de nuestros productos y servicios en:')]
${TAB_COMERCIOS}                 xpath=//a[@href='/costarica/comercios-2']
${VALIDACION_COMERCIOS_TAB}      xpath=//div[@class='title']/strong[text()='Categorías']
    



*** Keywords ***

# KEYWORDS O MÉTODOS DE CONFIGURACIÓN
Selenium is initialized
    Set Selenium Speed    ${SELENIUM_SPEED}
    Set Selenium Timeout  ${SELENIUM_TIMEOUT}

Browser is Opened And Maximized
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window


# ACCEDER A HOME PAGE CLUB PROMERICA
The user opens club promerica page
    Given Selenium is initialized
    And Browser is Opened And Maximized
    Then Wait Until Page Contains    ${HOME_PAGE_TEXT}
    And Capture Page Screenshot    Screenshot/screenshot_home_page.png

# ACCEDER A LAS TABS DE CLUB PROMERICA
User access Tab
    [Arguments]    ${tab_xpath}    ${element_after_accesing_tab}
    TRY
        Log    Intentando acceder a la tab: ${tab_xpath}    level=INFO
        Wait Until Page Contains Element    ${tab_xpath}    timeout=10s
        Click Element    ${tab_xpath}
        Wait Until Page Contains Element    ${element_after_accesing_tab}    timeout=10s
        Capture Page Screenshot    Screenshot/screenshot_selected_tab.png
        Log     Navegación exitosa a la tab
    EXCEPT
        Log     Error al acceder a la tab    level=ERROR
        Fail    No se pudo acceder a la tab
    FINALLY
        Log       Finalizando intento de navegación a la tab.    level=INFO  
    END      