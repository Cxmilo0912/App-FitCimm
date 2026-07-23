<%-- 
    Document   : SociosPorVencer
    Created on : 23/07/2026, 2:03:58 p. m.
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Socios por Vencer - Partner Manager</title>

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
            /* Slate 50 */
            --bg-surface: #ffffff;
            /* Blanco */
            --sidebar-bg: #0f172a;
            /* Slate 900 */
            --sidebar-hover: #1e293b;
            /* Slate 800 */

            --primary: #2563eb;
            /* Blue 600 */
            --primary-hover: #1d4ed8;
            /* Blue 700 */
            --primary-light: #eff6ff;
            /* Blue 50 */
            --primary-border: #bfdbfe;
            /* Blue 200 */

            --text-main: #0f172a;
            /* Slate 900 */
            --text-muted: #64748b;
            /* Slate 500 */
            --text-white: #ffffff;

            --warning-bg: #fffbebfb;
            /* Amber 50 */
            --warning-text: #d97706;
            /* Amber 600 */
            --warning-border: #fde68a;
            /* Amber 200 */

            --border-color: #cbd5e1;
            /* Slate 300 */
            --border-light: #e2e8f0;
            /* Slate 200 */
            --border-focus: #2563eb;
            /* Blue 600 */

            --shadow-sm: 0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1);
            --shadow-card: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
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

        .sidebar-footer {
            margin-top: auto;
            padding-top: 16px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .btn-new-partner {
            width: 100%;
            background-color: var(--primary);
            color: var(--text-white);
            border: none;
            padding: 10px 16px;
            font-size: 14px;
            font-weight: 600;
            border-radius: var(--radius);
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: all 0.2s;
        }

        .btn-new-partner:hover {
            background-color: var(--primary-hover);
        }

        /* ==========================================================================
       HEADER Y CONTENIDO PRINCIPAL
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
            border-bottom: 1px solid var(--border-light);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 32px;
        }

        .search-box {
            position: relative;
            width: 320px;
        }

        .search-box input {
            width: 100%;
            height: 40px;
            padding: 0 14px 0 40px;
            font-family: inherit;
            font-size: 14px;
            color: var(--text-main);
            background-color: var(--bg-main);
            border: 1.5px solid var(--border-color);
            border-radius: var(--radius);
            outline: none;
            transition: all 0.2s ease;
        }

        .search-box input:focus {
            background-color: #ffffff;
            border-color: var(--border-focus);
            box-shadow: var(--shadow-input-focus);
        }

        .search-box .material-symbols-outlined {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
            font-size: 20px;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .icon-btn {
            background: transparent;
            border: 1px solid var(--border-light);
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

        /* Canvas Contenedor */
        .content-container {
            flex: 1;
            overflow-y: auto;
            padding: 32px;
            max-width: 1360px;
            width: 100%;
            margin: 0 auto;
        }

        .page-title {
            display: flex;
            align-items: baseline;
            gap: 12px;
            margin-bottom: 16px;
        }

        .page-title h1 {
            font-size: 26px;
            font-weight: 700;
            letter-spacing: -0.01em;
        }

        .page-title span {
            font-size: 18px;
            color: var(--text-muted);
            font-weight: 400;
        }

        /* Banner Informativo */
        .info-banner {
            background-color: var(--primary-light);
            border: 1px solid var(--primary-border);
            border-radius: var(--radius);
            padding: 14px 18px;
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 24px;
            color: var(--text-main);
            font-size: 14px;
        }

        .info-banner .material-symbols-outlined {
            color: var(--primary);
            font-size: 22px;
        }

        /* ==========================================================================
       TABLA DE DATOS
       ========================================================================== */
        .table-card {
            background: var(--bg-surface);
            border-radius: 12px;
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-card);
            overflow: hidden;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        .data-table th {
            background-color: var(--sidebar-bg);
            color: var(--text-white);
            font-family: 'JetBrains Mono', monospace;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            padding: 14px 20px;
            font-weight: 600;
        }

        .data-table td {
            padding: 16px 20px;
            border-bottom: 1px solid var(--border-light);
            font-size: 14px;
            color: var(--text-main);
        }

        .data-table tbody tr:last-child td {
            border-bottom: none;
        }

        .data-table tbody tr:hover {
            background-color: #f1f5f9;
        }

        /* Componentes de Tabla */
        .doc-id {
            font-family: 'JetBrains Mono', monospace;
            font-size: 13px;
            color: var(--text-muted);
        }

        .partner-name {
            font-weight: 600;
            color: var(--text-main);
        }

        .plan-badge {
            display: inline-block;
            background-color: #f1f5f9;
            color: var(--text-main);
            border: 1px solid var(--border-color);
            padding: 4px 10px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
        }

        .warning-days {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            color: var(--warning-text);
            font-weight: 600;
        }

        .warning-days .material-symbols-outlined {
            font-size: 18px;
        }

        .normal-days {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            color: var(--text-muted);
            font-weight: 500;
        }

        .normal-days .material-symbols-outlined {
            font-size: 18px;
        }

        /* Botones de Tabla */
        .actions-cell {
            text-align: right;
            white-space: nowrap;
        }

        .btn-action-secondary {
            background-color: transparent;
            border: 1.5px solid var(--border-color);
            color: var(--text-main);
            padding: 6px 14px;
            font-size: 12px;
            font-weight: 600;
            border-radius: var(--radius);
            cursor: pointer;
            margin-right: 6px;
            transition: all 0.2s;
        }

        .btn-action-secondary:hover {
            background-color: var(--border-light);
        }

        .btn-action-primary {
            background-color: var(--primary);
            color: var(--text-white);
            border: none;
            padding: 7px 16px;
            font-size: 12px;
            font-weight: 600;
            border-radius: var(--radius);
            cursor: pointer;
            transition: all 0.2s;
        }

        .btn-action-primary:hover {
            background-color: var(--primary-hover);
        }

        /* Paginación */
        .pagination-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px 20px;
            border-top: 1px solid var(--border-light);
            background-color: var(--bg-surface);
            font-size: 13px;
            color: var(--text-muted);
        }

        .pagination-controls {
            display: flex;
            gap: 6px;
        }

        .pagination-btn {
            background: var(--bg-surface);
            border: 1px solid var(--border-color);
            color: var(--text-main);
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 13px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .pagination-btn:hover:not(:disabled) {
            background-color: var(--border-light);
        }

        .pagination-btn.active {
            background-color: var(--primary);
            color: var(--text-white);
            border-color: var(--primary);
            font-weight: 600;
        }

        .pagination-btn:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }
    </style>
</head>

<body>

    <!-- Sidebar Lateral -->
    <aside class="sidebar">
        <div class="brand">
            <div class="brand-title">PartnerPortal</div>
            <div class="brand-subtitle">Admin Console</div>
        </div>

        <nav class="nav-menu">
            <a class="nav-item" href="#">
                <span class="material-symbols-outlined">dashboard</span>
                <span>Dashboard</span>
            </a>
            <a class="nav-item active" href="#">
                <span class="material-symbols-outlined">group</span>
                <span>Socios</span>
            </a>
            <a class="nav-item" href="#">
                <span class="material-symbols-outlined">payments</span>
                <span>Planes</span>
            </a>
            <a class="nav-item" href="#">
                <span class="material-symbols-outlined">description</span>
                <span>Contratos</span>
            </a>
            <a class="nav-item" href="#">
                <span class="material-symbols-outlined">assessment</span>
                <span>Reportes</span>
            </a>
        </nav>

        <div class="sidebar-footer">
            <button class="btn-new-partner">
                <span class="material-symbols-outlined">add</span>
                <span>Nuevo Socio</span>
            </button>
        </div>
    </aside>

    <!-- Contenedor Principal -->
    <div class="main-wrapper">

        <!-- Header Superior -->
        <header class="top-header">
            <div class="search-box">
                <span class="material-symbols-outlined">search</span>
                <input type="text" placeholder="Buscar socios..." />
            </div>

            <div class="header-actions">
                <button class="icon-btn" title="Notificaciones">
                    <span class="material-symbols-outlined">notifications</span>
                </button>
                <button class="icon-btn" title="Configuración">
                    <span class="material-symbols-outlined">settings</span>
                </button>
                <img class="profile-avatar"
                    src="https://lh3.googleusercontent.com/aida-public/AB6AXuA6XxNvG21BFQw-e_JxuGIMh2q5S9MHkV1m3RZ6z8izMoDLuGyqvO9Ya4KJf_EfOe5-paaZhnqndo9_BHAX8D1JMy-xCwCFsgJQfmbpyXYnA2IG5KOD_sGizfk5L5e1V4rRX-TcDbeagaY-hpKCOYyiAR5raBMfXPer-BngkbB4j65bTA_omgyVnGeKWypYxfeueeyM4cVlpoTQSBuSk_5iGqhctx27_ydkC0JyB5YaPXDPSbpZoxYFBTbrWYv_qMM6hqzouESJqWLD"
                    alt="Avatar" />
            </div>
        </header>

        <!-- Canvas de Contenido -->
        <main class="content-container">

            <!-- Título de Página -->
            <div class="page-title">
                <h1>Socios por Vencer</h1>
                <span>(Próximos 5 días)</span>
            </div>

            <!-- Banner Informativo -->
            <div class="info-banner">
                <span class="material-symbols-outlined">info</span>
                <div>Mostrando socios con vencimiento entre el <strong>24 de Octubre</strong> y el <strong>29 de
                        Octubre</strong>.</div>
            </div>

            <!-- Tarjeta Tabla -->
            <div class="table-card">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Documento</th>
                            <th>Nombre del Socio</th>
                            <th>Plan Actual</th>
                            <th>Fecha Vencimiento</th>
                            <th>Días Restantes</th>
                            <th style="text-align: right;">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Fila 1 -->
                        <tr>
                            <td class="doc-id">DOC-8923</td>
                            <td class="partner-name">Acme Corp International</td>
                            <td><span class="plan-badge">Enterprise Tier 1</span></td>
                            <td style="color: var(--text-muted);">25 Oct 2023</td>
                            <td>
                                <div class="warning-days">
                                    <span class="material-symbols-outlined">warning</span>
                                    <span>1 día</span>
                                </div>
                            </td>
                            <td class="actions-cell">
                                <button class="btn-action-secondary">RECORDATORIO</button>
                                <button class="btn-action-primary">RENOVAR</button>
                            </td>
                        </tr>

                        <!-- Fila 2 -->
                        <tr>
                            <td class="doc-id">DOC-4410</td>
                            <td class="partner-name">Global Logistics LLC</td>
                            <td><span class="plan-badge">Standard Plus</span></td>
                            <td style="color: var(--text-muted);">26 Oct 2023</td>
                            <td>
                                <div class="warning-days">
                                    <span class="material-symbols-outlined">warning</span>
                                    <span>2 días</span>
                                </div>
                            </td>
                            <td class="actions-cell">
                                <button class="btn-action-secondary">RECORDATORIO</button>
                                <button class="btn-action-primary">RENOVAR</button>
                            </td>
                        </tr>

                        <!-- Fila 3 -->
                        <tr>
                            <td class="doc-id">DOC-7752</td>
                            <td class="partner-name">TechNova Solutions</td>
                            <td><span class="plan-badge">Pro Monthly</span></td>
                            <td style="color: var(--text-muted);">28 Oct 2023</td>
                            <td>
                                <div class="normal-days">
                                    <span class="material-symbols-outlined">schedule</span>
                                    <span>4 días</span>
                                </div>
                            </td>
                            <td class="actions-cell">
                                <button class="btn-action-secondary">RECORDATORIO</button>
                                <button class="btn-action-primary">RENOVAR</button>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <!-- Paginación -->
                <div class="pagination-bar">
                    <span>Mostrando 3 de 12 socios por vencer</span>
                    <div class="pagination-controls">
                        <button class="pagination-btn" disabled>Anterior</button>
                        <button class="pagination-btn active">1</button>
                        <button class="pagination-btn">2</button>
                        <button class="pagination-btn">3</button>
                        <button class="pagination-btn">Siguiente</button>
                    </div>
                </div>
            </div>

        </main>
    </div>

</body>

</html>

