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
  <title>Listar Socios - Partner Manager</title>
  
  <!-- Tipografía Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>

  <style>
    /* ==========================================================================
       VARIABLES DE COLOR Y DISEÑO (Paleta Azul)
       ========================================================================== */
    :root {
      --bg-main: #f8fafc;            /* Slate 50 */
      --bg-surface: #ffffff;         /* Blanco */
      --sidebar-bg: #0f172a;         /* Slate 900 (Azul Noche Profundo) */
      --sidebar-hover: #1e293b;      /* Slate 800 */
      
      --primary: #2563eb;            /* Blue 600 (Azul Principal) */
      --primary-hover: #1d4ed8;      /* Blue 700 */
      --primary-light: #eff6ff;      /* Blue 50 */
      --primary-border: #bfdbfe;     /* Blue 200 */
      
      --text-main: #0f172a;          /* Slate 900 */
      --text-muted: #64748b;         /* Slate 500 */
      --text-white: #ffffff;
      
      --border-color: #e2e8f0;       /* Slate 200 */
      --border-focus: #3b82f6;       /* Blue 500 */
      
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
      color: #38bdf8; /* Sky 400 */
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

    .page-title-sm {
      font-size: 18px;
      font-weight: 600;
      color: var(--text-main);
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
    }

    .page-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
      gap: 16px;
    }

    .title-area h1 {
      font-size: 28px;
      font-weight: 700;
      letter-spacing: -0.02em;
    }

    .title-area p {
      color: var(--text-muted);
      font-size: 14px;
      margin-top: 4px;
    }

    /* Botón Primario */
    .btn-primary {
      background-color: var(--primary);
      color: var(--text-white);
      border: none;
      padding: 10px 20px;
      font-size: 14px;
      font-weight: 600;
      border-radius: var(--radius);
      display: inline-flex;
      align-items: center;
      gap: 8px;
      cursor: pointer;
      box-shadow: 0 2px 4px rgba(37, 99, 235, 0.2);
      transition: all 0.2s;
    }

    .btn-primary:hover {
      background-color: var(--primary-hover);
      box-shadow: 0 4px 8px rgba(37, 99, 235, 0.3);
    }

    /* ==========================================================================
       FILTROS Y BÚSQUEDA
       ========================================================================== */
    .filter-card {
      background: var(--bg-surface);
      padding: 16px;
      border-radius: var(--radius);
      border: 1px solid var(--border-color);
      box-shadow: var(--shadow-sm);
    }

    .search-input-wrapper {
      position: relative;
      max-width: 480px;
    }

    .search-input-wrapper .material-symbols-outlined {
      position: absolute;
      left: 14px;
      top: 50%;
      transform: translateY(-50%);
      color: var(--text-muted);
      font-size: 20px;
    }

    .search-input {
      width: 100%;
      padding: 10px 16px 10px 42px;
      font-size: 14px;
      border: 1px solid var(--border-color);
      border-radius: var(--radius);
      outline: none;
      transition: border 0.2s;
    }

    .search-input:focus {
      border-color: var(--border-focus);
      box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
    }

    /* ==========================================================================
       TABLA DE DATOS
       ========================================================================== */
    .table-card {
      background: var(--bg-surface);
      border-radius: var(--radius);
      border: 1px solid var(--border-color);
      box-shadow: var(--shadow-sm);
      overflow: hidden;
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
      background-color: #f1f5f9; /* Slate 100 */
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

    .doc-badge {
      font-family: 'JetBrains Mono', monospace;
      font-size: 13px;
      color: #334155;
      background: #f1f5f9;
      padding: 4px 8px;
      border-radius: 4px;
    }

    .td-muted {
      color: var(--text-muted);
    }

    /* Botones de acción dentro de la tabla */
    .actions-cell {
      text-align: right;
    }

    .action-btn {
      background: transparent;
      border: none;
      color: var(--text-muted);
      cursor: pointer;
      padding: 6px;
      border-radius: 6px;
      transition: all 0.2s;
    }

    .action-btn:hover {
      background-color: #dbeafe;
      color: var(--primary);
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
      <div class="page-title-sm">Gestión de Socios</div>
      
      <div class="header-actions">
        <button class="icon-btn" title="Notificaciones">
          <span class="material-symbols-outlined">notifications</span>
        </button>
        <img class="profile-avatar" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBLCpezIGanVPxaRX1lEqsUpXZe-HJ9IFEaqGoKfUys6mppa5EkpljUNsuzBUqCRBXKKQXqHDPS6NJ5qJ4oKKiaL07n6an0DdIkSCQflh8w9_akEY5_VRNivviMMKOoqYZqcECtrM9ZExDA-i5ZmV5fnuZzACNaqurP0VLO0FoujrxsCkjn_Nr8SLv0qC4rIwraVKu6G-zTjyOtf7Yc32JgLlChZPVS_pqHjPeHZfoVJ3FDTyrutgtxOOTbf_dmuCxhh4bNaG4Coxne" alt="Avatar"/>
      </div>
    </header>

    <!-- Canvas de Contenido -->
    <main class="content-container">
      
      <!-- Encabezado de Página & Acciones -->
      <div class="page-header">
        <div class="title-area">
          <h1>Listado de Socios</h1>
          <p>Consulta, busca y gestiona la información general del padrón de socios activos.</p>
        </div>
        <button class="btn-primary">
          <span class="material-symbols-outlined">add</span>
          Agregar Socio
        </button>
      </div>

      <!-- Área de Búsqueda -->
      <div class="filter-card">
        <div class="search-input-wrapper">
          <span class="material-symbols-outlined">search</span>
          <input class="search-input" type="text" placeholder="Buscar por documento, nombre o apellido..."/>
        </div>
      </div>

      <!-- Tabla de Datos -->
      <div class="table-card">
        <div class="table-wrapper">
          <table>
            <thead>
              <tr>
                <th>Documento</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Teléfono</th>
                <th>Correo Electrónico</th>
                <th>Fecha Nac.</th>
                <th style="text-align: right;">Acciones</th>
              </tr>
            </thead>
            <tbody>
              <!-- Fila 1 -->
              <tr>
                <td><span class="doc-badge">32.456.789</span></td>
                <td><strong>Carlos Alberto</strong></td>
                <td>García</td>
                <td class="td-muted">+54 11 4567-8901</td>
                <td class="td-muted">carlos.garcia@email.com</td>
                <td>15/04/1986</td>
                <td class="actions-cell">
                  <button class="action-btn" title="Ver detalle"><span class="material-symbols-outlined">visibility</span></button>
                  <button class="action-btn" title="Editar"><span class="material-symbols-outlined">edit</span></button>
                </td>
              </tr>
              <!-- Fila 2 -->
              <tr>
                <td><span class="doc-badge">28.901.234</span></td>
                <td><strong>María Fernanda</strong></td>
                <td>López Silva</td>
                <td class="td-muted">+54 351 234-5678</td>
                <td class="td-muted">mfer.lopez@email.com</td>
                <td>02/11/1980</td>
                <td class="actions-cell">
                  <button class="action-btn" title="Ver detalle"><span class="material-symbols-outlined">visibility</span></button>
                  <button class="action-btn" title="Editar"><span class="material-symbols-outlined">edit</span></button>
                </td>
              </tr>
              <!-- Fila 3 -->
              <tr>
                <td><span class="doc-badge">40.123.456</span></td>
                <td><strong>Juan Pablo</strong></td>
                <td>Rodríguez</td>
                <td class="td-muted">+54 261 987-6543</td>
                <td class="td-muted">jprodriguez@email.com</td>
                <td>23/08/1997</td>
                <td class="actions-cell">
                  <button class="action-btn" title="Ver detalle"><span class="material-symbols-outlined">visibility</span></button>
                  <button class="action-btn" title="Editar"><span class="material-symbols-outlined">edit</span></button>
                </td>
              </tr>
              <!-- Fila 4 -->
              <tr>
                <td><span class="doc-badge">18.567.890</span></td>
                <td><strong>Elena Beatriz</strong></td>
                <td>Martínez</td>
                <td class="td-muted">+54 11 5678-1234</td>
                <td class="td-muted">elena.mtz@email.com</td>
                <td>10/01/1968</td>
                <td class="actions-cell">
                  <button class="action-btn" title="Ver detalle"><span class="material-symbols-outlined">visibility</span></button>
                  <button class="action-btn" title="Editar"><span class="material-symbols-outlined">edit</span></button>
                </td>
              </tr>
              <!-- Fila 5 -->
              <tr>
                <td><span class="doc-badge">35.678.901</span></td>
                <td><strong>Diego Alejandro</strong></td>
                <td>Fernández</td>
                <td class="td-muted">+54 341 890-1234</td>
                <td class="td-muted">da.fernandez@email.com</td>
                <td>05/09/1990</td>
                <td class="actions-cell">
                  <button class="action-btn" title="Ver detalle"><span class="material-symbols-outlined">visibility</span></button>
                  <button class="action-btn" title="Editar"><span class="material-symbols-outlined">edit</span></button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

    </main>
  </div>

</body>
</html>



