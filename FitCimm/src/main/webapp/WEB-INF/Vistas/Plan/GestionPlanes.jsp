<%-- 
    Document   : GestionPlanes
    Created on : 23/07/2026, 12:41:13 p. m.
    Author     : Admin
--%>

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
    <link
        href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&family=JetBrains+Mono:wght@500&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
        rel="stylesheet" />

    <style>
        /* ==========================================================================
       VARIABLES DE COLOR Y DISEÑO (Paleta Azul)
       ========================================================================== */
        :root {
            --bg-main: #f8fafc;
            /* Slate 50 */
            --bg-surface: #ffffff;
            /* Blanco */
            --sidebar-bg: #0f172a;
            /* Slate 900 (Azul Noche) */
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

            --border-color: #cbd5e1;
            /* Slate 300 */
            --border-focus: #2563eb;
            /* Blue 600 */

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
            display: flex;
            align-items: center;
            gap: 12px;
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

        .top-header {
            height: 70px;
            background-color: var(--bg-surface);
            border-bottom: 1px solid #e2e8f0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 32px;
        }

        .search-box {
            position: relative;
            width: 280px;
        }

        .search-box input {
            width: 100%;
            height: 40px;
            padding: 0 14px 0 40px;
            font-family: inherit;
            font-size: 14px;
            color: var(--text-main);
            background-color: #f8fafc;
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
            cursor: pointer;
        }

        /* Contenedor del Contenido */
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

        /* Cabecera de Página */
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
            color: var(--text-while);
            text-decoration: none;
            
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

        /* Indicadores de Plan */
        .plan-badge-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            display: inline-block;
        }

        .dot-blue {
            background-color: #2563eb;
        }

        .dot-slate {
            background-color: #64748b;
        }

        .dot-sky {
            background-color: #0284c7;
        }

        .dot-muted {
            background-color: #cbd5e1;
        }

        .price-tag {
            font-family: 'JetBrains Mono', monospace;
            font-weight: 600;
        }

        .row-disabled {
            color: #94a3b8;
        }

        /* Botones de Acción de Tabla */
        .action-group {
            display: flex;
            justify-content: flex-end;
            gap: 6px;
            opacity: 0;
            transition: opacity 0.2s ease;
        }

        tbody tr:hover .action-group {
            opacity: 1;
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

        .btn-action.delete:hover {
            background-color: #fef2f2;
            color: #dc2626;
        }

        /* Paginación */
        .table-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 24px;
            background-color: #f8fafc;
            border-top: 1px solid #e2e8f0;
            font-size: 13px;
            color: var(--text-muted);
        }

        .pagination-btns {
            display: flex;
            gap: 6px;
        }

        .pagination-btn {
            background: var(--bg-surface);
            border: 1px solid var(--border-color);
            color: var(--text-main);
            width: 30px;
            height: 30px;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.2s;
        }

        .pagination-btn:hover:not(:disabled) {
            background-color: var(--primary-light);
            border-color: var(--primary-border);
            color: var(--primary);
        }

        .pagination-btn:disabled {
            opacity: 0.4;
            cursor: not-allowed;
        }
    </style>
</head>

<body>

    <!-- Sidebar Lateral -->
    <aside class="sidebar">
        <div class="brand">
            <div class="brand-title">PartnerPortal</div>
            <div class="brand-subtitle">Enterprise Admin</div>
        </div>

        <nav class="nav-menu">
            <a class="nav-item" href="#">
                <span class="material-symbols-outlined">dashboard</span>
                <span>Dashboard</span>
            </a>
            <a class="nav-item active" href="#">
                <span class="material-symbols-outlined">handshake</span>
                <span>Partners & Planes</span>
            </a>
            <a class="nav-item" href="#">
                <span class="material-symbols-outlined">analytics</span>
                <span>Reportes</span>
            </a>
            <a class="nav-item" href="#">
                <span class="material-symbols-outlined">settings</span>
                <span>Configuración</span>
            </a>
        </nav>

        <div class="sidebar-footer">
            <img class="profile-avatar"
                src="https://lh3.googleusercontent.com/aida-public/AB6AXuDETPUfqImUOXVK0CfciSUui6Ij8wcIJ8uGU1Y4Z7MTl2eOq6qnwpN4Q8qPrgFXEqRcxHYZ1sfhOMZr-cig9_9qSD-HDzQNJVPVU6Xo_Jap6glyqhdHA6DDuYORrIFEoqgDx5ilTjyWffmfSSgO7TN90KGpS1ipFhWEO8SPSmq69A3vqx9l68LrsMX7UpOTZMuQaWi57L7wYEOzuEdegoFG2o3x3RE6qYNVLbZ9tIr_G-2a780whL693h3rQ0LXp47nJmy31KCiZX_o"
                alt="Admin Avatar" />
            <div>
                <p style="font-size: 13px; font-weight: 600; color: #fff;">Admin User</p>
                <p style="font-size: 11px; color: #94a3b8;">Activo</p>
            </div>
        </div>
    </aside>

    <!-- Contenedor Principal -->
    <div class="main-wrapper">

        <!-- Barra Superior -->
        <header class="top-header">
            <div class="search-box">
                <span class="material-symbols-outlined">search</span>
                <input type="text" placeholder="Buscar planes..." />
            </div>

            <div class="header-actions">
                <button class="icon-btn" title="Notificaciones">
                    <span class="material-symbols-outlined">notifications</span>
                </button>
                <button class="icon-btn" title="Perfil">
                    <span class="material-symbols-outlined">account_circle</span>
                </button>
            </div>
        </header>

        <!-- Canvas de Contenido -->
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
                                <th style="width: 20%;">Valor (USD)</th>
                                <th style="width: 15%; text-align: right;">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>

                            <!-- Fila 1 -->
                            <tr>
                                <td>
                                    <div style="display: flex; align-items: center; gap: 12px; font-weight: 600;">
                                        <span class="plan-badge-dot dot-blue"></span>
                                        <span>Plan Básico Anual</span>
                                    </div>
                                </td>
                                <td style="color: var(--text-muted);">365</td>
                                <td class="price-tag">$1,200.00</td>
                                <td>
                                    <div class="action-group">
                                        <button class="btn-action" title="Editar">
                                            <span class="material-symbols-outlined" style="font-size: 18px;">edit</span>
                                        </button>
                                        <button class="btn-action delete" title="Eliminar">
                                            <span class="material-symbols-outlined"
                                                style="font-size: 18px;">delete</span>
                                        </button>
                                    </div>
                                </td>
                            </tr>

                            <!-- Fila 2 -->
                            <tr>
                                <td>
                                    <div style="display: flex; align-items: center; gap: 12px; font-weight: 600;">
                                        <span class="plan-badge-dot dot-slate"></span>
                                        <span>Plan Starter Semestral</span>
                                    </div>
                                </td>
                                <td style="color: var(--text-muted);">180</td>
                                <td class="price-tag">$650.00</td>
                                <td>
                                    <div class="action-group">
                                        <button class="btn-action" title="Editar">
                                            <span class="material-symbols-outlined" style="font-size: 18px;">edit</span>
                                        </button>
                                        <button class="btn-action delete" title="Eliminar">
                                            <span class="material-symbols-outlined"
                                                style="font-size: 18px;">delete</span>
                                        </button>
                                    </div>
                                </td>
                            </tr>

                            <!-- Fila 3 -->
                            <tr>
                                <td>
                                    <div style="display: flex; align-items: center; gap: 12px; font-weight: 600;">
                                        <span class="plan-badge-dot dot-sky"></span>
                                        <span>Plan Enterprise (Custom)</span>
                                    </div>
                                </td>
                                <td style="color: var(--text-muted);">365</td>
                                <td class="price-tag">$5,000.00</td>
                                <td>
                                    <div class="action-group">
                                        <button class="btn-action" title="Editar">
                                            <span class="material-symbols-outlined" style="font-size: 18px;">edit</span>
                                        </button>
                                        <button class="btn-action delete" title="Eliminar">
                                            <span class="material-symbols-outlined"
                                                style="font-size: 18px;">delete</span>
                                        </button>
                                    </div>
                                </td>
                            </tr>

                            <!-- Fila 4 (Descontinuado) -->
                            <tr class="row-disabled">
                                <td>
                                    <div style="display: flex; align-items: center; gap: 12px; font-weight: 500;">
                                        <span class="plan-badge-dot dot-muted"></span>
                                        <span>Plan Piloto Mensual (Descontinuado)</span>
                                    </div>
                                </td>
                                <td>30</td>
                                <td class="price-tag">$150.00</td>
                                <td>
                                    <div class="action-group">
                                        <button class="btn-action" title="Editar">
                                            <span class="material-symbols-outlined" style="font-size: 18px;">edit</span>
                                        </button>
                                        <button class="btn-action delete" title="Eliminar">
                                            <span class="material-symbols-outlined"
                                                style="font-size: 18px;">delete</span>
                                        </button>
                                    </div>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>

                <!-- Footer Tabla -->
                <div class="table-footer">
                    <span>Mostrando 4 de 12 planes</span>
                    <div class="pagination-btns">
                        <button class="pagination-btn" disabled>
                            <span class="material-symbols-outlined" style="font-size: 18px;">chevron_left</span>
                        </button>
                        <button class="pagination-btn">
                            <span class="material-symbols-outlined" style="font-size: 18px;">chevron_right</span>
                        </button>
                    </div>
                </div>
            </div>

        </main>
    </div>

</body>

</html>