# Ceres

## 1. Descripción del Proyecto
Ceres es una aplicación web desarrollada con ASP.NET Web Forms y VB.NET. Su propósito principal es servir como una plataforma de gestión e interacción de datos, conectándose a servicios web (WCF) para el procesamiento y generación de reportes utilizando Microsoft Report Viewer.

## 2. Tech Stack (Pila Tecnológica)
Basado en el código fuente y las dependencias, el proyecto utiliza las siguientes tecnologías:
* **Framework:** .NET Framework 4.5.2
* **Lenguaje:** Visual Basic .NET (VB.NET)
* **Arquitectura:** ASP.NET Web Forms
* **Servicios:** WCF Client (Windows Communication Foundation) para la conexión a servicios SOAP (`wsCeres.svc`).
* **Frontend:**
  * Bootstrap 3.0.0
  * jQuery 1.10.2
  * Modernizr 2.6.2
* **Reportes:** Microsoft Report Viewer WebForms (v12.0)
* **Gestión de paquetes:** NuGet (`packages.config`)
* **Optimización Web:** Microsoft ASP.NET Web Optimization (Bundling & Minification)

## 3. Instalación Local y Configuración

### Pre-requisitos
* **Visual Studio 2015, 2017, 2019 o 2022** (Se recomienda usar la carga de trabajo de "Desarrollo de ASP.NET y web").
* **.NET Framework 4.5.2 Developer Pack** instalado en tu máquina.
* Acceso a los endpoints del servicio web configurados en la aplicación (WCF).

### Pasos para la instalación
1. **Clonar el repositorio:**
   ```bash
   git clone <url-del-repositorio>
   cd <nombre-de-la-carpeta>
   ```

2. **Abrir el proyecto:**
   Abre el archivo de la solución `Ceres.sln` con Visual Studio.

3. **Restaurar paquetes NuGet:**
   Al abrir la solución, Visual Studio debería restaurar los paquetes automáticamente. Si no es así:
   * Ve a **Herramientas (Tools)** > **Administrador de paquetes NuGet (NuGet Package Manager)** > **Consola del administrador de paquetes (Package Manager Console)**.
   * Ejecuta el comando: `Update-Package -Reinstall` o simplemente haz clic derecho sobre la solución en el Explorador de Soluciones y selecciona "Restaurar paquetes NuGet".

4. **Configuración de Variables de Entorno y WCF:**
   Abre el archivo `Ceres/Web.config`. Deberás actualizar el endpoint del cliente WCF si estás probando en un entorno local distinto.
   Busca la sección `<client>`:
   ```xml
   <client>
     <endpoint address="http://localhost:0000/wsCeres.svc"
               binding="basicHttpBinding"
               bindingConfiguration="CeresMainBnd"
               contract="IwsCeres"
               name="Basic" />
   </client>
   ```
   Cambia `http://localhost:0000/wsCeres.svc` a la URL correcta del entorno (Desarrollo, QA, o Producción) proporcionado para `wsCeres`.

5. **Compilar el proyecto:**
   Presiona `Ctrl + Shift + B` en Visual Studio o ve al menú **Compilar (Build)** y selecciona **Compilar solución (Build Solution)**.

   Alternativamente, puedes usar `MSBuild` en línea de comandos:
   ```bash
   msbuild Ceres.sln
   ```

## 4. Estructura del Repositorio

El proyecto tiene una estructura clásica de ASP.NET Web Forms:

* `/Ceres` - Carpeta principal de la aplicación web.
  * `/App_Code/` - Carpeta estándar para el código fuente de utilidades o clases globales.
  * `/App_Data/` - Carpeta para archivos de base de datos locales (si aplica).
  * `/App_Start/` - Contiene configuraciones iniciales como rutas y `BundleConfig` (archivos JS y CSS).
  * `/Content/` - Archivos de hojas de estilo (CSS) como Bootstrap y estilos propios del sitio.
  * `/Scripts/` - Scripts JavaScript, incluyendo jQuery, Bootstrap, Modernizr.
  * `/Images/` - Activos gráficos e imágenes estáticas.
  * `/fonts/` - Fuentes web (e.g., Glyphicons de Bootstrap).
  * `Web.config` - Archivo de configuración central de la aplicación (conexiones, configuraciones de servidor, endpoints WCF).
  * `packages.config` - Lista de dependencias gestionadas mediante NuGet.
  * `Default.aspx` - Página de inicio predeterminada.
  * `Site.Master` / `Site.Mobile.Master` - Páginas maestras que definen el layout común del sitio web.

## 5. Guía Básica de Uso

Para ejecutar el proyecto en tu entorno local:

1. **Seleccionar proyecto de inicio:** Asegúrate de que `Ceres` esté marcado como proyecto de inicio (clic derecho sobre el proyecto en el explorador de soluciones -> **Establecer como proyecto de inicio**).
2. **Ejecutar:** Presiona `F5` para compilar e iniciar la aplicación con depuración (o `Ctrl + F5` sin depuración). Esto iniciará IIS Express y abrirá tu navegador predeterminado (normalmente en `http://localhost:<puerto>`).
3. **Navegación:** La aplicación cargará la página `Default.aspx` encapsulada por el diseño provisto en `Site.Master`.

Si ocurren errores relacionados con el proveedor de reportes o compiladores Roslyn, asegúrate de haber ejecutado la restauración de paquetes de NuGet de forma satisfactoria para instalar correctamente `Microsoft.Net.Compilers` y los assemblies correspondientes a `Microsoft.ReportViewer`.
