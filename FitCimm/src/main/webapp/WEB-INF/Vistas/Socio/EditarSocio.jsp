<%-- 
    Document   : EditarSocio
    Created on : 23/07/2026, 12:39:55 p. m.
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Editar Socio - Partner Manager</title>

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

        .nav-item.logout {
            margin-top: auto;
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
            cursor: pointer;
        }

        /* Contenedor del Formulario */
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

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: var(--text-muted);
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 16px;
            transition: color 0.2s;
        }

        .back-link:hover {
            color: var(--primary);
        }

        /* ==========================================================================
       TARJETA DE FORMULARIO & CAJAS DE TEXTO
       ========================================================================== */
        .form-card {
            background: var(--bg-surface);
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            padding: 32px;
        }

        .form-header {
            border-bottom: 1px solid #e2e8f0;
            padding-bottom: 20px;
            margin-bottom: 28px;
        }

        .form-header h1 {
            font-size: 24px;
            font-weight: 700;
            letter-spacing: -0.01em;
            color: var(--text-main);
        }

        .form-header p {
            font-size: 14px;
            color: var(--text-muted);
            margin-top: 4px;
        }

        .section-title {
            font-size: 16px;
            font-weight: 700;
            color: var(--text-main);
            padding-bottom: 8px;
            margin-bottom: 20px;
            border-bottom: 1px solid #e2e8f0;
        }

        .form-section {
            margin-bottom: 28px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px 24px;
        }

        @media (max-width: 640px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
        }

        .field-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .input-label {
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.04em;
            color: #475569;
        }

        /* Cajas de Texto Reforzadas */
        .input-control {
            width: 100%;
            height: 44px;
            padding: 0 14px;
            font-family: inherit;
            font-size: 14px;
            color: var(--text-main);
            background-color: #f8fafc;
            border: 1.5px solid var(--border-color);
            border-radius: var(--radius);
            outline: none;
            box-shadow: var(--shadow-sm);
            transition: all 0.2s ease-in-out;
        }

        .input-control.mono {
            font-family: 'JetBrains Mono', monospace;
        }

        .input-control:hover {
            background-color: #ffffff;
            border-color: #94a3b8;
        }

        .input-control:focus {
            background-color: #ffffff;
            border-color: var(--border-focus);
            box-shadow: var(--shadow-input-focus);
        }

        /* Acciones del Formulario */
        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            padding-top: 24px;
            border-top: 1px solid #e2e8f0;
        }

        .btn-secondary {
            background-color: var(--bg-surface);
            color: var(--text-main);
            border: 1px solid var(--border-color);
            padding: 10px 20px;
            font-size: 14px;
            font-weight: 600;
            border-radius: var(--radius);
            cursor: pointer;
            transition: all 0.2s;
        }

        .btn-secondary:hover {
            background-color: var(--bg-main);
            border-color: #94a3b8;
        }

        .btn-primary {
            background-color: var(--primary);
            color: var(--text-white);
            border: none;
            padding: 10px 24px;
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
            <div class="header-title">Gestión de Socios</div>

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

            <!-- Link de retorno -->
            <div>
                <a class="back-link" href="#">
                    <span class="material-symbols-outlined">arrow_back</span>
                    Volver al Detalle
                </a>
            </div>

            <!-- Tarjeta del Formulario -->
            <div class="form-card">
                <div class="form-header">
                    <h1>Editar Datos del Socio</h1>
                    <p>Actualice la información del socio. Los campos marcados con * son obligatorios.</p>
                </div>

                <form action="#" method="POST" onsubmit="event.preventDefault();">

                    <!-- Sección: Información Personal -->
                    <div class="form-section">
                        <h2 class="section-title">Información Personal</h2>
                        <div class="form-grid">
                            <div class="field-group">
                                <label class="input-label" for="documento">Documento *</label>
                                <input class="input-control mono" id="documento" name="documento" type="text"
                                    value="32.456.789" required />
                            </div>

                            <div class="field-group">
                                <label class="input-label" for="fecha_nacimiento">Fecha de Nacimiento *</label>
                                <input class="input-control" id="fecha_nacimiento" name="fecha_nacimiento" type="date"
                                    value="1985-08-15" required />
                            </div>

                            <div class="field-group">
                                <label class="input-label" for="nombres">Nombres *</label>
                                <input class="input-control" id="nombres" name="nombres" type="text"
                                    value="Carlos Alberto" required />
                            </div>

                            <div class="field-group">
                                <label class="input-label" for="apellidos">Apellidos *</label>
                                <input class="input-control" id="apellidos" name="apellidos" type="text" value="García"
                                    required />
                            </div>
                        </div>
                    </div>

                    <!-- Sección: Datos de Contacto -->
                    <div class="form-section">
                        <h2 class="section-title">Datos de Contacto</h2>
                        <div class="form-grid">
                            <div class="field-group">
                                <label class="input-label" for="telefono">Teléfono *</label>
                                <input class="input-control" id="telefono" name="telefono" type="tel"
                                    value="+54 9 11 1234-5678" required />
                            </div>

                            <div class="field-group">
                                <label class="input-label" for="correo">Correo Electrónico *</label>
                                <input class="input-control" id="correo" name="correo" type="email"
                                    value="carlos.garcia@email.com" required />
                            </div>
                        </div>
                    </div>

                    <!-- Acciones -->
                    <div class="form-actions">
                        <button class="btn-secondary" type="button">Cancelar</button>
                        <button class="btn-primary" type="submit">
                            <span class="material-symbols-outlined" style="font-size: 18px;">save</span>
                            Guardar Cambios
                        </button>
                    </div>

                </form>
            </div>

        </main>
    </div>

</body>

</html>



