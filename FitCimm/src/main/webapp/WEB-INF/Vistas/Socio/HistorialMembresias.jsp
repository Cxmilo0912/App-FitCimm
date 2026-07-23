<%-- 
    Document   : HistorialMembresias
    Created on : 23/07/2026, 2:02:57 p. m.
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Detalle de Socio - Partner Manager</title>

    <!-- Tipografía Google Fonts -->
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
            /* Slate 900 (Azul Noche Profundo) */
            --sidebar-hover: #1e293b;
            /* Slate 800 */

            --primary: #2563eb;
            /* Blue 600 (Azul Principal) */
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

            --border-color: #e2e8f0;
            /* Slate 200 */
            --border-focus: #3b82f6;
            /* Blue 500 */

            /* Estados y Badges */
            --status-active-bg: #dcfce7;
            /* Green 100 */
            --status-active-text: #15803d;
            /* Green 700 */
            --status-expired-bg: #f1f5f9;
            /* Slate 100 */
            --status-expired-text: #64748b;
            /* Slate 500 */

            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --radius: 10px;
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
            /* Sky 400 */
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

        .header-search {
            position: relative;
            width: 280px;
        }

        .header-search .material-symbols-outlined {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
            font-size: 18px;
        }

        .header-search input {
            width: 100%;
            padding: 8px 12px 8px 36px;
            font-size: 13px;
            border: 1px solid var(--border-color);
            border-radius: var(--radius);
            outline: none;
            transition: border 0.2s;
        }

        .header-search input:focus {
            border-color: var(--border-focus);
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

        .profile-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid var(--primary-border);
            cursor: pointer;
        }

        /* Canvas Contenedor */
        .content-container {
            flex: 1;
            overflow-y: auto;
            padding: 32px;
            display: flex;
            flex-direction: column;
            gap: 24px;
            max-width: 1440px;
            width: 100%;
            margin: 0 auto;
        }

        /* Botón Volver */
        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: var(--text-muted);
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 8px;
            transition: color 0.2s;
        }

        .back-link:hover {
            color: var(--primary);
        }

        /* Encabezado del Socio */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 16px;
        }

        .partner-title-group {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .partner-title-group h1 {
            font-size: 28px;
            font-weight: 700;
            letter-spacing: -0.02em;
        }

        .badge-status {
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.03em;
        }

        .badge-status.active {
            background-color: var(--status-active-bg);
            color: var(--status-active-text);
        }

        /* Botones de Acción */
        .action-group {
            display: flex;
            gap: 12px;
        }

        .btn-secondary {
            background-color: var(--bg-surface);
            color: var(--text-main);
            border: 1px solid var(--border-color);
            padding: 10px 18px;
            font-size: 14px;
            font-weight: 600;
            border-radius: var(--radius);
            cursor: pointer;
            transition: all 0.2s;
        }

        .btn-secondary:hover {
            background-color: var(--bg-main);
            border-color: #cbd5e1;
        }

        .btn-primary {
            background-color: var(--primary);
            color: var(--text-white);
            border: none;
            padding: 10px 18px;
            font-size: 14px;
            font-weight: 600;
            border-radius: var(--radius);
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(37, 99, 235, 0.2);
            transition: all 0.2s;
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
            box-shadow: 0 4px 8px rgba(37, 99, 235, 0.3);
        }

        /* ==========================================================================
       GRID Y TARJETAS DE INFORMACIÓN
       ========================================================================== */
        .details-grid {
            display: grid;
            grid-template-columns: 340px 1fr;
            gap: 24px;
        }

        @media (max-width: 1024px) {
            .details-grid {
                grid-template-columns: 1fr;
            }
        }

        .info-card {
            background: var(--bg-surface);
            border-radius: var(--radius);
            border: 1px solid var(--border-color);
            box-shadow: var(--shadow-sm);
            padding: 24px;
            display: flex;
            flex-direction: column;
        }

        .card-title {
            font-size: 18px;
            font-weight: 700;
            padding-bottom: 16px;
            border-bottom: 1px solid var(--border-color);
            margin-bottom: 20px;
            color: var(--text-main);
        }

        .info-list {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .info-item {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .info-label {
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--text-muted);
        }

        .info-value {
            font-size: 15px;
            color: var(--text-main);
            font-weight: 500;
        }

        .info-value.mono {
            font-family: 'JetBrains Mono', monospace;
        }

        /* ==========================================================================
       TABLA HISTORIAL DE MEMBRESÍAS
       ========================================================================== */
        .table-card {
            background: var(--bg-surface);
            border-radius: var(--radius);
            border: 1px solid var(--border-color);
            box-shadow: var(--shadow-sm);
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .table-header-padding {
            padding: 24px;
            border-bottom: 1px solid var(--border-color);
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
            background-color: #f1f5f9;
            /* Slate 100 */
            border-bottom: 1px solid var(--border-color);
        }

        th {
            padding: 14px 20px;
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            color: #475569;
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

        /* Badges de Pago */
        .status-pill {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-pill.paid {
            background-color: var(--status-active-bg);
            color: var(--status-active-text);
        }

        .status-pill.expired {
            background-color: var(--status-expired-bg);
            color: var(--status-expired-text);
        }

        .status-pill .material-symbols-outlined {
            font-size: 16px;
        }

        .price-tag {
            font-family: 'JetBrains Mono', monospace;
            font-weight: 600;
        }
    </style>
</head>

<body>

    <!-- Sidebar Lateral -->
    <aside class="sidebar">
        <div class="brand">
            <div class="brand-title">Partner Manager</div>
            <div class="brand-subtitle">Portal Administrativo</div>
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
                <span class="material-symbols-outlined">analytics</span>
                <span>Reportes</span>
            </a>
            <a class="nav-item logout" href="#">
                <span class="material-symbols-outlined">settings</span>
                <span>Configuración</span>
            </a>
        </nav>
    </aside>

    <!-- Contenedor Principal -->
    <div class="main-wrapper">

        <!-- Barra Superior -->
        <header class="top-header">
            <div class="header-search">
                <span class="material-symbols-outlined">search</span>
                <input type="text" placeholder="Buscar socios..." />
            </div>

            <div class="header-actions">
                <button class="icon-btn" title="Notificaciones">
                    <span class="material-symbols-outlined">notifications</span>
                </button>
                <img class="profile-avatar"
                    src="https://lh3.googleusercontent.com/aida-public/AB6AXuCnZawZHMJvj90LAZ9WYwbZO1VbyGqHHAv31Bm8s0oc8BH28zVmBnOdspAMrV9CNX5hsZoVhCl2allcWren7IsaaK9i2JgJuVs_ZbG_lJtPrwFJ8XDWSEC3kuINSEbRiD3r7dkCJ3VrzbAduEJCI8qB8GWPiqc7JlzEEadrhOz8fk7FeBz1SIBfNGTgHVnlQtjQubeXGMhNUnriMKEO4f2CXUlc17DBeFNj2maGnDQm-gA335PKMihg4MZeNlxlT4kwa9P_qroovO7o"
                    alt="Avatar Admin" />
            </div>
        </header>

        <!-- Canvas de Contenido -->
        <main class="content-container">

            <!-- Navegación & Título de Socio -->
            <div>
                <a class="back-link" href="#">
                    <span class="material-symbols-outlined">arrow_back</span>
                    Volver al Listado
                </a>

                <div class="page-header">
                    <div class="partner-title-group">
                        <h1>Carlos Alberto García</h1>
                        <span class="badge-status active">ACTIVO</span>
                    </div>

                    <div class="action-group">
                        <button class="btn-secondary">Editar Socio</button>
                        <button class="btn-primary">Renovar Membresía</button>
                    </div>
                </div>
            </div>

            <!-- Grid de Información General -->
            <div class="details-grid">

                <!-- Tarjeta de Información Personal -->
                <div class="info-card">
                    <h2 class="card-title">Información Personal</h2>

                    <div class="info-list">
                        <div class="info-item">
                            <span class="info-label">Documento</span>
                            <span class="info-value mono">32.456.789</span>
                        </div>

                        <div class="info-item">
                            <span class="info-label">Nombres</span>
                            <span class="info-value">Carlos Alberto</span>
                        </div>

                        <div class="info-item">
                            <span class="info-label">Apellidos</span>
                            <span class="info-value">García</span>
                        </div>

                        <div class="info-item">
                            <span class="info-label">Teléfono</span>
                            <span class="info-value">+54 9 11 1234-5678</span>
                        </div>

                        <div class="info-item">
                            <span class="info-label">Correo Electrónico</span>
                            <span class="info-value">carlos.garcia@email.com</span>
                        </div>

                        <div class="info-item">
                            <span class="info-label">Fecha de Nacimiento</span>
                            <span class="info-value">15/08/1985</span>
                        </div>
                    </div>
                </div>

                <!-- Tarjeta de Historial de Membresías -->
                <div class="table-card">
                    <div class="table-header-padding">
                        <h2 class="card-title" style="margin-bottom:0; border:none; padding:0;">Historial de Membresías
                        </h2>
                    </div>

                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>Plan</th>
                                    <th>Fecha Inicio</th>
                                    <th>Fecha Fin</th>
                                    <th>Estado de Pago</th>
                                    <th>Precio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong>Gold Annual</strong></td>
                                    <td>01/01/2024</td>
                                    <td>31/12/2024</td>
                                    <td>
                                        <span class="status-pill paid">
                                            <span class="material-symbols-outlined">check_circle</span>
                                            Pagado
                                        </span>
                                    </td>
                                    <td class="price-tag">$1,200.00</td>
                                </tr>
                                <tr>
                                    <td><strong>Premium Monthly</strong></td>
                                    <td>01/12/2023</td>
                                    <td>31/12/2023</td>
                                    <td>
                                        <span class="status-pill expired">
                                            <span class="material-symbols-outlined">history</span>
                                            Expirado
                                        </span>
                                    </td>
                                    <td class="price-tag">$150.00</td>
                                </tr>
                                <tr>
                                    <td><strong>Premium Monthly</strong></td>
                                    <td>01/11/2023</td>
                                    <td>30/11/2023</td>
                                    <td>
                                        <span class="status-pill expired">
                                            <span class="material-symbols-outlined">history</span>
                                            Expirado
                                        </span>
                                    </td>
                                    <td class="price-tag">$150.00</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>

        </main>
    </div>

</body>

</html>
