<%-- 
    Document   : Membresia
    Created on : 23/07/2026, 1:59:33 p. m.
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Gestión de Membresías - Partner Manager</title>
  
  <!-- Tipografía Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>

  <style>
    :root {
      --bg-main: #f8fafc;            /* Slate 50 */
      --bg-surface: #ffffff;         /* Blanco */
      --sidebar-bg: #0f172a;         /* Slate 900 */
      --sidebar-hover: #1e293b;      /* Slate 800 */
      
      --primary: #2563eb;            /* Blue 600 */
      --primary-hover: #1d4ed8;      /* Blue 700 */
      --primary-light: #eff6ff;      /* Blue 50 */
      --primary-border: #bfdbfe;     /* Blue 200 */
      
      --text-main: #0f172a;          /* Slate 900 */
      --text-muted: #64748b;         /* Slate 500 */
      --text-white: #ffffff;
      
      --border-color: #cbd5e1;       /* Slate 300 */
      --border-focus: #2563eb;       /* Blue 600 */
      
      --shadow-sm: 0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1);
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

    /* BARRA LATERAL (Sidebar) */
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

    /* ESTRUCTURA PRINCIPAL Y HEADER */
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
    }

    /* CONTENEDOR DE CONTENIDO */
    .content-container {
      flex: 1;
      overflow-y: auto;
      padding: 32px;
      display: flex;
      flex-direction: column;
      max-width: 1100px;
      width: 100%;
      margin: 0 auto;
      gap: 24px;
    }

    .page-actions-bar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background: var(--bg-surface);
      padding: 20px 24px;
      border-radius: 12px;
      border: 1px solid #e2e8f0;
      box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
    }

    .page-actions-bar h2 {
      font-size: 18px;
      font-weight: 700;
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
      text-decoration: none;
      transition: all 0.2s;
    }

    .btn-primary:hover {
      background-color: var(--primary-hover);
      box-shadow: 0 4px 10px rgba(37, 99, 235, 0.35);
    }

    /* TABLA DE DATOS */
    .table-card {
      background: var(--bg-surface);
      border-radius: 12px;
      border: 1px solid #e2e8f0;
      box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
      overflow: hidden;
    }

    .table-responsive {
      width: 100%;
      overflow-x: auto;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      text-align: left;
      font-size: 14px;
    }

    th {
      background-color: #0f172a;
      color: white;
      font-family: 'JetBrains Mono', monospace;
      font-size: 11px;
      text-transform: uppercase;
      letter-spacing: 0.05em;
      padding: 14px 20px;
    }

    td {
      padding: 16px 20px;
      border-bottom: 1px solid #e2e8f0;
      color: var(--text-main);
    }

    tr:last-child td {
      border-bottom: none;
    }

    tr:hover td {
      background-color: #f8fafc;
    }

    .mono {
      font-family: 'JetBrains Mono', monospace;
      color: var(--text-muted);
      font-size: 13px;
    }

    /* BADGES */
    .badge {
      display: inline-flex;
      align-items: center;
      padding: 4px 10px;
      font-size: 11px;
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

    .badge-vencida {
      background-color: #fee2e2;
      color: #991b1b;
      border: 1px solid #fecaca;
    }

    /* BOTÓN RENOVACIÓN */
    .btn-renew {
      background-color: #fef3c7;
      color: #92400e;
      border: 1px solid #fde68a;
      padding: 6px 12px;
      font-size: 12px;
      font-weight: 600;
      border-radius: 6px;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      gap: 4px;
      transition: all 0.2s;
    }

    .btn-renew:hover {
      background-color: #fde68a;
    }

    .text-center {
      text-align: center;
    }
  </style>
</head>
<body>

  <jsp:include page="/WEB-INF/Vistas/Menu.jsp" />
  <!-- Contenedor Principal -->
  <main class="main-wrapper">
    
   

    <!-- Canvas de Contenido -->
    <div class="content-container">
      
      <!-- Barra de Acciones / Título -->
      <div class="page-actions-bar">
        <div>
          <h2>Listado de Membresías</h2>
          <p style="font-size: 13px; color: var(--text-muted); margin-top: 2px;">Gestione y renueve los planes de los socios activos.</p>
        </div>
        <a class="btn-primary" href="${pageContext.request.contextPath}/MembresiaController?accion=nuevo">
          <span class="material-symbols-outlined" style="font-size: 20px;">add</span>
          Nueva Membresía
        </a>
      </div>

      <!-- Tarjeta de Tabla -->
      <div class="table-card">
        <div class="table-responsive">
          <table>
            <thead>
              <tr>
                <th>Cód. Socio</th>
                <th>Nombre del Socio</th>
                <th>Plan Asignado</th>
                <th>Válido Hasta</th>
                <th>Estado</th>
                <th class="text-center">Acciones</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="mono">SOC-8921</td>
                <td style="font-weight: 600;">Valeria Albornoz</td>
                <td>Plan Premium Anual</td>
                <td class="mono">15/12/2026</td>
                <td><span class="badge badge-vigente">Vigente</span></td>
                <td class="text-center">
                  <button class="btn-renew" onclick="window.location.href='formularioMembresia.html?accion=renovar&socio=SOC-8921';">
                    <span class="material-symbols-outlined" style="font-size: 16px;">sync</span> Renovar
                  </button>
                </td>
              </tr>
              <tr>
                <td class="mono">SOC-8922</td>
                <td style="font-weight: 600;">Matías Benítez</td>
                <td>Plan Exec Trimestral</td>
                <td class="mono">30/09/2026</td>
                <td><span class="badge badge-vigente">Vigente</span></td>
                <td class="text-center">
                  <button class="btn-renew" onclick="window.location.href='formularioMembresia.html?accion=renovar&socio=SOC-8922';">
                    <span class="material-symbols-outlined" style="font-size: 16px;">sync</span> Renovar
                  </button>
                </td>
              </tr>
              <tr>
                <td class="mono">SOC-8925</td>
                <td style="font-weight: 600;">Camila Fuentes</td>
                <td>Plan Base Mensual</td>
                <td class="mono" style="color: #dc2626;">10/06/2026</td>
                <td><span class="badge badge-vencida">Vencida</span></td>
                <td class="text-center">
                  <button class="btn-renew" onclick="window.location.href='formularioMembresia.html?accion=renovar&socio=SOC-8925';">
                    <span class="material-symbols-outlined" style="font-size: 16px;">sync</span> Renovar
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

    </div>
  </main>

</body>
</html>