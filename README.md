# Club Promerica Automation Project

## Descripción
Este proyecto es una prueba automatizada para el sitio web de **Club Promerica Costa Rica** utilizando **Robot Framework** y **Selenium WebDriver**. La prueba está diseñada para demostrar las mejores prácticas en la automatización de pruebas, incluyendo acceso, navegación, interacción con formularios, validación de contenido, capturas de pantalla y generación de reportes.

## Estructura del Proyecto

```plaintext
.
├── Resources
│   ├── common.robot              # Configuración general y métodos comunes.
│   └── PageObjects
│       └── contactenosTabPO.robot # Objetos de la página de contacto.
├── Results                       # Carpeta para almacenar resultados y capturas de pantalla.
├── Tests
│   └── navigation_test.robot     # Archivo principal de prueba.
└── requirements.txt              # Dependencias necesarias para ejecutar el proyecto.
```

## Requisitos Previos
- **Python 3.7 o superior.**
- **Google Chrome instalado.**
- **ChromeDriver correspondiente a la versión de Chrome instalada.**
- **Ubica el ChromeDriver en `C:\bin` y agrega esta ruta al `PATH` del sistema.**

## Instalación
1. **Clona este repositorio en tu máquina local.**
2. **Navega a la carpeta del proyecto.**
3. **Instala las dependencias del proyecto usando el siguiente comando:**
   ```bash
   pip install -r requirements.txt

## Ejecución del Test
1. **Desde la carpeta raíz del proyecto abre una terminal.**
2. **Ejecuta el siguiente comando para correr el test utilizando Robot Framework:**
   ```bash
   robot -i complete_flow -d Results Tests/navigation_test.robot

### Resultados de la Ejecución

Los resultados se guardarán en la carpeta **`Results`**, incluyendo:

- **`report.html`**: Reporte de la ejecución de las pruebas.
- **`log.html`**: Log detallado de la ejecución, incluyendo pasos, tiempo de ejecución y errores.
- **`Screenshot/`**: Carpeta que contiene capturas de pantalla tanto de la pantalla de Home y al acceder a una tab. 

En caso de fallo, Robot Framework guarda automáticamente una captura de pantalla en el paso específico donde ocurrió el error



## Manejo de Excepciones y Errores

El proyecto utiliza bloques **`TRY`**, **`EXCEPT`** y **`FINALLY`** para manejar errores de manera controlada:

- **En caso de error**, se captura un log detallado con información descriptiva.
- **Las capturas de pantalla** se generan automáticamente para facilitar la identificación del problema.



### 2. **Explicación sobre el método "Selenium is initialized"**
El siguiente bloque de código:

```robot
Selenium is initialized
    Set Selenium Speed    ${SELENIUM_SPEED}
    Set Selenium Timeout  ${SELENIUM_TIMEOUT}
```
Está diseñado para configurar los parámetros de Selenium antes de realizar cualquier acción en la página. Set Selenium Speed ajusta la velocidad de las acciones realizadas por Selenium (por ejemplo, para hacer que los clics o desplazamientos sean más lentos, lo que puede ser útil para pruebas visuales). Set Selenium Timeout establece el tiempo máximo de espera para que Selenium intente localizar un elemento en la página antes de fallar.




## Uso del Page Object Model (POM)

Este proyecto está estructurado utilizando el patrón **Page Object Model (POM)** para separar la lógica de negocio de los elementos de la interfaz de usuario:

- **Selectores de Elementos:** Los selectores de los elementos de la página se encuentran en **`Resources/PageObjects/contactenosTabPO.robot`**.
- **Métodos Reutilizables:** Los métodos para interactuar con estos elementos están definidos en **`Resources/common.robot`** y son reutilizables en el test.



## Ejemplo de POM en este Proyecto

Este proyecto implementa el patrón **Page Object Model (POM)** de la siguiente manera:

- **`contactenosTabPO.robot`**: Define los elementos del formulario de contacto en la página **"Contactenos"**. Esto incluye:
  - El campo de nombre del usuario.
  - El campo de correo electrónico.
  - El campo de mensaje.
  - El botón de envío.

- **`common.robot`**: Contiene los métodos reutilizables para:
  - **Inicializar Selenium.**
  - **Abrir el navegador y maximizar la ventana.**
  - **Acceder a las tabs de la pagina Club Promerica.**




## Uso de Formato Gherkin

El test está diseñado utilizando un formato similar a **Gherkin** para mejorar la legibilidad y comprensión de los pasos del flujo de prueba. Los pasos del test están claramente definidos con palabras clave como:

- **`Given`**: Para describir el estado inicial del test.
- **`When`**: Para describir las acciones realizadas por el usuario.
- **`Then`**: Para describir las verificaciones y validaciones.

### 📌 Ejemplo:
```robot
Given The user opens club promerica page
When User access Tab     ${TAB_PROMO_DESCUENTO}    ${BENEFICIOS_EPIC_IMAGE}
Then User access Tab    ${TAB_CONTACTENOS}     ${VALIDACION_CONTACTENOS_TAB}
```


## Esperas en Robot Framework

En Robot Framework, muchos de los métodos integrados, como **`Wait Until Page Contains Element`**, ya tienen embebida la funcionalidad de esperar a que el elemento esté presente en la página antes de continuar con la siguiente acción. 

Por ejemplo, el siguiente método:

```robot
Wait Until Page Contains Element    ${tab_xpath}    timeout=10s
```

Este comando espera hasta que el elemento especificado por el XPath (${tab_xpath}) sea encontrado en la página dentro del tiempo de espera definido (en este caso, 10 segundos). Si el elemento no se encuentra en ese tiempo, el comando fallará, lo que permite manejar de manera eficiente las esperas sin necesidad de configurar explícitamente Implicit o Explicit Waits como en Selenium con Java.

Esto hace que las pruebas sean más estables, ya que no es necesario configurar explícitamente las esperas como en Selenium con Java, donde se pueden usar WebDriverWait y otras estrategias como Implicit Waits.



## Cómo Revisar el Reporte de Ejecución

1. **Abrir el Reporte:**  
   - Abre el archivo **`Results/report.html`** en un navegador para revisar el resumen del test.

2. **Verificar Resultados:**  
   - Asegúrate de que todas las pruebas estén marcadas como **`PASSED`**.

3. **Revisar Errores:**  
   - En caso de error, abre el archivo **`Results/log.html`** para obtener detalles completos sobre el fallo.

4. **Capturas de Pantalla:**  
   - Las capturas de pantalla por fallos en la ejecución se almacenan en **Results** mientras que las configuradas desde el mismo test como la de Home Page y las tabs se guardan en **Results/Screenshot** 



## Nota

- **Cambiar a Navegador Headless:**  
  - Puedes cambiar el navegador a **"headless"** (sin interfaz gráfica) modificando la variable `${BROWSER}` a **`headlesschrome`** en el archivo **`common.robot`**. la deje comentada por si deseas probar.



¡Gracias por revisar este proyecto! Si tienes alguna pregunta, no dudes en contactarme.
