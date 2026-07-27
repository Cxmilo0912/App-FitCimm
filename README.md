
# Sistema de Gestión de Gimnasio «FitCIMM»


**Proyecto:** FitCIMM  
**Institución:** SENA — Centro Industrial de Mantenimiento y Manufactura (CIMM)  
**Programa:** Tecnólogo en Análisis y Desarrollo de Software (ADSO)  
**Año:** 2026  
**Descripción:** FitCIMM es una aplicación web diseñada para el gimnasio ubicado en Paipa, creada para reemplazar el uso de cuadernos físicos y archivos de Excel en la gestión diaria. Su objetivo principal es optimizar el control de socios, la venta de membresías y el registro de accesos a las instalaciones. Entre sus características principales destacan la verificación en tiempo real de la vigencia de las membresías en recepción para evitar accesos sin pagar, la gestión centralizada de socios y planes para prevenir la pérdida de renovaciones mensuales, y un panel administrativo que permite consultar de forma clara el número de socios activos y la recaudación financiera del mes.

---

### MOTOR DE BASE DE DATOS ELEGIDO
MySQL - phpMyAdmin (modo script)

---

### PRERREQUISITOS
- JDK 17 o superior
- Apache Tomcat 10.x (Java EE 7web)
- Maven 3.8+
- IDE: NetBeans
- XAMPP (Apache, MySQL)

---

### PASOS DE INSTALACION DEL APLICATIVO
1. Clonar el repositorio: `git clone https://github.com/Cxmilo0912/App-FitCimm.git`
2. Abrir XAMPP y acceder a phpMyAdmin.
3. Crear la base de datos con el nombre `fitcimm`.
4. En la base de datos, dirigirse al apartado de **Importar**, seleccionar el archivo `.sql` y dar clic en **Continuar**.
5. Abrir NetBeans → **File** → **Open Project** → seleccionar la carpeta del proyecto.
6. Clic derecho en el proyecto → **Clean and Build**.
7. Asegurarse de tener Tomcat 10 configurado en NetBeans:  
   `Tools` → `Servers` → `Add Server` → `Apache Tomcat or TomEE`.
8. Clic derecho en el proyecto → **Run** (Deploy on Tomcat).
9. Abrir el navegador en: `http://localhost:8080/FitCimm/`

---
### MÓDULOS DEL SISTEMA
---
- `/index.jsp` → Página principal (Home con acceso a los apartados del aplicativo)
<img width="1600" height="869" alt="WhatsApp Image 2026-07-27 at 16 27 20" src="https://github.com/user-attachments/assets/5101dc22-e122-4f07-930f-562f5aeaeead" />
- `/Socio` → CRUD completo de Socio
<img width="1600" height="690" alt="image" src="https://github.com/user-attachments/assets/d3be944e-c7ae-46c3-bae6-b32cd4acba7a" />
- `/Socio` → Funciones (Editar,Borrado Lógico e Historial) en apartado de acciones de la tabla
<img width="1600" height="762" alt="image" src="https://github.com/user-attachments/assets/491932d0-3312-4bea-8808-9c220ff3c0db" />
- `/Ingreso` → Módulo de control de acceso (Ingreso al gym por documento e historial de ingresos diarios)
<img width="1600" height="873" alt="image" src="https://github.com/user-attachments/assets/b42bc3ef-7adf-41f4-9e18-6e2e56015323" />
- `/Plan` → CRUD completo de planes
- <img width="1600" height="645" alt="WhatsApp Image 2026-07-27 at 16 37 32" src="https://github.com/user-attachments/assets/67416729-d02a-4947-8656-7b4b6767df32" />
- `/Plan` → Funciones (Editar,Borrado Lógico) en apartado de acciones de la tabla
<img width="1600" height="538" alt="image" src="https://github.com/user-attachments/assets/6e26d022-c7c1-447b-a681-7dc1e4c22c1b" />
- `/Membresia` → CRUD completo de membresia
<img width="1600" height="894" alt="WhatsApp Image 2026-07-27 at 16 39 12" src="https://github.com/user-attachments/assets/e28c2979-5ec8-4db4-983e-6e0dfafe3ed4" />
- `/Membresia` →  Funciones (Renovar membresia) en apartado de acciones de la tabla
<img width="1600" height="786" alt="image" src="https://github.com/user-attachments/assets/33058c2b-7a4f-4249-a7bb-2113c6e0776e" />
- `/Plan` →  Módulo adicional de plan (Reportes del sistema)
<img width="1600" height="708" alt="image" src="https://github.com/user-attachments/assets/156319f8-1944-49b7-91fb-7b5b41cc51c7" />
<img width="1600" height="805" alt="image" src="https://github.com/user-attachments/assets/7f4fbb79-1cfc-40e0-a296-495f574a5ff0" />








  


