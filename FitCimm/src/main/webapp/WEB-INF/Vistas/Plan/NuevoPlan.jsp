<%-- 
    Document   : NuevoPlan
    Created on : 23/07/2026, 2:00:23 p. m.
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Agregar Nuevo Plan - Partner Manager</title>

    <!-- Tipografías e Iconos -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&family=JetBrains+Mono:wght@500&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
        rel="stylesheet" />

    <style>
        /* ==========================================================================
       VARIABLES DE COLOR Y DISEÑO (Paleta Azul / Slate System)
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
            max-width: 900px;
            width: 100%;
            margin: 0 auto;
        }

        /* Cabecera de Formulario */
        .btn-back {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: var(--text-muted);
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            background-color: #e2e8f0;
            padding: 6px 14px;
            border-radius: 20px;
            margin-bottom: 16px;
            transition: all 0.2s;
        }

        .btn-back:hover {
            background-color: var(--primary-light);
            color: var(--primary);
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
            margin-bottom: 24px;
        }

        /* ==========================================================================
       FORMULARIO DE PLAN
       ========================================================================== */
        .form-card {
            background: var(--bg-surface);
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            padding: 32px;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 24px;
        }

        .input-group label {
            font-family: 'JetBrains Mono', monospace;
            font-size: 12px;
            text-transform: uppercase;
            font-weight: 600;
            color: var(--text-muted);
            margin-bottom: 8px;
            letter-spacing: 0.03em;
        }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-wrapper .material-symbols-outlined {
            position: absolute;
            left: 14px;
            color: var(--text-muted);
            font-size: 20px;
        }

        .input-field {
            width: 100%;
            height: 44px;
            padding: 0 16px;
            font-family: inherit;
            font-size: 15px;
            color: var(--text-main);
            background-color: #ffffff;
            border: 1.5px solid var(--border-color);
            border-radius: var(--radius);
            outline: none;
            transition: all 0.2s ease;
        }

        .input-wrapper .input-field {
            padding-left: 44px;
        }

        textarea.input-field {
            height: auto;
            padding: 12px 16px;
            resize: vertical;
        }

        .input-field:focus {
            border-color: var(--border-focus);
            box-shadow: var(--shadow-input-focus);
        }

        .input-hint {
            font-size: 12px;
            color: var(--text-muted);
            margin-top: 6px;
        }

        .grid-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        @media (max-width: 640px) {
            .grid-2 {
                grid-template-columns: 1fr;
            }
        }

        .form-divider {
            border: 0;
            height: 1px;
            background-color: #e2e8f0;
            margin: 24px 0;
        }

        /* Acciones */
        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
        }

        .btn-secondary {
            background-color: transparent;
            border: 1.5px solid var(--border-color);
            color: var(--text-main);
            padding: 10px 20px;
            font-size: 14px;
            font-weight: 600;
            border-radius: var(--radius);
            cursor: pointer;
            transition: all 0.2s;
        }

        .btn-secondary:hover {
            background-color: #f1f5f9;
            border-color: #94a3b8;
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
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
            box-shadow: 0 4px 10px rgba(37, 99, 235, 0.35);
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
                <input type="text" placeholder="Buscar en la consola..." />
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

            <div>
                <a href="#" class="btn-back">
                    <span class="material-symbols-outlined" style="font-size: 16px;">arrow_back</span>
                    Volver a Planes
                </a>
            </div>

            <div class="page-title">
                <h1>Agregar Nuevo Plan</h1>
                <p>Configure los detalles del nuevo plan de suscripción para socios. Complete la información requerida a
                    continuación.</p>
            </div>

            <!-- Tarjeta Formulario -->
            <div class="form-card">
                <form>

                    <!-- Nombre del Plan -->
                    <div class="input-group">
                        <label for="plan_name">Nombre del Plan</label>
                        <input type="text" id="plan_name" class="input-field" placeholder="Ej. Premium Corporate" />
                        <span class="input-hint">El nombre visible para los socios en el portal de
                            administración.</span>
                    </div>

                    <div class="grid-2">
                        <!-- Duración -->
                        <div class="input-group">
                            <label for="plan_duration">Duración (Días)</label>
                            <div class="input-wrapper">
                                <span class="material-symbols-outlined">calendar_month</span>
                                <input type="number" id="plan_duration" class="input-field" placeholder="365" />
                            </div>
                        </div>

                        <!-- Valor -->
                        <div class="input-group">
                            <label for="plan_value">Valor (USD)</label>
                            <div class="input-wrapper">
                                <span class="material-symbols-outlined">attach_money</span>
                                <input type="number" id="plan_value" step="0.01" class="input-field"
                                    placeholder="999.00" />
                            </div>
                        </div>
                    </div>

                    <!-- Descripción -->
                    <div class="input-group">
                        <label for="plan_description">Descripción (Opcional)</label>
                        <textarea id="plan_description" class="input-field" rows="4"
                            placeholder="Breve descripción de los beneficios del plan..."></textarea>
                    </div>

                    <hr class="form-divider" />

                    <!-- Botones de Acción -->
                    <div class="form-actions">
                        <button type="button" class="btn-secondary">Cancelar</button>
                        <button type="submit" class="btn-primary">
                            <span class="material-symbols-outlined" style="font-size: 18px;">save</span>
                            Guardar Plan
                        </button>
                    </div>

                </form>
            </div>

        </main>
    </div>

</body>

</html>





