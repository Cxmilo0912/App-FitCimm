<%-- 
    Document   : Membresia
    Created on : 23/07/2026, 1:59:33 p. m.
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Gestión de Membresías - Partner Manager</title>

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

            /* CONTENEDOR DE CONTENIDO */
            .content-container {
                flex: 1;
                overflow-y: auto;
                padding: 32px;
                display: flex;
                flex-direction: column;
                max-width: 1100px;
                width: 100%;
                margin: 0 auto;
                gap: 24px;
            }

            .page-actions-bar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background: var(--bg-surface);
                padding: 20px 24px;
                border-radius: 12px;
                border: 1px solid #e2e8f0;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            }

            .page-actions-bar h2 {
                font-size: 18px;
                font-weight: 700;
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
                text-decoration: none;
                transition: all 0.2s;
            }

            .btn-primary:hover {
                background-color: var(--primary-hover);
                box-shadow: 0 4px 10px rgba(37, 99, 235, 0.35);
            }

            /* TABLA DE DATOS */
            .table-card {
                background: var(--bg-surface);
                border-radius: 12px;
                border: 1px solid #e2e8f0;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
                overflow: hidden;
            }

            .table-responsive {
                width: 100%;
                overflow-x: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                text-align: left;
                font-size: 14px;
            }

            th {
                background-color: #0f172a;
                color: white;
                font-family: 'JetBrains Mono', monospace;
                font-size: 11px;
                text-transform: uppercase;
                letter-spacing: 0.05em;
                padding: 14px 20px;
            }

            td {
                padding: 16px 20px;
                border-bottom: 1px solid #e2e8f0;
                color: var(--text-main);
            }

            tr:last-child td {
                border-bottom: none;
            }

            tr:hover td {
                background-color: #f8fafc;
            }

            .mono {
                font-family: 'JetBrains Mono', monospace;
                color: var(--text-muted);
                font-size: 13px;
            }

            /* BADGES */
            .badge {
                display: inline-flex;
                align-items: center;
                padding: 4px 10px;
                font-size: 11px;
                font-weight: 700;
                border-radius: 9999px;
                text-transform: uppercase;
                letter-spacing: 0.05em;
            }

            .badge-vigente {
                background-color: #dcfce7;
                color: #166534;
                border: 1px solid #bbf7d0;
            }

            .badge-vencida {
                background-color: #fee2e2;
                color: #991b1b;
                border: 1px solid #fecaca;
            }

            /* BOTÓN RENOVACIÓN */
            .btn-renew {
                background-color: #fef3c7;
                color: #92400e;
                border: 1px solid #fde68a;
                padding: 6px 12px;
                font-size: 12px;
                font-weight: 600;
                border-radius: 6px;
                cursor: pointer;
                display: inline-flex;
                align-items: center;
                gap: 4px;
                transition: all 0.2s;
            }

            .btn-renew:hover {
                background-color: #fde68a;
            }

            .text-center {
                text-align: center;
            }
            /* ==========================================================================
       ESTILOS DEL MODAL DE RENOVACION
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

            .form-control:disabled {
                background-color: #f1f5f9;
                color: var(--text-muted);
                cursor: not-allowed;
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
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.8/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="${pageContext.request.contextPath}/js/sweetAlert.js"></script>
    </head>

    <body>

        <jsp:include page="/WEB-INF/Vistas/Menu.jsp" />
        <!-- Contenedor Principal -->
        <main class="main-wrapper">



            <!-- Canvas de Contenido -->
            <div class="content-container">

                <!-- Barra de Acciones / Título -->
                <div class="page-actions-bar">
                    <div>
                        <h2>Listado de Membresías</h2>
                        <p style="font-size: 13px; color: var(--text-muted); margin-top: 2px;">Gestione y renueve los planes de los socios activos.</p>
                    </div>
                    <a class="btn-primary" href="${pageContext.request.contextPath}/MembresiaController?accion=nuevo">
                        <span class="material-symbols-outlined" style="font-size: 20px;">add</span>
                        Nueva Membresía
                    </a>
                </div>

                <!-- Tarjeta de Tabla -->
                <div class="table-card">
                    <div class="table-responsive">
                        <table id="tablaMembresias">
                            <thead>
                                <tr>
                                    <th>Documento Socio</th>
                                    <th>Nombre del Socio</th>
                                    <th>Plan Asignado</th>
                                    <th>Válido Hasta</th>
                                    <th>Estado</th>
                                    <th class="text-center">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="m" items="${membresias}">
                                    <tr>
                                        <td class="mono">${m.documento}</td>
                                        <td style="font-weight: 600;">${m.nombres} ${m.apellidos}</td>
                                        <td>Plan ${m.plan}</td>
                                        <td class="mono">${m.fechaFin}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${m.estadoMembresia == 'VIGENTE'}">
                                                    <span class="badge badge-vigente">Vigente</span>
                                                </c:when>
                                                <c:when test="${m.estadoMembresia == 'VENCIDA'}">
                                                    <span class="badge badge-vencida">Vencida</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge">${m.estadoMembresia}</span>
                                                </c:otherwise>
                                            </c:choose>   
                                        </td>
                                        <td class="text-center">
                                            <button type="button" class="btn-renew"
                                                    onclick="abrirModalRenovar('${m.id}', '${m.nombres} ${m.apellidos}')">
                                                <span class="material-symbols-outlined" style="font-size: 16px;">sync</span> Renovar
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </main>

        <!-- ==========================================================================
             MODAL DE RENOVACION DE MEMBRESIA
             ========================================================================== -->
        <div class="modal-overlay" id="modalRenovar">
            <div class="modal-card">
                <div class="modal-header">
                    <h3>Renovar Membresía</h3>
                    <button type="button" class="icon-btn" onclick="cerrarModalRenovar()">
                        <span class="material-symbols-outlined">close</span>
                    </button>
                </div>

                <form id="formRenovar" action="${pageContext.request.contextPath}/MembresiaController" method="post">
                    <div class="modal-body">

                        <input type="hidden" name="accion" value="renovar"/>
                        <input type="hidden" name="id" id="renovarDocumento"/>


                        <div class="form-group">
                            <label>Socio</label>
                            <input type="text" class="form-control" id="renovarNombreSocio" disabled/>
                        </div>

                        <div class="form-group">
                            <label for="renovarPlan">Plan</label>
                            <select class="form-control" name="Plan" id="renovarPlan" required>
                                <option value="">Seleccione un plan...</option>
                                <c:forEach var="p" items="${planes}">
                                    <option value="${p.id}">${p.nombre} - ${p.duracionDias} dia(s)</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="renovarFechaInicio">Fecha Inicio</label>
                            <input type="date" class="form-control" name="fechaInicio" id="renovarFechaInicio" required/>
                        </div>

                        <div class="form-group">
                            <label for="renovarFechaFin">Total Pagado</label>
                            <input type="number" step="0.01" class="form-control" name="totalPagado" id="renovarFechaFin" required/>
                        </div>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn-secondary" onclick="cerrarModalRenovar()">Cancelar</button>
                        <button type="submit" class="btn-primary">
                            <span class="material-symbols-outlined" style="font-size: 18px;">sync</span>
                            Confirmar Renovación
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $('#tablaMembresias').DataTable({
                    paging: true,

                    language: {
                        url: 'https://cdn.datatables.net/plug-ins/1.13.8/i18n/es-ES.json'
                    }
                });
            });

            function abrirModalRenovar(id, nombreCompleto) {
                document.getElementById('renovarDocumento').value = id;
                document.getElementById('renovarNombreSocio').value = nombreCompleto;


                document.getElementById('modalRenovar').style.display = 'flex';
            }

            function cerrarModalRenovar() {
                document.getElementById('modalRenovar').style.display = 'none';
                document.getElementById('formRenovar').reset();
            }



        </script>
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
