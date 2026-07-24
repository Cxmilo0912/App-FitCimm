<%-- 
    Document   : Reportes
    Created on : 23/07/2026, 3:27:54 p. m.
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    <!-- ESTILOS CSS PUROS DE LA VISTA -->
    <style>
        /* Variables locales sincronizadas con el tema */
        :root {
            --card-bg: #1e293b;
            --card-border: #334155;
            --text-title: #f8fafc;
            --text-subtitle: #94a3b8;
            --table-header-bg: #0f172a;
            --table-row-hover: rgba(51, 65, 85, 0.4);
            --input-bg: #0f172a;
            --tab-bg: #0f172a;
        }

        body.light-mode {
            --card-bg: #ffffff;
            --card-border: #e2e8f0;
            --text-title: #0f172a;
            --text-subtitle: #64748b;
            --table-header-bg: #f8fafc;
            --table-row-hover: #f1f5f9;
            --input-bg: #f8fafc;
            --tab-bg: #ffffff;
        }

        /* Layout Principal */
        .main-container {
            padding: 32px;
            max-width: 1600px;
            margin: 0 auto;
            box-sizing: border-box;
        }

        /* Header de la vista */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 24px;
            gap: 16px;
            flex-wrap: wrap;
        }

        .page-title {
            font-size: 1.75rem;
            font-weight: 700;
            color: var(--text-title);
            margin: 0;
            letter-spacing: -0.02em;
        }

        .page-subtitle {
            font-size: 0.95rem;
            color: var(--text-subtitle);
            margin-top: 4px;
        }

        .btn-primary {
            background-color: #0284c7;
            color: #ffffff;
            font-weight: 600;
            padding: 10px 16px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.875rem;
            transition: background 0.2s;
        }

        .btn-primary:hover {
            background-color: #0369a1;
        }

        /* Pestañas de Reportes */
        .tabs-container {
            display: flex;
            gap: 8px;
            margin-bottom: 24px;
            border-bottom: 1px solid var(--card-border);
            padding-bottom: 16px;
            flex-wrap: wrap;
        }

        .report-tab {
            padding: 10px 16px;
            border-radius: 8px;
            font-size: 0.875rem;
            font-weight: 600;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            background-color: var(--tab-bg);
            color: var(--text-subtitle);
            border: 1px solid var(--card-border);
            transition: all 0.2s ease;
        }

        .report-tab:hover {
            color: var(--text-title);
        }

        .report-tab.active {
            background-color: #0284c7;
            color: #ffffff;
            border-color: #0284c7;
            box-shadow: 0 4px 12px rgba(2, 132, 199, 0.25);
        }

        /* Tarjetas y Contenedores */
        .card {
            background-color: var(--card-bg);
            border: 1px solid var(--card-border);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            transition: background-color 0.3s, border-color 0.3s;
        }

        .card-header {
            padding: 20px;
            border-bottom: 1px solid var(--card-border);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 16px;
        }

        .card-title {
            font-size: 1.125rem;
            font-weight: 700;
            color: var(--text-title);
            margin: 0;
        }

        .card-subtitle {
            font-size: 0.75rem;
            color: var(--text-subtitle);
            margin-top: 2px;
        }

        /* Badges / Etiqueta de estado */
        .badge-success {
            padding: 4px 12px;
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: 600;
            background-color: rgba(16, 185, 129, 0.1);
            color: #10b981;
            border: 1px solid rgba(16, 185, 129, 0.2);
            text-transform: uppercase;
        }

        /* Tablas */
        .table-responsive {
            overflow-x: auto;
        }

        .custom-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
            font-size: 0.875rem;
        }

        .custom-table th {
            background-color: var(--table-header-bg);
            color: var(--text-subtitle);
            padding: 16px 24px;
            font-family: 'JetBrains Mono', monospace;
            font-size: 0.75rem;
            font-weight: 600;
            letter-spacing: 0.05em;
            text-transform: uppercase;
            border-bottom: 1px solid var(--card-border);
            border-right: 1px solid var(--card-border);
        }

        .custom-table th:last-child {
            border-right: none;
        }

        .custom-table td {
            padding: 16px 24px;
            border-bottom: 1px solid var(--card-border);
            color: var(--text-title);
        }

        .custom-table tbody tr:hover {
            background-color: var(--table-row-hover);
        }

        .font-mono {
            font-family: 'JetBrains Mono', monospace;
            color: var(--text-subtitle);
        }

        .text-emerald {
            color: #10b981;
            font-weight: 700;
        }

        /* Selector de Fechas */
        .filter-group {
            display: flex;
            align-items: center;
            gap: 12px;
            background-color: var(--input-bg);
            padding: 8px 12px;
            border-radius: 12px;
            border: 1px solid var(--card-border);
            font-size: 0.75rem;
        }

        .date-input {
            background-color: var(--card-bg);
            border: 1px solid var(--card-border);
            color: var(--text-title);
            border-radius: 6px;
            padding: 4px 8px;
            font-family: 'JetBrains Mono', monospace;
        }

        /* Secciones ocultas/visibles */
        .report-content {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .report-content.hidden {
            display: none;
        }

        /* Grid de Analítica (Reporte 3) */
        .analytics-grid {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 24px;
        }

        @media (max-width: 768px) {
            .analytics-grid {
                grid-template-columns: 1fr;
            }
        }

        .progress-bar-bg {
            width: 100%;
            height: 10px;
            background-color: var(--input-bg);
            border-radius: 9999px;
            overflow: hidden;
            margin-top: 6px;
        }

        .progress-bar-fill {
            height: 100%;
            background-color: #0284c7;
            border-radius: 9999px;
        }
    </style>
</head>

<body>

    <!-- IMPORTACIÓN DEL MENÚ (Trae el sidebar y el control de Light/Dark Mode) -->
    <jsp:include page="/WEB-INF/includes/Menu.jsp" />

    <!-- CONTENEDOR PRINCIPAL -->
    <main class="main-container">
        
        <!-- Header -->
        <header class="page-header">
            <div>
                <h1 class="page-title">Panel de Reportes del Sistema</h1>
                <p class="page-subtitle">Visualización de datos consolidados para socios, recaudación y analítica de planes.</p>
            </div>
            <button class="btn-primary">
                <span class="material-symbols-outlined" style="font-size: 20px;">download</span>
                Exportar Vista Actual
            </button>
        </header>

        <!-- Selector de Pestañas -->
        <div class="tabs-container">
            <button onclick="switchReport('report1', this)" class="report-tab active">
                <span class="material-symbols-outlined" style="font-size: 18px;">badge</span>
                Socios Activos (Vigentes)
            </button>
            <button onclick="switchReport('report2', this)" class="report-tab">
                <span class="material-symbols-outlined" style="font-size: 18px;">payments</span>
                Recaudación por Rango y Plan
            </button>
            <button onclick="switchReport('report3', this)" class="report-tab">
                <span class="material-symbols-outlined" style="font-size: 18px;">trending_up</span>
                Plan Más Vendido del Mes
            </button>
        </div>

        <!-- REPORTE 1: Socios Activos -->
        <div id="report1" class="report-content">
            <div class="card">
                <div class="card-header">
                    <div>
                        <h2 class="card-title">Reporte de socios activos con membresía vigente</h2>
                        <p class="card-subtitle">RF-15 • Socios que cuentan con estado de membresía activo a la fecha actual.</p>
                    </div>
                    <span class="badge-success">1,240 Vigentes</span>
                </div>
                <div class="table-responsive">
                    <table class="custom-table">
                        <thead>
                            <tr>
                                <th>CÓDIGO SOCIO</th>
                                <th>NOMBRE COMPLETO</th>
                                <th>PLAN ASIGNADO</th>
                                <th>VÁLIDO HASTA</th>
                                <th>ESTADO</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="font-mono">SOC-8921</td>
                                <td style="font-weight: 600;">Valeria Albornoz</td>
                                <td>Plan Premium Anual</td>
                                <td class="font-mono">15/12/2026</td>
                                <td><span class="badge-success">Vigente</span></td>
                            </tr>
                            <tr>
                                <td class="font-mono">SOC-8922</td>
                                <td style="font-weight: 600;">Matías Benítez</td>
                                <td>Plan Exec Trimestral</td>
                                <td class="font-mono">30/09/2026</td>
                                <td><span class="badge-success">Vigente</span></td>
                            </tr>
                            <tr>
                                <td class="font-mono">SOC-8925</td>
                                <td style="font-weight: 600;">Camila Fuentes</td>
                                <td>Plan Base Mensual</td>
                                <td class="font-mono">10/08/2026</td>
                                <td><span class="badge-success">Vigente</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- REPORTE 2: Recaudación por Rango -->
        <div id="report2" class="report-content hidden">
            <div class="card">
                <div class="card-header">
                    <div>
                        <h2 class="card-title">Reporte del total recaudado en un rango de fechas</h2>
                        <p class="card-subtitle">RF-16 • Seleccione el rango de fechas deseado para filtrar las transacciones.</p>
                    </div>
                    <div class="filter-group">
                        <span>Desde:</span>
                        <input type="date" value="2026-07-01" class="date-input">
                        <span>Hasta:</span>
                        <input type="date" value="2026-07-23" class="date-input">
                        <button class="btn-primary" style="padding: 4px 12px; font-size: 0.75rem;">Filtrar</button>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="custom-table">
                        <thead>
                            <tr>
                                <th>PLAN COMERCIAL</th>
                                <th>TRANSACCIONES</th>
                                <th>VALOR UNITARIO</th>
                                <th>RECAUDACIÓN TOTAL</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="font-weight: 600;">Plan Premium Anual</td>
                                <td class="font-mono">142</td>
                                <td class="font-mono">$180.000</td>
                                <td class="font-mono text-emerald">$25.560.000</td>
                            </tr>
                            <tr>
                                <td style="font-weight: 600;">Plan Exec Trimestral</td>
                                <td class="font-mono">210</td>
                                <td class="font-mono">$60.000</td>
                                <td class="font-mono text-emerald">$12.600.000</td>
                            </tr>
                            <tr>
                                <td style="font-weight: 600;">Plan Base Mensual</td>
                                <td class="font-mono">352</td>
                                <td class="font-mono">$20.000</td>
                                <td class="font-mono text-emerald">$7.040.000</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- REPORTE 3: Plan más vendido -->
        <div id="report3" class="report-content hidden">
            <div class="analytics-grid">
                <div class="card" style="padding: 24px;">
                    <span style="font-size: 0.75rem; font-weight: 700; color: #f59e0b; text-transform: uppercase;">¡Destacado del Mes!</span>
                    <h3 class="card-title" style="margin-top: 8px;">Plan Más Vendido</h3>
                    <p class="card-subtitle" style="margin-top: 4px;">Mayor número de suscripciones registradas.</p>
                    <div style="margin-top: 32px; padding-top: 16px; border-top: 1px solid var(--card-border); display: flex; justify-content: space-between; align-items: center;">
                        <span class="font-mono" style="font-size: 0.75rem;">RF-17</span>
                        <span class="font-mono" style="font-size: 1.5rem; font-weight: 700; color: #0284c7;">352 Ventas</span>
                    </div>
                </div>

                <div class="card" style="padding: 24px;">
                    <h3 class="card-title" style="font-size: 0.875rem; text-transform: uppercase; margin-bottom: 20px;">Participación de Ventas</h3>
                    <div style="display: flex; flex-direction: column; gap: 16px;">
                        <div>
                            <div style="display: flex; justify-content: space-between; font-size: 0.75rem; font-weight: 600;">
                                <span>Plan Base Mensual</span>
                                <span class="font-mono" style="color: #0284c7;">50.2%</span>
                            </div>
                            <div class="progress-bar-bg"><div class="progress-bar-fill" style="width: 50.2%;"></div></div>
                        </div>
                        <div>
                            <div style="display: flex; justify-content: space-between; font-size: 0.75rem; font-weight: 600;">
                                <span>Plan Exec Trimestral</span>
                                <span class="font-mono" style="color: #0284c7;">30.0%</span>
                            </div>
                            <div class="progress-bar-bg"><div class="progress-bar-fill" style="width: 30%;"></div></div>
                        </div>
                        <div>
                            <div style="display: flex; justify-content: space-between; font-size: 0.75rem; font-weight: 600;">
                                <span>Plan Premium Anual</span>
                                <span class="font-mono" style="color: #0284c7;">19.8%</span>
                            </div>
                            <div class="progress-bar-bg"><div class="progress-bar-fill" style="width: 19.8%;"></div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </main>

    <!-- JAVASCRIPT DE LA VISTA -->
    <script>
        function switchReport(reportId, buttonElement) {
            // Ocultar todos los reportes
            document.querySelectorAll('.report-content').forEach(el => {
                el.classList.add('hidden');
            });

            // Mostrar el seleccionado
            document.getElementById(reportId).classList.remove('hidden');

            // Resetear estado de los botones
            document.querySelectorAll('.report-tab').forEach(btn => {
                btn.classList.remove('active');
            });

            // Activar botón pulsado
            buttonElement.classList.add('active');
        }
    </script>
</body>

</html>