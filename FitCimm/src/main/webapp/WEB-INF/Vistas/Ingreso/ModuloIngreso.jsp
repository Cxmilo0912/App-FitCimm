
<%@page import="java.util.List"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Map<String, Object> resultado = (Map<String, Object>) request.getAttribute("resultadoIngreso");

    String nombres = "";
    int diasRestantes = 0;
    boolean mostrarModal = false;

    if (resultado != null) {
        nombres = (String) resultado.get("nombres");
        Number diasNum = (Number) resultado.get("diasRestantes");
        diasRestantes = (diasNum != null) ? diasNum.intValue() : 0;
        mostrarModal = true;
    }
%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Control de Acceso - PartnerPro Premium</title>

        <!-- Tipografías e Iconos -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@400;600;700;900&family=JetBrains+Mono:wght@500&family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=block" rel="stylesheet">

        <link
            href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&family=JetBrains+Mono:wght@500;600&display=swap"
            rel="stylesheet">

        <!-- DataTables CSS Tailwind / Estándar -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">

        <style>
            /* ==========================================================================
            VARIABLES DE COLOR Y DISEÑO (Sistema Azul / Slate)
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

                --success-bg: #f0fdf4;
                --success-text: #15803d;
                --success-border: #bbf7d0;

                --error-bg: #fef2f2;
                --error-text: #dc2626;
                --error-border: #fecaca;

                --border-color: #cbd5e1;
                --border-light: #e2e8f0;
                --border-focus: #2563eb;

                --shadow-sm: 0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1);
                --shadow-card: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
                --shadow-input-focus: 0 0 0 4px rgba(37, 99, 235, 0.15);
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

            /* Contenedor Principal */
            .main-wrapper {
                display: flex;
                flex: 1;
                height: 100vh;
                overflow: hidden;
            }

            /* Contenedor con Scroll */
            .content-container {
                flex: 1;
                overflow-y: auto;
                padding: 32px;
                max-width: 1200px;
                width: 100%;
                margin: 0 auto;
                transition: filter 0.3s ease;
            }

            .page-header {
                margin-bottom: 24px;
            }

            .page-header h3 {
                font-size: 24px;
                font-weight: 700;
                letter-spacing: -0.01em;
                margin-bottom: 4px;
            }

            .page-header p {
                color: var(--text-muted);
                font-size: 14px;
                max-width: 650px;
            }

            /* Grid Layout de Registro (1 sola columna: no hay side-status-column) */
            .access-grid {
                display: grid;
                grid-template-columns: 1fr;
                gap: 24px;
                align-items: start;
                margin-bottom: 32px;
            }

            /* Tarjeta de Registro Directo */
            .registration-card {
                background-color: var(--bg-surface);
                border: 1px solid var(--border-light);
                border-radius: 12px;
                padding: 32px 24px;
                box-shadow: var(--shadow-card);
                display: flex;
                flex-direction: column;
                gap: 24px;
            }

            .input-wrapper {
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
                max-width: 420px;
                margin: 0 auto;
                width: 100%;
            }

            .scanner-icon-circle {
                width: 64px;
                height: 64px;
                border-radius: 50%;
                background-color: var(--primary-light);
                color: var(--primary);
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 12px;
            }

            .scanner-icon-circle .material-symbols-outlined {
                font-size: 32px;
            }

            .input-label {
                font-family: 'JetBrains Mono', monospace;
                font-size: 12px;
                color: var(--text-muted);
                text-transform: uppercase;
                letter-spacing: 0.1em;
                margin-bottom: 16px;
                font-weight: 600;
            }

            .input-field-container {
                position: relative;
                width: 100%;
                margin-bottom: 16px;
            }

            .input-field-container .material-symbols-outlined {
                position: absolute;
                left: 16px;
                top: 50%;
                transform: translateY(-50%);
                color: var(--text-muted);
                font-size: 24px;
                transition: color 0.2s;
            }

            .input-field-container input {
                width: 100%;
                padding: 16px 16px 16px 52px;
                font-family: 'JetBrains Mono', monospace;
                font-size: 22px;
                font-weight: 600;
                text-align: center;
                letter-spacing: 0.08em;
                color: var(--text-main);
                background-color: var(--bg-main);
                border: 2px solid var(--border-color);
                border-radius: var(--radius);
                outline: none;
                transition: all 0.2s;
            }

            .input-field-container input:focus {
                background-color: #ffffff;
                border-color: var(--primary);
                box-shadow: var(--shadow-input-focus);
            }

            .input-field-container input:focus+.material-symbols-outlined {
                color: var(--primary);
            }

            .btn-register {
                width: 100%;
                padding: 16px;
                background-color: var(--primary);
                color: var(--text-white);
                border: none;
                border-radius: var(--radius);
                font-size: 15px;
                font-weight: 700;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
                box-shadow: 0 4px 12px rgba(37, 99, 235, 0.25);
                transition: all 0.2s;
            }

            .btn-register:hover {
                background-color: var(--primary-hover);
                transform: translateY(-1px);
                box-shadow: 0 6px 16px rgba(37, 99, 235, 0.35);
            }

            .btn-register:active {
                transform: translateY(0);
            }

            .scanner-status-bar {
                padding-top: 16px;
                border-top: 1px solid var(--border-light);
                display: flex;
                align-items: center;
                justify-content: space-between;
                font-size: 13px;
                color: var(--text-muted);
            }

            .scanner-info {
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .pulse-dot-container {
                display: flex;
                align-items: center;
                gap: 6px;
                font-family: 'JetBrains Mono', monospace;
                font-size: 11px;
                font-weight: 700;
                color: var(--primary);
            }

            .pulse-dot {
                width: 8px;
                height: 8px;
                background-color: var(--primary);
                border-radius: 50%;
                animation: pulse 1.5s infinite;
            }

            @keyframes pulse {
                0% {
                    transform: scale(0.95);
                    opacity: 1;
                }
                50% {
                    transform: scale(1.3);
                    opacity: 0.5;
                }
                100% {
                    transform: scale(0.95);
                    opacity: 1;
                }
            }

            .side-status-column {
                display: flex;
                flex-direction: column;
                gap: 16px;
            }

            .status-card {
                background-color: var(--bg-surface);
                border: 1px solid var(--border-light);
                border-radius: 12px;
                padding: 20px;
                display: flex;
                flex-direction: column;
                gap: 16px;
            }

            .status-card-header {
                font-family: 'JetBrains Mono', monospace;
                font-size: 11px;
                color: var(--text-muted);
                text-transform: uppercase;
                letter-spacing: 0.05em;
            }

            .empty-state {
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
                padding: 24px 12px;
                opacity: 0.5;
            }

            .empty-state .material-symbols-outlined {
                font-size: 48px;
                color: var(--text-muted);
                margin-bottom: 8px;
            }

            .empty-title {
                font-size: 16px;
                font-weight: 600;
            }

            .empty-desc {
                font-size: 13px;
                color: var(--text-muted);
                margin-top: 4px;
            }

            .history-section {
                display: flex;
                flex-direction: column;
                gap: 12px;
            }

            .history-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .history-header h3 {
                font-size: 18px;
                font-weight: 700;
            }

            .table-card {
                background-color: var(--bg-surface);
                border: 1px solid var(--border-light);
                border-radius: 12px;
                box-shadow: var(--shadow-card);
                overflow: hidden;
            }

            .history-table {
                width: 100%;
                border-collapse: collapse;
                text-align: left;
            }

            .history-table th {
                background-color: #f1f5f9;
                color: var(--text-muted);
                font-family: 'JetBrains Mono', monospace;
                font-size: 11px;
                text-transform: uppercase;
                letter-spacing: 0.05em;
                padding: 12px 20px;
                border-bottom: 1px solid var(--border-light);
            }

            .history-table td {
                padding: 16px 20px;
                border-bottom: 1px solid var(--border-light);
                font-size: 14px;
            }

            .history-table tbody tr:last-child td {
                border-bottom: none;
            }

            .history-table tbody tr:hover {
                background-color: #f8fafc;
            }

            .row-denied {
                background-color: #fef2f2;
            }

            .row-denied:hover {
                background-color: #fee2e2 !important;
            }

            .time-cell {
                font-family: 'JetBrains Mono', monospace;
                font-size: 13px;
                color: var(--text-muted);
            }

            .partner-info-cell {
                display: flex;
                flex-direction: column;
            }

            .partner-name {
                font-weight: 600;
                color: var(--text-main);
            }

            .partner-tier {
                font-size: 11px;
                color: var(--text-muted);
                text-transform: uppercase;
            }

            .doc-cell {
                font-family: 'JetBrains Mono', monospace;
                font-size: 13px;
                color: var(--text-muted);
            }

            .badge-status {
                display: inline-flex;
                align-items: center;
                gap: 6px;
                padding: 4px 10px;
                border-radius: 20px;
                font-size: 11px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.03em;
            }

            .badge-status.authorized {
                background-color: var(--success-bg);
                color: var(--success-text);
                border: 1px solid var(--success-border);
            }

            .badge-status.denied {
                background-color: var(--error-bg);
                color: var(--error-text);
                border: 1px solid var(--error-border);
            }

            .badge-status .status-indicator {
                width: 6px;
                height: 6px;
                border-radius: 50%;
            }

            .badge-status.authorized .status-indicator {
                background-color: #22c55e;
            }

            .badge-status.denied .status-indicator {
                background-color: #ef4444;
            }

            @keyframes shrink {
                from {
                    width: 100%;
                }
                to {
                    width: 0%;
                }
            }

            .animate-autoclose {
                animation: shrink 4000ms linear forwards;
            }
            .fixed {
                position: fixed;
            }
            .inset-0 {
                inset: 0;
            }
            .z-50 {
                z-index: 50;
            }
            .flex {
                display: flex;
            }
            .items-center {
                align-items: center;
            }
            .justify-center {
                justify-content: center;
            }
            .p-4 {
                padding: 16px;
            }
            .p-12 {
                padding: 48px;
            }
            .overflow-hidden {
                overflow: hidden;
            }
            .bg-white {
                background-color: #ffffff;
            }
            .w-full {
                width: 100%;
            }
            .max-w-lg {
                max-width: 32rem;
            }
            .rounded {
                border-radius: 4px;
            }
            .rounded-lg {
                border-radius: 8px;
            }
            .rounded-full {
                border-radius: 9999px;
            }
            .relative {
                position: relative;
            }
            .absolute {
                position: absolute;
            }
            .border {
                border: 1px solid;
            }
            .border-2 {
                border: 2px solid;
            }
            .border-slate-200 {
                border-color: #e2e8f0;
            }
            .border-slate-300 {
                border-color: #cbd5e1;
            }
            .border-emerald-500\/20 {
                border-color: rgba(16, 185, 129, 0.2);
            }
            .h-1 {
                height: 4px;
            }
            .h-2 {
                height: 8px;
            }
            .w-24 {
                width: 96px;
            }
            .h-24 {
                height: 96px;
            }
            .w-1\/2 {
                width: 50%;
            }
            .bg-blue-600 {
                background-color: #2563eb;
            }
            .hover\:bg-blue-700:hover {
                background-color: #1d4ed8;
            }
            .bg-emerald-50 {
                background-color: #ecfdf5;
            }
            .bg-slate-200 {
                background-color: #e2e8f0;
            }
            .flex-col {
                flex-direction: column;
            }
            .text-center {
                text-align: center;
            }
            .text-left {
                text-align: left;
            }
            .top-6 {
                top: 24px;
            }
            .right-6 {
                right: 24px;
            }
            .text-slate-400 {
                color: #94a3b8;
            }
            .text-slate-500 {
                color: #64748b;
            }
            .text-slate-700 {
                color: #334155;
            }
            .text-slate-800 {
                color: #1e293b;
            }
            .text-slate-900 {
                color: #0f172a;
            }
            .text-white {
                color: #ffffff;
            }
            .text-emerald-600 {
                color: #059669;
            }
            .text-emerald-700 {
                color: #047857;
            }
            .text-6xl {
                font-size: 3.75rem;
                line-height: 1;
            }
            .text-3xl {
                font-size: 30px;
            }
            .text-lg {
                font-size: 18px;
            }
            .text-sm {
                font-size: 14px;
            }
            .text-\[10px\] {
                font-size: 10px;
            }
            .font-bold {
                font-weight: 700;
            }
            .font-semibold {
                font-weight: 600;
            }
            .uppercase {
                text-transform: uppercase;
            }
            .tracking-\[0\.2em\] {
                letter-spacing: 0.2em;
            }
            .tracking-widest {
                letter-spacing: 0.1em;
            }
            .mb-2 {
                margin-bottom: 8px;
            }
            .mb-6 {
                margin-bottom: 24px;
            }
            .mb-8 {
                margin-bottom: 32px;
            }
            .mt-6 {
                margin-top: 24px;
            }
            .gap-2 {
                gap: 8px;
            }
            .gap-3 {
                gap: 12px;
            }
            .gap-4 {
                gap: 16px;
            }
            .px-3 {
                padding: 0 12px;
            }
            .px-4 {
                padding: 0 16px;
            }
            .py-2 {
                padding: 8px 0;
            }
            .py-5 {
                padding: 20px 0;
            }
            .transition-all {
                transition: all 0.2s ease;
            }
            .cursor-pointer {
                cursor: pointer;
            }
            .shadow-md {
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            }
            .hidden {
                display: none !important;
            }
            .blur-sm {
                filter: blur(4px);
            }
            .material-symbols-outlined {
                font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            }
        </style>
        <script>
            (function () {
                const savedTheme = localStorage.getItem('theme');
                const systemPrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
                if (savedTheme === 'dark' || (!savedTheme && systemPrefersDark)) {
                    document.documentElement.classList.add('dark');
                }
            })();
        </script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme.css"/>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="${pageContext.request.contextPath}/js/sweetAlert.js"></script>
    </head>

    <body>

        <!-- Contenedor Principal -->
        <div class="main-wrapper">

            <!-- Canvas de Contenido -->
            <main class="content-container" id="mainCanvas">

                <!-- Título de Sección -->
                <div class="page-header">
                    <h3>Registro de Ingreso</h3>
                    <p>Gestione la entrada de socios de forma eficiente. Ingrese manualmente el documento de identidad.</p>
                </div>

                <!-- Grid Principal de Trabajo -->
                <div class="access-grid">

                    <!-- Tarjeta de Ingreso Directo -->
                    <div class="registration-card">
                        <div class="input-wrapper">
                            <div class="scanner-icon-circle">
                                <span class="material-symbols-outlined">person_search</span>
                            </div>
                            <label class="input-label" for="iptDocumento">Identificación del Socio</label>
                            <form action="${pageContext.request.contextPath}/IngresoController" method="POST">
                                <div class="input-field-container">
                                    <input type="text" id="iptDocumento" name="documentoSocio"/>
                                    <span class="material-symbols-outlined">id_card</span>
                                </div>

                                <button type="submit" class="btn-register">
                                    <span class="material-symbols-outlined">login</span>
                                    <span>REGISTRAR INGRESO</span>
                                </button>
                            </form>
                        </div>
                    </div>

                </div>

                <!-- Filtro de Fecha para la Tabla -->
                <div class="mb-6 flex items-center gap-4">
                    <form action="${pageContext.request.contextPath}/IngresoController" method="GET" class="flex items-center gap-3">
                        <label for="fechaConsulta" class="text-sm font-semibold text-slate-700 dark:text-slate-300">Consultar fecha:</label>
                        <input type="date" id="fechaConsulta" name="fechaConsulta"
                               class="px-3 py-2 bg-white dark:bg-slate-800 border border-slate-300 dark:border-slate-700 rounded-lg text-slate-800 dark:text-slate-200 text-sm">
                        <button type="submit" class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg text-sm font-bold transition-all">
                            Buscar
                        </button>
                    </form>
                </div>

                <!-- Sección Tabla de Historial Reciente -->
                <div class="history-section">
                    <div class="history-header">
                        <h3>Historial Diario de Ingresos Autorizados</h3>
                    </div>

                    <div class="table-card">
                        <table id="historialDiario" class="history-table">
                            <thead>
                                <tr>
                                    <th style="width: 100px;">Hora Ingreso</th>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th>Documento</th>
                                    <th>Telefono</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    List<Map<String, Object>> historial = (List<Map<String, Object>>) request.getAttribute("historial");
                                    if (historial != null && !historial.isEmpty()) {
                                        for (Map<String, Object> item : historial) {

                                %>

                                <tr>
                                    <td class="time-cell"><%= item.get("horaIngreso")%></td>
                                    <td>
                                        <div class="partner-info-cell">
                                            <span class="partner-name"><%= item.get("nombres")%></span>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <span class="partner-tier"><%= item.get("apellidos")%></span>
                                        </div>
                                    </td> 
                                    <td class="doc-cell"><%= item.get("documento")%></td>
                                    <td class="doc-cell"><%= item.get("telefono")%></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>

            </main>
        </div>

        <!-- Modal de Resultado -->
        <div class="fixed inset-0 z-50 flex items-center justify-center p-4 overflow-hidden <%= mostrarModal ? "" : "hidden"%>" id="checkinModal" style="background: rgba(0,0,0,0.6);">
            <div class="bg-white dark:bg-slate-900 w-full max-w-lg rounded-lg relative overflow-hidden border border-slate-200 dark:border-slate-800 shadow-xl transition-colors">

                <!-- Auto-close Timer Bar -->
                <div class="h-1 bg-blue-600 dark:bg-blue-500 w-full animate-autoclose" id="timerBar"></div>

                <div class="p-12 flex flex-col items-center text-center">

                    <!-- Close Button -->
                    <button aria-label="Cerrar modal"
                            class="absolute top-6 right-6 text-slate-400 hover:text-slate-800 dark:hover:text-slate-200 transition-colors"
                            onclick="closeModal()">
                        <span class="material-symbols-outlined">close</span>
                    </button>

                    <!-- Status Icon -->
                    <div class="w-24 h-24 bg-emerald-50 dark:bg-emerald-950/50 rounded-full flex items-center justify-center mb-8 relative">
                        <div class="absolute inset-0 rounded-full border-2 border-emerald-500/20"></div>
                        <span class="material-symbols-outlined text-emerald-600 dark:text-emerald-400 text-6xl"
                              style="font-variation-settings: 'FILL' 1;">check_circle</span>
                    </div>

                    <!-- Main Message -->
                    <h3 class="text-sm uppercase tracking-[0.2em] text-emerald-700 dark:text-emerald-400 mb-2 font-bold">Acceso Autorizado</h3>
                    <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-8"><%= nombres%></h2>

                    <!-- Progress Info -->
                    <div class="w-full mb-8">
                        <div class="flex justify-between items-end mb-2">
                            <div class="text-left">
                                <p class="text-[10px] uppercase text-slate-500 dark:text-slate-400">Vencimiento del Ciclo</p>
                                <p class="text-lg font-bold text-slate-800 dark:text-slate-200">Días restantes: <%= diasRestantes%></p>
                            </div>
                        </div>
                        <div class="h-2 w-full bg-slate-200 dark:bg-slate-800 rounded-full overflow-hidden">
                            <div class="h-full bg-blue-600 dark:bg-blue-500 w-1/2"></div>
                        </div>
                    </div>

                    <!-- Footer Action -->
                    <button class="w-full bg-blue-600 hover:bg-blue-700 dark:bg-blue-600 dark:hover:bg-blue-500 text-white py-5 font-bold uppercase tracking-[0.2em] text-sm transition-all flex items-center justify-center gap-2 rounded shadow-md cursor-pointer"
                            style="color: #ffffff;"
                            onclick="closeModal()">
                        Entendido
                        <span class="material-symbols-outlined text-lg" style="color: #ffffff;">check</span>
                    </button>

                    <p class="mt-6 text-[10px] text-slate-400 dark:text-slate-500 uppercase tracking-widest">Registrado el 22 de mayo de 2024 a las 13:24</p>
                </div>
            </div>
        </div>

        <!-- 1. jQuery (Requerido por DataTables) -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

        <!-- 2. DataTables JS -->
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <!-- SCRIPT CORREGIDO -->
        <script>
                                let autoCloseTimer;

                                function closeModal() {
                                    const modal = document.getElementById('checkinModal');
                                    const mainCanvas = document.getElementById('mainCanvas');

                                    if (modal) {
                                        modal.classList.add('hidden');
                                    }
                                    if (mainCanvas) {
                                        mainCanvas.classList.remove('blur-sm');
                                    }
                                    clearTimeout(autoCloseTimer);
                                }

                                function openModal() {
                                    const modal = document.getElementById('checkinModal');
                                    const mainCanvas = document.getElementById('mainCanvas');
                                    const timerBar = document.getElementById('timerBar');

                                    if (modal) {
                                        modal.classList.remove('hidden');
                                    }
                                    if (mainCanvas) {
                                        mainCanvas.classList.add('blur-sm');
                                    }

                                    if (timerBar) {
                                        timerBar.classList.remove('animate-autoclose');
                                        void timerBar.offsetWidth; // Forzar reflow
                                        timerBar.classList.add('animate-autoclose');
                                    }

                                    clearTimeout(autoCloseTimer);
                                    autoCloseTimer = setTimeout(() => {
                                        closeModal();
                                    }, 4000);
                                }

                                // Si el modal debe mostrarse al cargar la página (según backend), activar el temporizador de cierre automático
                                window.addEventListener('DOMContentLoaded', () => {
                                    const modal = document.getElementById('checkinModal');
                                    if (modal && !modal.classList.contains('hidden')) {
                                        const mainCanvas = document.getElementById('mainCanvas');
                                        if (mainCanvas) {
                                            mainCanvas.classList.add('blur-sm');
                                        }
                                        autoCloseTimer = setTimeout(() => {
                                            closeModal();
                                        }, 4000);
                                    }
                                });

                                $(document).ready(function () {
                                    $('#historialDiario').DataTable({
                                        language: {
                                            url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json'
                                        },
                                        order: [[0, 'desc']]
                                    })
                                })
        </script>

        <%
            String error = (String) request.getAttribute("errorMsg");

            if (error != null && !error.isEmpty()) {
        %>
        <script>
            window.addEventListener('DOMContentLoaded', () => {
                sweetAlert.error("¡Error!", "<%= error%>");
            });
        </script>
        <%}%>

        <script src="${pageContext.request.contextPath}/js/theme.js"></script>

    </body>
</html>
