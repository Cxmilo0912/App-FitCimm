<%-- 
    Document   : ModuloIngreso
    Created on : 23/07/2026, 12:38:56 p. m.
    Author     : Admin
--%>

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
        diasRestantes = (Integer) resultado.get("diasRestantes");
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
        <link
            href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&family=JetBrains+Mono:wght@500;600&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
              rel="stylesheet" />

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

            /* Grid Layout de Registro */
            .access-grid {
                display: grid;
                grid-template-columns: 7fr 5fr;
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

            /* Clases utilitarias faltantes convertidas a CSS puro */
            .fixed {
                position: fixed;
            }
            .inset-0 {
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
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
            .rounded-lg {
                border-radius: 8px;
            }
            .relative {
                position: relative;
            }
            .border {
                border-width: 1px;
                border-style: solid;
            }
            .border-slate-200 {
                border-color: #e2e8f0;
            }
            .h-1 {
                height: 4px;
            }
            .bg-blue-600 {
                background-color: #2563eb;
            }
            .p-12 {
                padding: 48px;
            }
            .flex-col {
                flex-direction: column;
            }
            .text-center {
                text-align: center;
            }
            .absolute {
                position: absolute;
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
            .w-24 {
                width: 96px;
            }
            .h-24 {
                height: 96px;
            }
            .bg-emerald-50 {
                background-color: #ecfdf5;
            }
            .rounded-full {
                border-radius: 9999px;
            }
            .mb-8 {
                margin-bottom: 32px;
            }
            .border-2 {
                border-width: 2px;
                border-style: solid;
            }
            .border-emerald-500\/20 {
                border-color: rgba(16, 185, 129, 0.2);
            }
            .text-emerald-600 {
                background-color: transparent;
                color: #059669;
            }
            .text-6xl {
                font-size: 3.75rem;
                line-height: 1;
            }
            .text-sm {
                font-size: 14px;
            }
            .uppercase {
                text-transform: uppercase;
            }
            .tracking-\[0\.2em\] {
                letter-spacing: 0.2em;
            }
            .text-emerald-700 {
                color: #047857;
            }
            .mb-2 {
                margin-bottom: 8px;
            }
            .font-bold {
                font-weight: 700;
            }
            .text-3xl {
                font-size: 30px;
            }
            .text-slate-900 {
                color: #0f172a;
            }
            .grid {
                display: grid;
            }
            .grid-cols-2 {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
            .gap-4 {
                gap: 16px;
            }
            .mb-10 {
                margin-bottom: 40px;
            }
            .bg-slate-50 {
                background-color: #f8fafc;
            }
            .text-left {
                text-align: left;
            }
            .rounded {
                border-radius: 4px;
            }
            .text-\[10px\] {
                font-size: 10px;
            }
            .text-slate-500 {
                color: #64748b;
            }
            .h-2 {
                height: 8px;
            }
            .bg-slate-200 {
                background-color: #e2e8f0;
            }
            .w-1\/2 {
                width: 50%;
            }
            .hover\:bg-blue-700:hover {
                background-color: #1d4ed8;
            }
            .py-5 {
                padding-top: 20px;
                padding-bottom: 20px;
            }
            .transition-all {
                transition: all 0.2s ease;
            }
            .gap-2 {
                gap: 8px;
            }
            .shadow-md {
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            }
            .text-lg {
                font-size: 18px;
            }
            .mt-6 {
                margin-top: 24px;
            }
            .tracking-widest {
                letter-spacing: 0.1em;
            }
            .hidden {
                display: none !important;
            }
            .blur-sm {
                filter: blur(4px);
            }
        </style>
    </head>

    <body>

        <!-- Contenedor Principal -->
        <div class="main-wrapper">

            <!-- Canvas de Contenido -->
            <main class="content-container" id="mainCanvas">

                <!-- Título de Sección -->
                <div class="page-header">
                    <h3>Registro de Ingreso</h3>
                    <p>Gestione la entrada de socios de forma eficiente. Utilice el escáner biométrico o ingrese manualmente el documento de identidad.</p>
                </div>

                <!-- Grid Principal de Trabajo -->
                <div class="access-grid">

                    <!-- Tarjeta de Ingreso Directo -->
                    <div class="registration-card">
                        <div class="input-wrapper">
                            <div class="scanner-icon-circle">
                                <span class="material-symbols-outlined">person_search</span>
                            </div>
                            <label class="input-label" for="doc_input">Identificación del Socio</label>
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

                        <div class="scanner-status-bar">
                            <div class="scanner-info">
                                <span class="material-symbols-outlined" style="font-size: 18px;">qr_code_scanner</span>
                                <span>Escáner activo en puerto COM4</span>
                            </div>
                            <div class="pulse-dot-container">
                                <div class="pulse-dot"></div>
                                <span>LISTO</span>
                            </div>
                        </div>
                    </div>

                    <!-- Panel Lateral -->
                    <div class="side-status-column">
                        <div class="status-card">
                            <div class="status-card-header">Último resultado</div>
                            <div class="empty-state">
                                <span class="material-symbols-outlined">pending_actions</span>
                                <div class="empty-title">Esperando...</div>
                                <div class="empty-desc">Ingrese un documento para validar los permisos de acceso</div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- Sección Tabla de Historial Reciente -->
                <div class="history-section">
                    <div class="history-header">
                        <h3>Historial Reciente</h3>
                    </div>

                    <div class="table-card">
                        <table class="history-table">
                            <thead>
                                <tr>
                                    <th style="width: 100px;">Hora</th>
                                    <th>Socio</th>
                                    <th>Documento</th>
                                    <th style="text-align: right;">Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="time-cell">09:41 AM</td>
                                    <td>
                                        <div class="partner-info-cell">
                                            <span class="partner-name">Ana María Torres</span>
                                            <span class="partner-tier">Membresía Individual Gold</span>
                                        </div>
                                    </td>
                                    <td class="doc-cell">10.023.498-K</td>
                                    <td style="text-align: right;">
                                        <span class="badge-status authorized">
                                            <span class="status-indicator"></span>
                                            <span>Autorizado</span>
                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </main>
        </div>

        <!-- Modal de Resultado -->
        <div class="fixed inset-0 z-50 flex items-center justify-center p-4 overflow-hidden <%= mostrarModal ?"": "hidden" %> id="checkinModal" style="background: rgba(0,0,0,0.4);">
            <div class="bg-white w-full max-w-lg rounded-lg relative overflow-hidden border border-slate-200 shadow-xl">
                <!-- Auto-close Timer Bar -->
                <div class="h-1 bg-blue-600 w-full animate-autoclose" id="timerBar"></div>
                <div class="p-12 flex flex-col items-center text-center">
                    <!-- Close Button -->
                    <button aria-label="Cerrar modal"
                            class="absolute top-6 right-6 text-slate-400 hover:text-slate-800 transition-colors"
                            onclick="closeModal()">
                        <span class="material-symbols-outlined">close</span>
                    </button>
                    <!-- Status Icon -->
                    <div class="w-24 h-24 bg-emerald-50 rounded-full flex items-center justify-center mb-8 relative">
                        <div class="absolute inset-0 rounded-full border-2 border-emerald-500/20"></div>
                        <span class="material-symbols-outlined text-emerald-600 text-6xl"
                              style="font-variation-settings: 'FILL' 1;">check_circle</span>
                    </div>
                    <!-- Main Message -->
                    <h3 class="text-sm uppercase tracking-[0.2em] text-emerald-700 mb-2 font-bold">Acceso Autorizado</h3>
                    <h2 class="text-3xl font-bold text-slate-900 mb-8"><%= nombres %></h2>

                    <!-- Membership Details -->
                    <div class="w-full grid grid-cols-2 gap-4 mb-10">
                        <div class="bg-slate-50 p-4 text-left border border-slate-200 rounded">
                            <p class="text-[10px] uppercase text-slate-500 mb-2">Estado Membresía</p>
                            <div class="flex items-center gap-2">
                                <span class="w-2 h-2 rounded-full bg-emerald-500"></span>
                                <span class="text-sm font-bold uppercase tracking-wider text-emerald-700">Activo</span>
                            </div>
                        </div>
                        <div class="bg-slate-50 p-4 text-left border border-slate-200 rounded">
                            <p class="text-[10px] uppercase text-slate-500 mb-2">Plan Actual</p>
                            <span class="text-sm font-bold uppercase tracking-wider text-slate-800">Individual Gold</span>
                        </div>
                    </div>

                    <!-- Progress Info -->
                    <div class="w-full mb-10">
                        <div class="flex justify-between items-end mb-2">
                            <div class="text-left">
                                <p class="text-[10px] uppercase text-slate-500">Vencimiento del Ciclo</p>
                                <p class="text-lg font-bold text-slate-800">Días restantes: <%= diasRestantes %></p>
                            </div>
                            <span class="text-[10px] font-bold text-blue-600">50% COMPLETADO</span>
                        </div>
                        <div class="h-2 w-full bg-slate-200 rounded-full overflow-hidden">
                            <div class="h-full bg-blue-600 w-1/2"></div>
                        </div>
                    </div>

                    <!-- Footer Action -->
                    <button class="w-full bg-blue-600 hover:bg-blue-700 text-white py-5 font-bold uppercase tracking-[0.2em] text-sm transition-all flex items-center justify-center gap-2 rounded shadow-md"
                            style="color: #ffffff;"
                            onclick="closeModal()">
                        Entendido
                        <span class="material-symbols-outlined text-lg " style="color: #ffffff;">check</span>
                    </button>
                    <p class="mt-6 text-[10px] text-slate-400 uppercase tracking-widest">Registrado el 22 de mayo de 2024 a las 13:24</p>
                </div>
            </div>
        </div>

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
        </script>

    </body>
</html>