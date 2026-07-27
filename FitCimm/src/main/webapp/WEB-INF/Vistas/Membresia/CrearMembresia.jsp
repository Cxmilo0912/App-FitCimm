<%-- 
    Document   : CrearMembresia
    Created on : 23/07/2026, 7:52:31 p. m.
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title id="pageTitle">Procesar Membresía - Partner Manager</title>

        <!-- Tipografía Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>

        <style>
            :root {
                --bg-main: #f8fafc;            /* Slate 50 */
                --bg-surface: #ffffff;         /* Blanco */
                --sidebar-bg: #0f172a;         /* Slate 900 */
                --sidebar-hover: #1e293b;      /* Slate 800 */

                --primary: #2563eb;            /* Blue 600 */
                --primary-hover: #1d4ed8;      /* Blue 700 */
                --primary-light: #eff6ff;      /* Blue 50 */
                --primary-border: #bfdbfe;     /* Blue 200 */

                --text-main: #0f172a;          /* Slate 900 */
                --text-muted: #64748b;         /* Slate 500 */
                --text-white: #ffffff;

                --border-color: #cbd5e1;       /* Slate 300 */
                --border-focus: #2563eb;       /* Blue 600 */

                --shadow-sm: 0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1);
                --shadow-input-focus: 0 0 0 3px rgba(37, 99, 235, 0.15);
                --radius: 8px;
            }

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'Plus Jakarta Sans', sans-serif;
                background-color: var(--bg-main);
                color: var(--text-main);
                display: flex;
                height: 100vh;
                overflow: hidden;
            }

            /* BARRA LATERAL (Sidebar) */
            .sidebar {
                width: 260px;
                background-color: var(--sidebar-bg);
                display: flex;
                flex-direction: column;
                padding: 24px 16px;
                flex-shrink: 0;
            }

            .brand {
                padding: 0 12px 24px 12px;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
                margin-bottom: 24px;
            }

            .brand-title {
                font-size: 20px;
                font-weight: 700;
                color: var(--text-white);
                letter-spacing: -0.02em;
            }



            .brand-subtitle {
                font-family: 'JetBrains Mono', monospace;
                font-size: 11px;
                color: #38bdf8;
                text-transform: uppercase;
                letter-spacing: 0.05em;
                margin-top: 4px;
            }

            .nav-menu {
                display: flex;
                flex-direction: column;
                gap: 6px;
                flex: 1;
            }

            .nav-item {
                display: flex;
                align-items: center;
                gap: 12px;
                padding: 12px 16px;
                color: #94a3b8;
                text-decoration: none;
                font-size: 14px;
                font-weight: 500;
                border-radius: var(--radius);
                transition: all 0.2s ease;
            }

            .nav-item:hover {
                background-color: var(--sidebar-hover);
                color: var(--text-white);
            }

            .nav-item.active {
                background-color: var(--primary);
                color: var(--text-white);
                box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3);
            }

            .nav-item.logout {
                margin-top: auto;
            }

            /* ESTRUCTURA PRINCIPAL Y HEADER */
            .main-wrapper {
                flex: 1;
                display: flex;
                flex-direction: column;
                overflow: hidden;
            }

            .top-header {
                height: 70px;
                background-color: var(--bg-surface);
                border-bottom: 1px solid #e2e8f0;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0 32px;
            }

            .header-title {
                font-size: 18px;
                font-weight: 700;
                color: var(--text-main);
            }

            .header-actions {
                display: flex;
                align-items: center;
                gap: 16px;
            }

            .icon-btn {
                background: transparent;
                border: 1px solid #e2e8f0;
                color: var(--text-muted);
                width: 40px;
                height: 40px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: all 0.2s;
            }

            .icon-btn:hover {
                background-color: var(--primary-light);
                color: var(--primary);
                border-color: var(--primary-border);
            }

            .profile-avatar {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                object-fit: cover;
                border: 2px solid var(--primary-border);
            }

            /* CONTENEDOR DEL FORMULARIO */
            .content-container {
                flex: 1;
                overflow-y: auto;
                padding: 32px;
                display: flex;
                flex-direction: column;
                max-width: 900px;
                width: 100%;
                margin: 0 auto;
            }

            .back-link {
                display: inline-flex;
                align-items: center;
                gap: 6px;
                color: var(--text-muted);
                text-decoration: none;
                font-size: 13px;
                font-weight: 600;
                margin-bottom: 16px;
                transition: color 0.2s;
            }

            .back-link:hover {
                color: var(--primary);
            }

            .form-card {
                background: var(--bg-surface);
                border-radius: 12px;
                border: 1px solid #e2e8f0;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
                padding: 32px;
            }

            .form-header {
                border-bottom: 1px solid #e2e8f0;
                padding-bottom: 20px;
                margin-bottom: 28px;
            }

            .form-header h1 {
                font-size: 24px;
                font-weight: 700;
                letter-spacing: -0.01em;
                color: var(--text-main);
            }

            .form-header p {
                font-size: 14px;
                color: var(--text-muted);
                margin-top: 4px;
            }

            .form-grid {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 20px 24px;
            }

            @media (max-width: 640px) {
                .form-grid {
                    grid-template-columns: 1fr;
                }
            }

            .field-group {
                display: flex;
                flex-direction: column;
                gap: 6px;
            }

            .field-group.full-width {
                grid-column: 1 / -1;
            }

            .input-label {
                font-size: 12px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.04em;
                color: #475569;
            }

            .input-control {
                width: 100%;
                height: 44px;
                padding: 0 14px;
                font-family: inherit;
                font-size: 14px;
                color: var(--text-main);
                background-color: #f8fafc;
                border: 1.5px solid var(--border-color);
                border-radius: var(--radius);
                outline: none;
                box-shadow: var(--shadow-sm);
                transition: all 0.2s ease-in-out;
            }

            .input-control.mono {
                font-family: 'JetBrains Mono', monospace;
            }

            .input-control:hover {
                background-color: #ffffff;
                border-color: #94a3b8;
            }

            .input-control:focus {
                background-color: #ffffff;
                border-color: var(--border-focus);
                box-shadow: var(--shadow-input-focus);
            }

            /* SELECCIÓN DE PLANES */
            .plans-container {
                grid-column: 1 / -1;
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 16px;
            }

            @media (max-width: 640px) {
                .plans-container {
                    grid-template-columns: 1fr;
                }
            }

            .plan-card {
                border: 1.5px solid var(--border-color);
                background-color: #f8fafc;
                border-radius: var(--radius);
                padding: 16px;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                cursor: pointer;
                transition: all 0.2s;
            }

            .plan-card:hover {
                border-color: var(--primary);
                background-color: #ffffff;
            }

            .plan-top {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 12px;
            }

            .plan-name {
                font-size: 13px;
                font-weight: 600;
                color: var(--text-main);
            }

            .plan-price {
                font-size: 16px;
                font-weight: 700;
                font-family: 'JetBrains Mono', monospace;
            }

            .plan-duration {
                font-size: 12px;
                color: var(--text-muted);
            }

            /* CAMPOS DE FECHA */
            .date-readonly {
                background-color: var(--primary-light);
                border-color: var(--primary-border);
                color: var(--primary);
                font-weight: 700;
                cursor: not-allowed;
            }

            /* ACCIONES */
            .form-actions {
                grid-column: 1 / -1;
                display: flex;
                justify-content: flex-end;
                gap: 12px;
                margin-top: 12px;
                padding-top: 24px;
                border-top: 1px solid #e2e8f0;
            }

            .btn-secondary {
                background-color: var(--bg-surface);
                color: var(--text-main);
                border: 1px solid var(--border-color);
                padding: 10px 20px;
                font-size: 14px;
                font-weight: 600;
                border-radius: var(--radius);
                cursor: pointer;
                transition: all 0.2s;
            }

            .btn-secondary:hover {
                background-color: var(--bg-main);
                border-color: #94a3b8;
            }

            .btn-primary {
                background-color: var(--primary);
                color: var(--text-white);
                border: none;
                padding: 10px 24px;
                font-size: 14px;
                font-weight: 600;
                border-radius: var(--radius);
                cursor: pointer;
                box-shadow: 0 2px 4px rgba(37, 99, 235, 0.2);
                transition: all 0.2s;
            }

            .btn-primary:hover {
                background-color: var(--primary-hover);
                box-shadow: 0 4px 10px rgba(37, 99, 235, 0.35);
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="${pageContext.request.contextPath}/js/sweetAlert.js"></script>
    </head>

    <body>
        <c:if test="${not empty errorMsg}">
            <div style="background: #fee2e2; color: #991b1b; padding: 12px; border-radius: 8px; margin-bottom: 16px;">
                <strong>Error:</strong> ${errorMsg}
            </div>
        </c:if>

        <jsp:include page="/WEB-INF/Vistas/Menu.jsp" />
        <!-- Contenedor Principal -->
        <div class="main-wrapper">



            <!-- Canvas de Contenido -->
            <main class="content-container">

                <div>
                    <a class="back-link" href="${pageContext.request.contextPath}/MembresiaController?accion=menu">
                        <span class="material-symbols-outlined">arrow_back</span>
                        Volver al Listado
                    </a>
                </div>

                <!-- Tarjeta del Formulario -->
                <div class="form-card">
                    <div class="form-header">
                        <h1 id="formHeading">Registrar Nueva Membresía</h1>
                        <p id="formSubheading">Seleccione un socio y asigne un plan comercial con cálculo automático de vigencia.</p>
                    </div>

                    <form class="form-grid" id="membershipForm" action="MembresiaController?accion=registrar" method="POST">

                        <!-- Selección de Socio -->
                        <div class="field-group full-width">
                            <label class="input-label" for="selectSocio">Seleccionar Socio</label>

                            <select class="input-control" id="selectSocio" name="idSocio" required>
                                <option value="" disabled selected>-- Seleccione un socio registrado --</option>
                                <c:forEach var="s" items="${socios}">
                                    <option  value="${s.id}">${s.documento} - ${s.nombres} ${s.apellidos}</option>
                                </c:forEach>

                            </select>

                        </div>

                        <!-- Selección de Plan Comercial -->
                        <div class="field-group full-width">
                            <label class="input-label">Plan Comercial</label>
                            <div class="plans-container">
                                <c:forEach var="p" items="${planes}">
                                    <label class="plan-card">
                                        <div>
                                            <div class="plan-top">
                                                <span class="plan-name">${p.nombre}</span>
                                                <input type="radio" name="plan" value="${p.id}"  required>
                                            </div>
                                            <div class="plan-price">$ ${p.valor}</div>
                                        </div>

                                        <span class="plan-duration" name="duracion">${p.duracionDias} dias de vigencia</span>
                                    </label>
                                </c:forEach>


                            </div>
                        </div>

                        <!-- Fechas de Inicio y Fin -->
                        <div class="field-group">
                            <label class="input-label" for="fechaInicio">Fecha de Inicio</label>
                            <input name="fechaInicio" class="input-control mono" id="fechaInicio" type="date"  required />
                        </div>

                        <div class="field-group">
                            <label class="input-label" for="valorpagado">Valor Pagado</label>
                            <input type="number" name="valorpagado" step="0.01" class="input-control mono"
                                   placeholder="999.00" />
                        </div>

                        <!-- Acciones -->
                        <div class="form-actions">

                            <button class="btn-primary" id="btnSubmit" type="submit">Guardar Membresía</button>
                        </div>
                    </form>
                </div>

            </main>
        </div>
         <%
            String error = (String) request.getAttribute("error");
            String success = (String) request.getAttribute("success");
            if (error != null && !error.isEmpty()) {
        %>
        <script>
            window.addEventListener('DOMContentLoaded', () => {
                sweetAlert.error("¡Error!", "<%= error%>");
            });
        </script>
        <%
        } else if (success != null && !success.isEmpty()) {
        %>
        <script>
            window.addEventListener('DOMContentLoaded', () => {
                sweetAlert.success("Éxito", "<%= success%>");
            });
        </script>
        <%
            }
        %>

    </body>
</html>