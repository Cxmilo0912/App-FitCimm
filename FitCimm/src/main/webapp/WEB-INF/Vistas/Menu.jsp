<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- 1. ESTILOS CSS INCRUSTADOS -->
<style>
    /* Variables para Modo Oscuro (Por defecto) */
    :root {
        --sidebar-width: 256px;
        --sidebar-bg: #0f172a;       /* Slate 900 */
        --sidebar-border: #1e293b;   /* Slate 800 */
        --sidebar-text: #cbd5e1;     /* Slate 300 */
        --sidebar-hover-bg: #1e293b;
        --sidebar-hover-text: #ffffff;
        --primary-color: #0284c7;    /* Sky 600 */

        /* Variables globales del body */
        --body-bg: #f8fafc;
        --body-text: #0f172a;
    }

    /* Override de variables para Modo Claro */
    body.light-mode {
        --sidebar-bg: #ffffff;
        --sidebar-border: #e2e8f0;
        --sidebar-text: #475569;
        --sidebar-hover-bg: #f1f5f9;
        --sidebar-hover-text: #0f172a;

        --body-bg: #f1f5f9;
        --body-text: #0f172a;
    }

    /* Ajuste general del Body según el tema */
    body {
        margin-left: var(--sidebar-width) !important;
        background-color: var(--body-bg) !important;
        color: var(--body-text);
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    /* Estructura Fija del Menú */
    .custom-sidebar {
        position: fixed;
        top: 0;
        left: 0;
        width: var(--sidebar-width);
        height: 100vh;
        background-color: var(--sidebar-bg);
        border-right: 1px solid var(--sidebar-border);
        padding: 16px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        box-sizing: border-box;
        z-index: 9999;
        font-family: 'Plus Jakarta Sans', system-ui, -apple-system, sans-serif;
        transition: background-color 0.3s ease, border-color 0.3s ease;
    }

    /* Header del Menú */
    .sidebar-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 8px 8px 24px 8px;
    }

    .brand-logo {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .brand-icon {
        width: 36px;
        height: 36px;
        border-radius: 10px;
        background: linear-gradient(135deg, #0284c7, #2563eb);
        display: flex;
        align-items: center;
        justify-content: center;
        color: #ffffff;
        box-shadow: 0 4px 10px rgba(2, 132, 199, 0.3);
    }

    .brand-title {
        font-size: 1.25rem;
        font-weight: 700;
        color: var(--sidebar-hover-text);
        letter-spacing: -0.025em;
    }

    .brand-title-accent {
        color: #38bdf8;
    }

    /* Botón de Cambio de Tema */
    .theme-btn {
        background: transparent;
        border: none;
        color: #94a3b8;
        padding: 6px;
        border-radius: 8px;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.2s ease;
    }

    .theme-btn:hover {
        color: var(--sidebar-hover-text);
        background-color: var(--sidebar-hover-bg);
    }

    /* Links de Navegación */
    .sidebar-nav {
        display: flex;
        flex-direction: column;
        gap: 6px;
    }

    .nav-item {
        display: flex;
        align-items: center;
        gap: 12px;
        padding: 10px 12px;
        color: var(--sidebar-text);
        text-decoration: none;
        font-size: 0.875rem;
        font-weight: 500;
        border-radius: 8px;
        transition: all 0.2s ease;
    }

    .nav-item:hover {
        background-color: var(--sidebar-hover-bg);
        color: var(--sidebar-hover-text);
    }

    .nav-item.active {
        background-color: var(--primary-color);
        color: #ffffff;
        font-weight: 600;
        box-shadow: 0 4px 12px rgba(2, 132, 199, 0.3);
    }

    .nav-item-back {
        margin-bottom: 16px;
        border: 1px solid var(--sidebar-border);
        color: #94a3b8;
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
</style>

<!-- 2. ESTRUCTURA HTML -->
<aside class="custom-sidebar">
    <div>
        <!-- Encabezado con Logo y Botón de Tema -->
        <div class="sidebar-header">
            <div class="brand-logo">
                <div class="brand-icon">
                    <span class="material-symbols-outlined">view_quilt</span>
                </div>
                <span class="brand-title">Gym<span class="brand-title-accent">Fat</span></span>
            </div>
            <button id="darkModeToggle" class="icon-btn" title="Cambiar modo oscuro">
                <span class="material-symbols-outlined" id="themeIcon">dark_mode</span>
            </button>
        </div>

        <!-- Enlaces de Navegación -->
        <nav class="sidebar-nav">
            <a href="${pageContext.request.contextPath}/index.jsp" class="nav-item nav-item-back">
                <span class="material-symbols-outlined">arrow_back</span>
                <span>Volver</span>
            </a>

            <a href="${pageContext.request.contextPath}/PlanController?accion=gestion" class="nav-item">
                <span class="material-symbols-outlined">sell</span>
                <span>Planes</span>
            </a>

            <a href="${pageContext.request.contextPath}/MembresiaController?accion=menu" class="nav-item">
                <span class="material-symbols-outlined">card_membership</span>
                <span>Membresías</span>
            </a>

            <a href="${pageContext.request.contextPath}/PlanController?accion=reporte" class="nav-item">
                <span class="material-symbols-outlined">bar_chart</span>
                <span>Reportes</span>
            </a>

            <a href="${pageContext.request.contextPath}/SocioController?action=listar" class="nav-item">
                <span class="material-symbols-outlined">group</span>
                <span>Socios</span>
            </a>

            <a href="${pageContext.request.contextPath}/IngresoController" class="nav-item">
                <span class="material-symbols-outlined">login</span>
                <span>Ingreso de Socios</span>
            </a>
        </nav>  
    </div>
</aside>

<script>
    (function () {
        const body = document.body;
        const themeIcon = document.getElementById('themeIcon');

        // Aplicar de forma inmediata el tema guardado al cargar
        const savedTheme = localStorage.getItem('theme');
        if (savedTheme === 'light') {
            body.classList.add('light-mode');
            if (themeIcon)
                themeIcon.textContent = 'light_mode';
        } else {
            if (themeIcon)
                themeIcon.textContent = 'dark_mode';
        }

        // Escuchar clics en el botón de cambio
        document.addEventListener('DOMContentLoaded', () => {
            const toggleBtn = document.getElementById('darkModeToggle');
            const icon = document.getElementById('themeIcon');

            if (toggleBtn) {
                toggleBtn.addEventListener('click', () => {
                    body.classList.toggle('light-mode');

                    if (body.classList.contains('light-mode')) {
                        localStorage.setItem('theme', 'light');
                        if (icon)
                            icon.textContent = 'light_mode';
                    } else {
                        localStorage.setItem('theme', 'dark');
                        if (icon)
                            icon.textContent = 'dark_mode';
                    }
                });
            }
            
            const currentPath = window.location.pathname;
            const currentSearch =  window.location.search;
            const navItems = document.querySelectorAll('.sidebar-nav .nav-item');
            
            navItems.forEach(item => {
                const itemHref = item.getAttribute('href');
                
                if (item.classList.contains('nav-item-back')) return;
                
                if (itemHref && (currentPath.includes(itemHref) || (currentSearch && itemHref.includes(currentSearch)))) {
                    
                    navItems.forEach(nav => nav.classList.remove('active'));
                    item.classList.add('active');
                }
                
                
            });
        });
    })();
</script>
