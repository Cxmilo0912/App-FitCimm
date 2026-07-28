<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <title>Reportes y Analítica - PartnerPro</title>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect" />
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
        <link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:ital,wght@0,100..900;1,100..900&family=JetBrains+Mono:ital,wght@0,100..800;1,100..800&display=swap" rel="stylesheet" />
        <!-- Material Symbols -->
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet" />

        <style>
            :root {
                --bg-main: #f8fafc;
                --bg-surface: #ffffff;
                --text-main: #1e293b;
                --text-muted: #64748b;
                --border-color: #e2e8f0;
                --primary: #0284c7;
                --primary-hover: #0369a1;
                --primary-shadow: rgba(2, 132, 199, 0.2);
                --navy-dark: #0f172a;
            }

            @media (prefers-color-scheme: dark) {
                /* Si prefieres controlarlo por clase como dark mode, puedes usar .dark body */
            }

            .dark-mode, html.dark {
                --bg-main: #0b0f19;
                --bg-surface: #0f172a;
                --text-main: #f1f5f9;
                --text-muted: #94a3b8;
                --border-color: #1e293b;
            }

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'Hanken Grotesk', sans-serif;
                background-color: var(--bg-main);
                color: var(--text-main);
                min-height: 100vh;
                transition: background-color 0.2s, color 0.2s;
            }

            .material-symbols-outlined {
                font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
                vertical-align: middle;
            }

            /* LAYOUT PRINCIPAL */
            main {
                padding: 2.5rem;
                min-height: 100vh;
                max-width: 1600px;
                margin: 0 auto;
            }

            header.page-header {
                margin-bottom: 1.5rem;
                display: flex;
                flex-direction: column;
                gap: 1rem;
            }

            @media (min-width: 640px) {
                header.page-header {
                    flex-direction: row;
                    justify-content: space-between;
                    align-items: flex-end;
                }
            }

            header.page-header h1 {
                font-size: 1.875rem;
                font-weight: 700;
                letter-spacing: -0.025em;
            }

            header.page-header p {
                font-size: 1rem;
                color: var(--text-muted);
                margin-top: 0.25rem;
            }

            /* SELECTOR DE PESTAÑAS */
            .report-tabs {
                display: flex;
                flex-wrap: wrap;
                gap: 0.5rem;
                margin-bottom: 1.5rem;
                border-bottom: 1px solid var(--border-color);
                padding-bottom: 1rem;
            }

            .report-tab {
                padding: 0.625rem 1rem;
                border-radius: 0.5rem;
                font-size: 0.875rem;
                font-weight: 600;
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                gap: 0.5rem;
                cursor: pointer;
                border: 1px solid var(--border-color);
                background-color: var(--bg-surface);
                color: var(--text-muted);
            }

            .report-tab.active {
                background-color: var(--primary);
                color: white;
                border-color: var(--primary);
                box-shadow: 0 4px 6px -1px var(--primary-shadow);
            }

            .report-tab:hover:not(.active) {
                background-color: var(--border-color);
                color: var(--text-main);
            }

            .hidden {
                display: none !important;
            }

            .report-content {
                display: flex;
                flex-direction: column;
                gap: 1.5rem;
            }

            /* TARJETAS Y CONTENEDORES */
            .card {
                background-color: var(--bg-surface);
                border: 1px solid var(--border-color);
                border-radius: 1rem;
                box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.05);
                overflow: hidden;
            }

            .card-header {
                padding: 1.25rem;
                border-bottom: 1px solid var(--border-color);
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
                gap: 1rem;
            }

            .card-header h2 {
                font-size: 1.125rem;
                font-weight: 700;
            }

            /* TARJETA DESTACADA (PLAN MÁS VENDIDO) */
            .banner-card {
                background: linear-gradient(to right, #0284c7, #1d4ed8);
                color: white;
                border-radius: 1rem;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                padding: 1.5rem;
                display: flex;
                align-items: center;
                gap: 1.5rem;
            }

            .banner-icon {
                background-color: rgba(255, 255, 255, 0.1);
                padding: 0.75rem;
                border-radius: 0.75rem;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .banner-card span.label {
                font-size: 0.75rem;
                text-transform: uppercase;
                letter-spacing: 0.05em;
                color: #bae6fd;
                font-weight: 600;
                display: block;
            }

            .banner-card h3 {
                font-size: 1.5rem;
                font-weight: 800;
                letter-spacing: -0.025em;
                margin-top: 0.125rem;
            }

            /* FILTRO DE FECHAS */
            .filter-form {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                background-color: var(--bg-main);
                padding: 0.5rem;
                border-radius: 0.75rem;
                border: 1px solid var(--border-color);
                font-size: 0.75rem;
            }

            .filter-group {
                display: flex;
                align-items: center;
                gap: 0.375rem;
            }

            .filter-group span {
                color: var(--text-muted);
                font-weight: 500;
            }

            .filter-input {
                background-color: var(--bg-surface);
                border: 1px solid var(--border-color);
                border-radius: 0.5rem;
                padding: 0.25rem 0.5rem;
                color: var(--text-main);
                font-family: 'JetBrains Mono', monospace;
                font-size: 0.75rem;
                outline: none;
            }

            .filter-input:focus {
                border-color: var(--primary);
                box-shadow: 0 0 0 1px var(--primary);
            }

            .filter-btn {
                background-color: var(--primary);
                color: white;
                font-weight: 600;
                padding: 0.375rem 0.75rem;
                border-radius: 0.5rem;
                border: none;
                cursor: pointer;
                transition: background-color 0.2s;
            }

            .filter-btn:hover {
                background-color: var(--primary-hover);
            }

            /* TABLAS */
            .custom-scrollbar::-webkit-scrollbar {
                width: 6px;
                height: 6px;
            }

            .custom-scrollbar::-webkit-scrollbar-track {
                background: transparent;
            }

            .custom-scrollbar::-webkit-scrollbar-thumb {
                background: #cbd5e1;
                border-radius: 10px;
            }

            .dark .custom-scrollbar::-webkit-scrollbar-thumb {
                background: #334155;
            }

            .table-responsive {
                width: 100%;
                overflow-x: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                text-align: left;
                font-size: 0.875rem;
            }

            th {
                background-color: var(--navy-dark);
                color: white;
                font-family: 'JetBrains Mono', monospace;
                font-size: 0.6875rem;
                text-transform: uppercase;
                letter-spacing: 0.05em;
                padding: 1rem 1.25rem;
                border-right: 1px solid #1e293b;
            }

            th:last-child {
                border-right: none;
            }

            td {
                padding: 1rem 1.25rem;
                border-bottom: 1px solid var(--border-color);
                color: var(--text-main);
            }

            tr:last-child td {
                border-bottom: none;
            }

            tr:hover td {
                background-color: rgba(0, 0, 0, 0.01);
            }

            .mono {
                font-family: 'JetBrains Mono', monospace;
                color: var(--text-muted);
                font-size: 0.8125rem;
            }

            /* BADGES */
            .badge {
                display: inline-flex;
                align-items: center;
                padding: 0.25rem 0.625rem;
                font-size: 0.6875rem;
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

            .text-emerald {
                color: #059669;
                font-weight: 700;
            }
        </style>
    </head>

    <body>

        <jsp:include page="/WEB-INF/Vistas/Menu.jsp" />

        <main>
            <!-- Page Header -->
            <header class="page-header">
                <div>
                    <h1>Panel de Reportes del Sistema</h1>
                    <p>Visualización de datos consolidados para socios, recaudación y analítica de planes.</p>
                </div>
            </header>

            <!-- Report Tabs Selector -->
            <div class="report-tabs">
                <button onclick="switchReport('report1', this)"
                        class="report-tab ${param.accion == 'reporteplan' ? '' : 'active'}">
                    <span class="material-symbols-outlined" style="font-size: 18px;">badge</span>
                    Socios Activos (Vigentes)
                </button>

                <button onclick="switchReport('report2', this)"
                        class="report-tab ${param.accion == 'reporteplan' ? 'active' : ''}">
                    <span class="material-symbols-outlined" style="font-size: 18px;">payments</span>
                    Reporte Planes
                </button>
            </div>

            <!-- Reporte 1 -->
            <div id="report1" class="report-content ${param.accion == 'reportePlan' ? 'hidden' : ''}">
                <div class="card">
                    <div class="card-header">
                        <h2>Reporte de socios activos con membresía vigente</h2>
                    </div>
                    <div class="table-responsive custom-scrollbar">
                        <table>
                            <thead>
                                <tr>
                                    <th>Documento Socio</th>
                                    <th>Nombre del Socio</th>
                                    <th>Plan Asignado</th>
                                    <th>Válido Hasta</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="m" items="${membresias}">
                                    <c:if test="${m.estadoMembresia == 'VIGENTE'}">
                                        <tr>
                                            <td class="mono">${m.documento}</td>
                                            <td style="font-weight: 600;">${m.nombres} ${m.apellidos}</td>
                                            <td>Plan ${m.plan}</td>
                                            <td class="mono">${m.fechaFin}</td>
                                            <td>
                                                <span class="badge badge-vigente">Vigente</span>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Reporte 2 -->
            <div id="report2" class="report-content ${param.accion == 'reportePlan' ? '' : 'hidden'}">
                <!-- Tarjeta: Plan Más Vendido del Mes -->
                <div class="banner-card">
                    <div class="banner-icon">
                        <span class="material-symbols-outlined" style="font-size: 28px;">trending_up</span>
                    </div>
                    <div>
                        <span class="label">Plan más vendido del mes</span>
                        <h3>Plan ${masVendido}</h3>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header" style="flex-direction: row; justify-content: space-between; align-items: center;">
                        <h2>Reporte del total recaudado en un rango de fechas, agrupado por plan</h2>

                        <form action="${pageContext.request.contextPath}/PlanController" method="GET" class="filter-form">
                            <input type="hidden" name="accion" value="reportePlan">
                            <div class="filter-group">
                                <span>Desde:</span>
                                <input type="date" name="fechaInicio" value="" class="filter-input">
                            </div>
                            <div class="filter-group">
                                <span>Hasta:</span>
                                <input type="date" name="fechaFin" value="" class="filter-input">
                            </div>
                            <button type="submit" class="filter-btn">
                                Filtrar
                            </button>
                        </form>
                    </div>

                    <div class="table-responsive custom-scrollbar">
                        <table>
                            <thead>
                                <tr>
                                    <th>PLAN COMERCIAL</th>
                                    <th>VALOR UNITARIO</th>
                                    <th>RECAUDACIÓN TOTAL</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${total}">
                                    <tr>
                                        <td style="font-weight: 600;">Plan ${p.nombrePlan}</td>
                                        <td class="mono">$ ${p.valorUnitario}</td>
                                        <td class="mono text-emerald">$ ${p.recaudacionTotal}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>

        <script>
            function switchReport(reportId, buttonElement) {
                document.querySelectorAll('.report-content').forEach(el => {
                    el.classList.add('hidden');
                });
                document.getElementById(reportId).classList.remove('hidden');

                document.querySelectorAll('.report-tab').forEach(btn => {
                    btn.classList.remove('active');
                });

                buttonElement.classList.add('active');
            }
        </script>
    </body>
</html>