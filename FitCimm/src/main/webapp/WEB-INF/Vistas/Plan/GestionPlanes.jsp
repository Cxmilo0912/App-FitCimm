<%-- 
    Document   : GestionPlanes
    Created on : 23/07/2026, 12:41:13 p. m.
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Gestión de Planes - Partner Manager</title>

        <!-- Tipografías y Fuentes de Iconos -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet" />

        <style>
            /* ==========================================================================
            VARIABLES DE COLOR Y DISEÑO
            ========================================================================== */
            :root {
                --bg-main: #f8fafc;
                --bg-surface: #ffffff;
                --sidebar-bg: #0f172a;
                --sidebar-hover: #1e293b;

                --primary: #2563eb;
                --primary-hover: #1d4ed8;
                --primary-light: #eff6ff;
                --primary-border: #bfdbfe;

                --text-main: #0f172a;
                --text-muted: #64748b;
                --text-white: #ffffff;

                --border-color: #cbd5e1;
                --border-focus: #2563eb;

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

            /* ==========================================================================
            ESTRUCTURA PRINCIPAL Y HEADER
            ========================================================================== */
            .main-wrapper {
                flex: 1;
                display: flex;
                flex-direction: column;
                overflow: hidden;
            }

            .content-container {
                flex: 1;
                overflow-y: auto;
                padding: 32px;
                display: flex;
                flex-direction: column;
                max-width: 1280px;
                width: 100%;
                margin: 0 auto;
            }

            .page-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 28px;
            }

            .page-title h1 {
                font-size: 28px;
                font-weight: 700;
                letter-spacing: -0.02em;
                color: var(--text-main);
            }

            .page-title p {
                font-size: 14px;
                color: var(--text-muted);
                margin-top: 4px;
            }

            .btn-primary {
                background-color: var(--primary);
                color: var(--text-white);
                border: none;
                padding: 10px 20px;
                font-size: 14px;
                font-weight: 600;
                border-radius: var(--radius);
                cursor: pointer;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                box-shadow: 0 2px 4px rgba(37, 99, 235, 0.2);
                transition: all 0.2s;
                text-decoration: none;
            }

            .btn-primary:hover {
                background-color: var(--primary-hover);
                box-shadow: 0 4px 10px rgba(37, 99, 235, 0.35);
                color: var(--text-white);
            }

            /* ==========================================================================
            TABLA DE DATOS DE PLANES
            ========================================================================== */
            .table-card {
                background: var(--bg-surface);
                border-radius: 12px;
                border: 1px solid #e2e8f0;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
                overflow: hidden;
            }

            .table-wrapper {
                width: 100%;
                overflow-x: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                text-align: left;
            }

            thead {
                background-color: #0f172a;
                color: var(--text-white);
            }

            th {
                padding: 16px 24px;
                font-size: 12px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.05em;
            }

            tbody tr {
                border-bottom: 1px solid #e2e8f0;
                transition: background-color 0.15s ease;
            }

            tbody tr:hover {
                background-color: #f1f5f9;
            }

            td {
                padding: 18px 24px;
                font-size: 14px;
                color: var(--text-main);
            }

            .plan-badge-dot {
                width: 8px;
                height: 8px;
                border-radius: 50%;
                display: inline-block;
            }

            .dot-blue {
                background-color: #2563eb;
            }

            .price-tag {
                font-family: 'JetBrains Mono', monospace;
                font-weight: 600;
            }

            .action-group {
                display: flex;
                justify-content: flex-end;
                gap: 6px;
            }

            .btn-action {
                background: transparent;
                border: 1px solid transparent;
                color: var(--text-muted);
                width: 32px;
                height: 32px;
                border-radius: 6px;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: all 0.2s;
            }

            .btn-action:hover {
                background-color: var(--primary-light);
                color: var(--primary);
            }

            .btn-action.inactive:hover {
                background-color: #fef2f2;
                color: #dc2626;
            }

            /* ==========================================================================
            ESTILOS DEL MODAL DE EDICIÓN
            ========================================================================== */
            .modal-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(15, 23, 42, 0.6);
                backdrop-filter: blur(4px);
                display: none;
                align-items: center;
                justify-content: center;
                z-index: 1000;
            }

            .modal-card {
                background: var(--bg-surface);
                width: 100%;
                max-width: 480px;
                border-radius: 12px;
                box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                animation: modalSlideUp 0.3s ease;
            }

            @keyframes modalSlideUp {
                from {
                    transform: translateY(20px);
                    opacity: 0;
                }
                to {
                    transform: translateY(0);
                    opacity: 1;
                }
            }

            .modal-header {
                padding: 20px 24px;
                border-bottom: 1px solid #e2e8f0;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .modal-header h3 {
                font-size: 18px;
                font-weight: 700;
            }

            .modal-body {
                padding: 24px;
            }

            .form-group {
                margin-bottom: 16px;
            }

            .form-group label {
                display: block;
                font-size: 13px;
                font-weight: 600;
                margin-bottom: 6px;
                color: var(--text-main);
            }

            .form-control {
                width: 100%;
                padding: 10px 14px;
                font-size: 14px;
                border: 1px solid var(--border-color);
                border-radius: var(--radius);
                outline: none;
                transition: all 0.2s;
            }

            .form-control:focus {
                border-color: var(--border-focus);
                box-shadow: var(--shadow-input-focus);
            }

            .modal-footer {
                padding: 16px 24px;
                background-color: #f8fafc;
                border-top: 1px solid #e2e8f0;
                display: flex;
                justify-content: flex-end;
                gap: 10px;
            }

            .btn-secondary {
                background-color: transparent;
                border: 1px solid var(--border-color);
                color: var(--text-main);
                padding: 9px 16px;
                font-size: 14px;
                font-weight: 600;
                border-radius: var(--radius);
                cursor: pointer;
            }

            .btn-secondary:hover {
                background-color: #f1f5f9;
            }
        </style>
    </head>

    <body>

        <!-- 1. BARRA LATERAL IMPORTADA -->
        <jsp:include page="/WEB-INF/Vistas/Menu.jsp" />

        <!-- 2. CONTENEDOR PRINCIPAL -->
        <div class="main-wrapper">
            <main class="content-container">

                <!-- Cabecera de Página -->
                <div class="page-header">
                    <div class="page-title">
                        <h1>Gestión de Planes</h1>
                        <p>Administra los planes de suscripción ofrecidos a los partners.</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/PlanController?accion=nuevo" class="btn-primary">
                        <span class="material-symbols-outlined" style="font-size: 20px;">add</span>
                        Agregar Plan
                    </a>
                </div>

                <!-- Tarjeta Tabla de Planes -->
                <div class="table-card">
                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th style="width: 40%;">Nombre del Plan</th>
                                    <th style="width: 25%;">Duración (Días)</th>
                                    <th style="width: 20%;">Valor (COL)</th>
                                    <th style="width: 15%; text-align: right;">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${planes}">
                                    <tr>
                                        <td>
                                            <div style="display: flex; align-items: center; gap: 12px; font-weight: 600;">
                                                <span class="plan-badge-dot dot-blue"></span>
                                                <span>${p.nombre}</span>
                                            </div>
                                        </td>
                                        <td style="color: var(--text-muted);">${p.duracionDias}</td>
                                        <td class="price-tag">${p.valor}</td>
                                        <td>
                                            <div class="action-group">
                                                <!-- Botón que activa el modal pasando los datos del plan -->
                                                <button type="button" class="btn-action" title="Editar" 
                                                        onclick="abrirModalEditar('${p.id}', '${p.nombre}', '${p.duracionDias}', '${p.valor}')">
                                                    <span class="material-symbols-outlined" style="font-size: 18px;">edit</span>
                                                </button>

                                                <form action="PlanController" method="POST" style="display: inline;">
                                                    <input type="hidden" name="accion" value="inactivar">
                                                    <input type="hidden" name="id" value="${p.id}">
                                                    <button type="submit" class="btn-action inactive" title="Inactivar">
                                                        <span class="material-symbols-outlined" style="font-size: 18px;">block</span>
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>


                </div>

            </main>
        </div>

        <!-- ==========================================================================
        VENTANA MODAL PARA EDITAR PLAN
        ========================================================================== -->
        <div id="modalEditar" class="modal-overlay">
            <div class="modal-card">
                <form action="PlanController?accion=actualizar" method="POST">

                 

                    <input type="hidden" id="edit_id" name="id">

                    <div class="modal-header">
                        <h3>Editar Plan</h3>
                        <button type="button" class="btn-action" onclick="cerrarModalEditar()">
                            <span class="material-symbols-outlined">close</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="form-group">
                            <label for="edit_nombre">Nombre del Plan</label>
                            <input type="text" id="edit_nombre" name="plan_name" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="edit_duracion">Duración (Días)</label>
                            <input type="number" id="edit_duracion" name="plan_duration" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="edit_valor">Valor (COL)</label>
                            <input type="number" step="any" id="edit_valor" name="plan_value" class="form-control" required>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn-secondary" onclick="cerrarModalEditar()">Cancelar</button>
                        <button type="submit" class="btn-primary">Guardar Cambios</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            function abrirModalEditar(id, nombre, duracion, valor) {
                document.getElementById('edit_id').value = id;
                document.getElementById('edit_nombre').value = nombre;
                document.getElementById('edit_duracion').value = duracion;
                document.getElementById('edit_valor').value = valor;

                document.getElementById('modalEditar').style.display = 'flex';
            }

            function cerrarModalEditar() {
                document.getElementById('modalEditar').style.display = 'none';
            }
        </script>
    </body>
</html>