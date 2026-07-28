<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Listar Socios - Partner Manager</title>

        <!-- Tipografía Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>

        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css">   
        <style>
            /* ==========================================================================
               VARIABLES DE COLOR Y DISEÑO — solo modo claro
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

                --border-color: #e2e8f0;
                --border-focus: #3b82f6;

                --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
                --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1);
                --radius: 10px;
            }

            html {
                background-color: var(--bg-main);
                height: 100%;
            }

            /* Reset básico */
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
               BARRA LATERAL (Sidebar)
               ========================================================================== */
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

            /* ==========================================================================
               CONTENIDO PRINCIPAL Y HEADER
               ========================================================================== */
            .main-wrapper {
                flex: 1;
                display: flex;
                flex-direction: column;
                overflow: hidden;
            }

            .top-header {
                height: 70px;
                background-color: var(--bg-surface);
                border-bottom: 1px solid var(--border-color);
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0 32px;
            }

            .page-title-sm {
                font-size: 18px;
                font-weight: 600;
                color: var(--text-main);
            }

            .header-actions {
                display: flex;
                align-items: center;
                gap: 16px;
            }

            .icon-btn {
                background: transparent;
                border: 1px solid var(--border-color);
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

            /* Canvas Contenedor */
            .content-container {
                flex: 1;
                overflow-y: auto;
                padding: 32px;
                display: flex;
                flex-direction: column;
                gap: 24px;
            }

            .page-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
                gap: 16px;
            }

            .title-area h1 {
                font-size: 28px;
                font-weight: 700;
                letter-spacing: -0.02em;
                color: var(--text-main);
            }

            .title-area p {
                color: var(--text-muted);
                font-size: 14px;
                margin-top: 4px;
            }

            /* Botón Primario */
            .btn-primary {
                background-color: var(--primary);
                color: var(--text-white);
                border: none;
                padding: 10px 20px;
                font-size: 14px;
                font-weight: 600;
                border-radius: var(--radius);
                display: inline-flex;
                align-items: center;
                gap: 8px;
                cursor: pointer;
                box-shadow: 0 2px 4px rgba(37, 99, 235, 0.2);
                transition: all 0.2s;
            }

            .btn-primary:hover {
                background-color: var(--primary-hover);
                box-shadow: 0 4px 8px rgba(37, 99, 235, 0.3);
            }

            /* ==========================================================================
               FILTROS Y BÚSQUEDA
               ========================================================================== */
            .filter-card {
                background: var(--bg-surface);
                padding: 16px;
                border-radius: var(--radius);
                border: 1px solid var(--border-color);
                box-shadow: var(--shadow-sm);
            }

            .search-input-wrapper {
                position: relative;
                max-width: 480px;
            }

            .search-input-wrapper .material-symbols-outlined {
                position: absolute;
                left: 14px;
                top: 50%;
                transform: translateY(-50%);
                color: var(--text-muted);
                font-size: 20px;
            }

            .search-input {
                width: 100%;
                padding: 10px 16px 10px 42px;
                font-size: 14px;
                background-color: var(--bg-surface);
                color: var(--text-main);
                border: 1px solid var(--border-color);
                border-radius: var(--radius);
                outline: none;
                transition: border 0.2s;
            }

            .search-input:focus {
                border-color: var(--border-focus);
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
            }

            /* ==========================================================================
               TABLA DE DATOS
               ========================================================================== */
            .table-card {
                background: var(--bg-surface);
                border-radius: var(--radius);
                border: 1px solid var(--border-color);
                box-shadow: var(--shadow-sm);
                overflow: hidden;
            }

            .table-wrapper {
                overflow-x: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                text-align: left;
                font-size: 14px;
            }

            thead {
                background-color: var(--sidebar-hover);
                border-bottom: 1px solid var(--border-color);
            }

            th {
                padding: 14px 20px;
                font-size: 12px;
                font-weight: 700;
                text-transform: uppercase;
                color: var(--text-muted);
                letter-spacing: 0.04em;
            }

            td {
                padding: 16px 20px;
                border-bottom: 1px solid var(--border-color);
                color: var(--text-main);
            }

            tbody tr:last-child td {
                border-bottom: none;
            }

            tbody tr {
                transition: background-color 0.15s;
            }

            tbody tr:hover {
                background-color: var(--primary-light);
            }

            .doc-badge {
                font-family: 'JetBrains Mono', monospace;
                font-size: 13px;
                color: var(--text-main);
                background: var(--sidebar-hover);
                padding: 4px 8px;
                border-radius: 4px;
            }

            .td-muted {
                color: var(--text-muted);
            }

            /* ==========================================================================
               ESTILOS PARA LOS BADGES DE ESTADO DE MEMBRESÍA — solo modo claro
               ========================================================================== */
            .badge {
                display: inline-flex;
                align-items: center;
                padding: 4px 10px;
                font-size: 12px;
                font-weight: 600;
                border-radius: 6px;
                letter-spacing: 0.02em;
            }

            .bg-success {
                background-color: #dcfce7;
                color: #166534;
            }

            .bg-warning {
                background-color: #fef9c3;
                color: #854d0e;
            }

            .bg-danger {
                background-color: #fee2e2;
                color: #991b1b;
            }

            .btn-action {
                background: transparent;       /* Quita el fondo gris por defecto */
                border: 1px solid transparent; /* O un borde sutil si lo deseas */
                border-radius: 6px;            /* Esquinas redondeadas suaves */
                padding: 6px;                  /* Espaciado interno */
                cursor: pointer;               /* Cambia el cursor a una manita */
                display: inline-flex;
                align-items: center;
                justify-content: center;
                transition: background-color 0.2s ease;
            }

            /* Efecto al pasar el mouse por encima */
            .btn-action:hover {
                background-color: rgba(0, 0, 0, 0.05); /* Sombra ligera de hover */
            }

            /* Variante si quieres un toque rojo para el de inactivar/bloquear */
            .btn-action.inactive:hover {
                background-color: rgba(220, 53, 69, 0.1);
                color: #dc3545;
            }

            /*modal*/
            .modal-overlay {
                display: none; /* Oculto por defecto */
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.6);
                backdrop-filter: blur(4px);
                z-index: 1000;
                align-items: center;
                justify-content: center;
                padding: 16px;
            }

            .modal-card {
                background-color: var(--bg-surface);
                border: 1px solid var(--border-color);
                border-radius: var(--radius);
                width: 100%;
                max-width: 500px;
                box-shadow: var(--shadow-md);
                overflow: hidden;
                animation: modalScaleUp 0.25s ease forwards;
            }

            @keyframes modalScaleUp {
                from {
                    opacity: 0;
                    transform: scale(0.95);
                }
                to {
                    opacity: 1;
                    transform: scale(1);
                }
            }

            .modal-header {
                padding: 20px 24px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                border-bottom: 1px solid var(--border-color);
            }

            .modal-header h3 {
                font-size: 18px;
                font-weight: 600;
                color: var(--text-main);
            }

            .modal-body {
                padding: 24px;
                display: flex;
                flex-direction: column;
                gap: 16px;
                max-height: 70vh;
                overflow-y: auto;
            }

            .modal-footer {
                padding: 16px 24px;
                background-color: var(--sidebar-hover);
                border-top: 1px solid var(--border-color);
                display: flex;
                align-items: center;
                justify-content: flex-end;
                gap: 12px;
            }

            /* Campos de formulario dentro del modal */
            .form-group {
                display: flex;
                flex-direction: column;
                gap: 6px;
            }

            .form-group label {
                font-size: 13px;
                font-weight: 600;
                color: var(--text-muted);
            }

            .form-control {
                width: 100%;
                padding: 10px 14px;
                font-size: 14px;
                background-color: var(--bg-main);
                color: var(--text-main);
                border: 1px solid var(--border-color);
                border-radius: var(--radius);
                outline: none;
                transition: border-color 0.2s, box-shadow 0.2s;
            }

            .form-control:focus {
                border-color: var(--border-focus);
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
            }

            /* Botón secundario para cancelar */
            .btn-secondary {
                background-color: transparent;
                color: var(--text-muted);
                border: 1px solid var(--border-color);
                padding: 10px 16px;
                font-size: 14px;
                font-weight: 600;
                border-radius: var(--radius);
                cursor: pointer;
                transition: all 0.2s;
            }

            .btn-secondary:hover {
                background-color: var(--sidebar-hover);
                color: var(--text-main);
            }
        </style>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="${pageContext.request.contextPath}/js/sweetAlert.js"></script>
    </head>

    <body>

        <jsp:include page="/WEB-INF/Vistas/Menu.jsp"/>

        <c:if test="${not empty errorMsg}">
            <div style="background: #fee2e2; color: #991b1b; padding: 12px; border-radius: 8px; margin-bottom: 16px;">
                <strong>Error:</strong> ${errorMsg}
            </div>
        </c:if>

        <!-- Contenedor Principal -->
        <div class="main-wrapper">

            <!-- Canvas de Contenido -->
            <main class="content-container">

                <!-- Encabezado de Página & Acciones -->
                <div class="page-header">
                    <div class="title-area">
                        <h1>Listado de Socios</h1>
                        <p>Consulta, busca y gestiona la información general del padrón de socios activos.</p>
                    </div>
                    <a class="btn-primary" href="${pageContext.request.contextPath}/SocioController?action=nuevo" style="text-decoration: none">
                        <span class="material-symbols-outlined">add</span>
                        Agregar Socio
                    </a>
                </div>

                <!-- Área de Búsqueda -->
                <div class="filter-card">
                    <div class="search-input-wrapper">
                        <span class="material-symbols-outlined">search</span>
                        <input class="search-input" type="text" placeholder="Buscar por documento o apellido..."/>
                    </div>
                </div>

                <!-- Tabla de Datos -->
                <div class="table-card">
                    <div class="table-wrapper">
                        <table id="socioTabla">
                            <thead>
                                <tr>
                                    <th>Documento</th>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th>Fecha de Nacimiento</th>
                                    <th>Teléfono</th>
                                    <th>Correo Electrónico</th>
                                    <th>Estado de la Membresia</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${listaSocios}">
                                    <tr>
                                        <td>${item.documento}</td>
                                        <td>${item.nombres}</td>
                                        <td>${item.apellidos}</td>
                                        <td>${item.fecha_nacimiento}</td>
                                        <td>${item.telefono}</td>
                                        <td>${item.email}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${item.estadoMembresia == 'VIGENTE'}">
                                                    <span class="badge bg-success text-white px-2 py-1 rounded">Vigente</span>
                                                </c:when>
                                                <c:when test="${item.estadoMembresia == 'POR_VENCER'}">
                                                    <span class="badge bg-warning text-dark px-2 py-1 rounded">Por Vencer</span>
                                                </c:when>
                                                <c:when test="${item.estadoMembresia == 'VENCIDA'}">
                                                    <span class="badge bg-danger text-dark px-2 py-1 rounded">Vencida</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-info text-white px-2 py-1 rounded">Sin Membresia</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <div class="action-group">
                                                <!-- Botón que activa el modal pasando los datos del plan -->
                                                <button type="button" class="btn-action" title="Editar" 
                                                        onclick="abrirModalEditar('${item.Id}', '${item.documento}', '${item.nombres}', '${item.apellidos}', '${item.fecha_nacimiento}', '${item.telefono}', '${item.email}')">
                                                    <span class="material-symbols-outlined" style="font-size: 18px;">edit</span>
                                                </button>

                                                <form action="SocioController" method="POST" style="display: inline;">
                                                    <input type="hidden" name="id" value="${item.Id}">

                                                    <c:choose>
                                                        <c:when test="${item.activo == true}">
                                                            <input type="hidden" name="action" value="inactivar">
                                                            <button type="submit" class="btn-action active" title="Inactivar socio">
                                                                <span class="material-symbols-outlined" style="font-size: 18px; color: red;">block</span>
                                                            </button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="hidden" name="action" value="activar">
                                                            <button type="submit" class="btn-action inactive" title="Activar socio">
                                                                <span class="material-symbols-outlined" style="font-size: 18px; color: green;">check_circle</span>
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </form>
                                                <form action="SocioController" method="GET">
                                                    <input type="hidden" name="action" value="historial">
                                                    <input type="hidden" name="idHistorial" value="${item.Id}">
                                                    <button type="submit" class="btn-action" title="Historial de Membresias"> 
                                                        <span class="material-symbols-outlined" style="font-size: 18px; color: blue;">history</span>    
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <c:if test="${not empty errorMsg}">
                            <div style="background: #fee2e2; color: #991b1b; padding: 12px; border-radius: 8px; margin-bottom: 16px;">
                                <strong>Error:</strong> ${errorMsg}
                            </div>
                        </c:if>
                    </div>
                </div>

                <!-- Modal Editar -->
                <div id="modalEditar" class="modal-overlay">
                    <div class="modal-card">
                        <form action="SocioController?action=actualizar" method="POST">

                            <input type="hidden" id="edit_id" name="id">

                            <div class="modal-header">
                                <h3>Editar Socio</h3>
                                <!-- Cambiado para usar un botón estilizado limpio -->
                                <button type="button" class="btn-secondary" style="padding: 4px 8px;" onclick="cerrarModalEditar()">
                                    <span class="material-symbols-outlined" style="font-size: 18px; vertical-align: middle;">close</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="edit_document">Documento del Socio</label>
                                    <input  id="edit_document" name="partner_document" class="form-control" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="edit_names">Nombre del Socio</label>
                                    <input  id="edit_names" name="partner_names" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label for="edit_lastnames">Apellidos del Socio</label>
                                    <input  id="edit_lastnames" name="partner_lastnames" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label for="edit_lastnames">Fecha de Nacimiento del Socio</label>
                                    <input type="date" id="edit_date" name="partner_date" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label for="edit_cellnumber">Teléfono del Socio</label>
                                    <input  id="edit_cellnumber" name="partner_cellnumber" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label for="edit_email">Email del Socio</label>
                                    <input  id="edit_email" name="partner_email" class="form-control" >
                                </div>
                            </div>


                            <div class="modal-footer">
                                <button type="button" class="btn-secondary" onclick="cerrarModalEditar()">Cancelar</button>
                                <button type="submit" class="btn-primary">Guardar Cambios</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Modal Historial -->
                <div id="modalHistorial" class="modal-overlay">
                    <div class="modal-card" style="max-width: 700px;"> <!-- Un poco más ancho para que la tabla respire bien -->

                        <div class="modal-header">
                            <h3>Historial de Membresías</h3>
                            <button type="button" class="btn-secondary" style="padding: 4px 8px;" onclick="cerrarModalHistorial()">
                                <span class="material-symbols-outlined" style="font-size: 18px; vertical-align: middle;">close</span>
                            </button>
                        </div>

                        <div class="modal-body">
                            <!-- Contenedor con scroll por si el socio tiene muchas membresías registradas -->
                            <div style="max-height: 400px; overflow-y: auto;">
                                <table class="table" style="width: 100%; border-collapse: collapse; text-align: left;">
                                    <thead>
                                        <tr style="border-bottom: 2px solid #e0e0e0;">
                                            <th style="padding: 10px;">Nombre del Socio</th>
                                            <th style="padding: 10px;">Plan</th>
                                            <th style="padding: 10px;">Estado</th>
                                            <th style="padding: 10px;">Fecha Inicio</th>
                                            <th style="padding: 10px;">Fecha Fin</th>
                                            <th style="padding: 10px;">Valor Pagado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Recorremos la lista que mandaste desde el Servlet con JSTL -->
                                        <c:forEach var="h" items="${historialMembresias}">
                                            <tr style="border-bottom: 1px solid #f0f0f0;">
                                                <td style="padding: 10px;">${h.nombresSocio}</td>
                                                <td style="padding: 10px;">${h.nombrePlan}</td>
                                                <td style="padding: 10px;">
                                                    <!-- Opcional: una etiqueta dinámica para el estado -->
                                                    <span class="badge ${h.estadoMembresia == 'ACTIVA' ? 'badge-success' : 'badge-secondary'}">
                                                        ${h.estadoMembresia}
                                                    </span>
                                                </td>
                                                <td style="padding: 10px;">${h.fechaInicio}</td>
                                                <td style="padding: 10px;">${h.fechaFin}</td>
                                                <td style="padding: 10px;">$ ${h.valorPagado}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn-primary" onclick="cerrarModalHistorial()">Cerrar</button>
                        </div>
                    </div>
                </div>

            </main>
        </div>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

        <!-- 2. DataTables JS -->
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.4.1/js/dataTables.responsive.min.js"></script>

        <script>
                                $(document).ready(function () {
                                    var table;
                                    table = $('#socioTabla').DataTable({
                                        "searching": true, // Lo activamos para que el motor procese los filtros
                                        "dom": 'rtip',
                                        scrollY: "400px", // Altura máxima para el scroll vertical
                                        scrollCollapse: true,
                                        responsive: true,
                                        language: {
                                            processing: "Procesando...",
                                            search: "Buscar:",
                                            lengthMenu: "Mostrar _MENU_ registros",
                                            info: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                                            infoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros",
                                            infoFiltered: "(filtrado de un total de _MAX_ registros)",
                                            infoPostFix: "",
                                            loadingRecords: "Cargando...",
                                            zeroRecords: "No se encontraron resultados",
                                            emptyTable: "Ningún dato disponible en esta tabla",
                                            paginate: {
                                                first: "Primero",
                                                previous: "Anterior",
                                                next: "Siguiente",
                                                last: "Último"
                                            },
                                            aria: {
                                                sortAscending: ": Activar para ordenar la columna de manera ascendente",
                                                sortDescending: ": Activar para ordenar la columna de manera descendente"
                                            }
                                        },
                                        order: [[0, 'desc']]
                                    });

                                    $('.search-input').on('keyup', function () {
                                        table.search(this.value).draw();
                                    });
                                });


                                function abrirModalEditar(Id, documento, nombres, apellidos, fecha_nacimiento, telefono, email) {
                                    document.getElementById('edit_id').value = Id;
                                    document.getElementById('edit_document').value = documento;
                                    document.getElementById('edit_names').value = nombres;
                                    document.getElementById('edit_lastnames').value = apellidos;
                                    document.getElementById('edit_date').value = fecha_nacimiento;
                                    document.getElementById('edit_cellnumber').value = telefono;
                                    document.getElementById('edit_email').value = email;

                                    document.getElementById('modalEditar').style.display = 'flex';
                                }

                                function cerrarModalEditar() {
                                    document.getElementById('modalEditar').style.display = 'none';
                                }

        </script>

        <c:if test="${abrirModalHistorial}">
            <script>
                function abrirModalHistorial() {
                    let modal = document.getElementById('modalHistorial');
                    if (modal) {
                        modal.style.display = 'flex';
                    }
                }

                function cerrarModalHistorial() {
                    let modal = document.getElementById('modalHistorial');
                    if (modal) {
                        modal.style.display = 'none';
                    }
                }

                // ¡ESTO ES LO QUE FALTABA! Ejecutar la función automáticamente al cargar la página
                window.addEventListener('DOMContentLoaded', () => {
                    abrirModalHistorial();
                });
            </script>
        </c:if>


        <%
            String error = (String) request.getAttribute("error");
            if (error != null && !error.isEmpty()) {
        %>
        <script>
            window.addEventListener('DOMContentLoaded', () => {
                sweetAlert.error("¡Error!", "<%= error%>");
            });
        </script>
        <%} else {%>
        <script>
            window.addEventListener('DOMContentLoaded', () => {
                const url = new URLSearchParams(window.location.search);
                if (url.get('exito') === 'trueupdate') {
                    Swal.fire({
                        title: '¡Actualizado con éxito!',
                        text: 'Los datos del socio se actualizaron correctamente.',
                        icon: 'success',
                        timer: 2000,
                        timerProgressBar: true,
                        showConfirmButton: false,
                    });
                } else if (url.get('exito') === 'trueactivate') {
                    Swal.fire({
                        title: '¡Realizado con éxito!',
                        text: 'El socio ha sido activado',
                        icon: 'success',
                        timer: 2000,
                        timerProgressBar: true,
                        showConfirmButton: false,
                    });

                } else if (url.get('exito') === 'trueinactivate') {
                    Swal.fire({
                        title: '¡Realizado con éxito!',
                        text: 'El socio ha sido inactivado.',
                        icon: 'success',
                        timer: 2000,
                        timerProgressBar: true,
                        showConfirmButton: false,
                    });
                }
            });
        </script>
        <%}%>

    </body>
</html>
