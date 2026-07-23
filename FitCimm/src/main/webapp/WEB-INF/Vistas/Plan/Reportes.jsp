<%-- 
    Document   : Reportes
    Created on : 23/07/2026, 3:27:54 p. m.
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="es">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Reportes y Analítica - PartnerPro</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect" />
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
    <link
        href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:ital,wght@0,100..900;1,100..900&family=JetBrains+Mono:ital,wght@0,100..800;1,100..800&display=swap"
        rel="stylesheet" />
    <!-- Material Symbols -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
        rel="stylesheet" />
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        navy: {
                            800: '#1e293b',
                            900: '#0f172a',
                            950: '#0b0f19',
                        }
                    },
                    fontFamily: {
                        sans: ['Hanken Grotesk', 'sans-serif'],
                        mono: ['JetBrains Mono', 'monospace'],
                    }
                }
            }
        }
    </script>
    <style>
        body {
            font-family: 'Hanken Grotesk', sans-serif;
        }

        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        .custom-scrollbar::-webkit-scrollbar {
            width: 6px;
        }

        .custom-scrollbar::-webkit-scrollbar-track {
            background: transparent;
        }

        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: #cbd5e1;
            border-radius: 10px;
        }

        .dark .custom-scrollbar::-webkit-scrollbar-thumb {
            background: #334155;
        }
    </style>
</head>

<body class="bg-slate-50 dark:bg-navy-950 text-slate-800 dark:text-slate-100 min-h-screen transition-colors duration-200">

    <!-- SIDEBAR UNIFICADA (NAVBAR + SIDEBAR) -->
    <aside class="fixed left-0 top-0 h-screen flex flex-col p-4 z-50 bg-slate-900 border-r border-slate-800 w-64 hidden md:flex text-slate-300 justify-between">
        <div class="space-y-6">
            <!-- Brand Logo Header -->
            <div class="flex items-center justify-between px-2 pt-2">
                <div class="flex items-center gap-2.5">
                    <div class="w-9 h-9 rounded-xl bg-gradient-to-tr from-sky-600 to-blue-600 flex items-center justify-center text-white font-bold shadow-md shadow-sky-500/20">
                        <span class="material-symbols-outlined text-[22px]">view_quilt</span>
                    </div>
                    <span class="text-xl font-bold tracking-tight text-white">Partner<span class="text-sky-400">Pro</span></span>
                </div>
                <!-- Modos Claro / Oscuro -->
                <button id="themeToggle" class="p-1.5 text-slate-400 hover:text-white rounded-lg hover:bg-slate-800 transition-all">
                    <span class="material-symbols-outlined text-[20px] dark:hidden">dark_mode</span>
                    <span class="material-symbols-outlined text-[20px] hidden dark:block">light_mode</span>
                </button>
            </div>

            <!-- Admin Console / Status Badge -->
            <div class="flex items-center gap-3 px-3 py-2.5 rounded-xl bg-slate-800/60 border border-slate-700/50">
                <div class="w-8 h-8 bg-sky-500/20 text-sky-400 rounded-lg flex items-center justify-center border border-sky-500/30 shrink-0">
                    <span class="material-symbols-outlined text-[20px]">admin_panel_settings</span>
                </div>
                <div class="overflow-hidden">
                    <p class="text-xs font-bold text-white tracking-tight truncate">Admin Console</p>
                    <p class="text-[11px] text-sky-400/80 font-medium truncate">Reports & Analytics</p>
                </div>
            </div>

            <!-- Menú de Navegación Unificado -->
            <nav class="space-y-1.5">
                <a href="#" class="flex items-center gap-3 px-3 py-2.5 text-slate-300 hover:bg-slate-800 hover:text-white rounded-lg transition-all font-medium text-sm">
                    <span class="material-symbols-outlined text-[20px]">dashboard</span>
                    <span>Overview</span>
                </a>
                <a href="#" class="flex items-center gap-3 px-3 py-2.5 text-slate-300 hover:bg-slate-800 hover:text-white rounded-lg transition-all font-medium text-sm">
                    <span class="material-symbols-outlined text-[20px]">group</span>
                    <span>Partner Directory</span>
                </a>
                <!-- Elemento Activo -->
                <a href="#" class="flex items-center gap-3 px-3 py-2.5 bg-sky-600 text-white font-semibold rounded-lg shadow-lg shadow-sky-600/20 transition-all text-sm">
                    <span class="material-symbols-outlined text-[20px]">description</span>
                    <span>Income Reports</span>
                </a>
                <a href="#" class="flex items-center gap-3 px-3 py-2.5 text-slate-300 hover:bg-slate-800 hover:text-white rounded-lg transition-all font-medium text-sm">
                    <span class="material-symbols-outlined text-[20px]">history</span>
                    <span>Audit Logs</span>
                </a>
                <a href="#" class="flex items-center gap-3 px-3 py-2.5 text-slate-300 hover:bg-slate-800 hover:text-white rounded-lg transition-all font-medium text-sm">
                    <span class="material-symbols-outlined text-[20px]">analytics</span>
                    <span>System Health</span>
                </a>
                <a href="#" class="flex items-center justify-between px-3 py-2.5 text-slate-300 hover:bg-slate-800 hover:text-white rounded-lg transition-all font-medium text-sm">
                    <div class="flex items-center gap-3">
                        <span class="material-symbols-outlined text-[20px]">notifications</span>
                        <span>Notificaciones</span>
                    </div>
                    <span class="w-2 h-2 bg-sky-400 rounded-full"></span>
                </a>
            </nav>
        </div>

        <!-- User Profile & Footer Controls -->
        <div class="pt-4 border-t border-slate-800 space-y-3">
            <div class="flex items-center gap-3 px-2 py-1">
                <div class="w-9 h-9 rounded-full overflow-hidden ring-2 ring-sky-500/30 shrink-0">
                    <img class="w-full h-full object-cover" alt="Perfil del Usuario"
                        src="https://lh3.googleusercontent.com/aida-public/AB6AXuA9qGXcM9nEgr6ZXZEfBZ572aBr7tIUSIg_-QG0_JJk_WXp3JoN6dhebbpRgAiwnDJLlqyEK2OyDdZZN5KiJ2eXuo8WEga9H9BiVmOtSrYZQSgW-hOcx7BIqh_gRY_aO1S07tK09RfXopNGD_ZMb6lWeAUwiDQp9DiQLKHqZ43NMijQ0myJsO93GwEnR2uKDtHzINLQPpsxLR4ipIx4xclsz4LQmCEdBR2ZaaGap9igTXa5HcpLxzzxxmhTXdIJocRjtrh-jGqeljse" />
                </div>
                <div class="overflow-hidden">
                    <p class="text-xs font-semibold text-white truncate">Alex Morgan</p>
                    <p class="text-[11px] text-slate-400 truncate">Super Admin</p>
                </div>
            </div>

            <div class="space-y-1">
                <button class="w-full flex items-center gap-3 px-3 py-2 text-slate-400 hover:text-white hover:bg-slate-800/60 rounded-lg transition-colors text-sm font-medium">
                    <span class="material-symbols-outlined text-[20px]">settings</span>
                    <span>Ajustes</span>
                </button>
                <button class="w-full flex items-center gap-3 px-3 py-2 text-rose-400 hover:bg-rose-500/10 rounded-lg transition-colors text-sm font-medium">
                    <span class="material-symbols-outlined text-[20px]">logout</span>
                    <span>Cerrar Sesión</span>
                </button>
            </div>
        </div>
    </aside>

    <!-- MAIN DASHBOARD CONTENT -->
    <main class="md:ml-64 p-6 md:p-10 min-h-screen max-w-[1600px] mx-auto">
        <!-- Page Header -->
        <header class="mb-6 flex flex-col sm:flex-row justify-between items-start sm:items-end gap-4">
            <div>
                <h1 class="text-2xl md:text-3xl font-bold text-slate-900 dark:text-white tracking-tight">Panel de Reportes del Sistema</h1>
                <p class="text-sm md:text-base text-slate-500 dark:text-slate-400 mt-1">Visualización de datos consolidados para socios, recaudación y analítica de planes.</p>
            </div>
            <button class="px-4 py-2.5 bg-sky-600 hover:bg-sky-500 text-white font-semibold rounded-lg shadow-sm transition-all flex items-center gap-2 text-sm">
                <span class="material-symbols-outlined text-[20px]">download</span>
                Exportar Vista Actual
            </button>
        </header>

        <!-- Report Tabs Selector -->
        <div class="flex flex-wrap gap-2 mb-6 border-b border-slate-200 dark:border-slate-800 pb-4">
            <button onclick="switchReport('report1', this)" class="report-tab px-4 py-2.5 rounded-lg text-sm font-semibold transition-all bg-sky-600 text-white shadow-md shadow-sky-600/20 flex items-center gap-2">
                <span class="material-symbols-outlined text-[18px]">badge</span>
                Socios Activos (Vigentes)
            </button>
            <button onclick="switchReport('report2', this)" class="report-tab px-4 py-2.5 rounded-lg text-sm font-semibold transition-all bg-white dark:bg-navy-900 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-800 hover:bg-slate-100 dark:hover:bg-slate-800 flex items-center gap-2">
                <span class="material-symbols-outlined text-[18px]">payments</span>
                Recaudación por Rango y Plan
            </button>
            <button onclick="switchReport('report3', this)" class="report-tab px-4 py-2.5 rounded-lg text-sm font-semibold transition-all bg-white dark:bg-navy-900 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-800 hover:bg-slate-100 dark:hover:bg-slate-800 flex items-center gap-2">
                <span class="material-symbols-outlined text-[18px]">trending_up</span>
                Plan Más Vendido del Mes
            </button>
        </div>

        <!-- REPORT 1: Socios Activos con Membresía Vigente -->
        <div id="report1" class="report-content space-y-6">
            <div class="bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 rounded-2xl shadow-sm overflow-hidden">
                <div class="p-5 border-b border-slate-200 dark:border-slate-800 flex justify-between items-center">
                    <div>
                        <h2 class="text-lg font-bold text-slate-900 dark:text-white">Reporte de socios activos con membresía vigente</h2>
                        <p class="text-xs text-slate-500 dark:text-slate-400 mt-0.5">RF-15 • Socios que cuentan con estado de membresía activo a la fecha actual.</p>
                    </div>
                    <span class="px-3 py-1 rounded-full text-xs font-semibold bg-emerald-50 text-emerald-700 dark:bg-emerald-500/10 dark:text-emerald-400 border border-emerald-200 dark:border-emerald-500/20">1,240 Vigentes</span>
                </div>
                <div class="overflow-x-auto custom-scrollbar">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="bg-navy-900 dark:bg-navy-950 text-slate-200 border-b border-slate-800">
                                <th class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase border-r border-slate-800">CÓDIGO SOCIO</th>
                                <th class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase border-r border-slate-800">NOMBRE COMPLETO</th>
                                <th class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase border-r border-slate-800">PLAN ASIGNADO</th>
                                <th class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase border-r border-slate-800">VÁLIDO HASTA</th>
                                <th class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase">ESTADO</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100 dark:divide-slate-800 text-sm">
                            <tr class="hover:bg-slate-50 dark:hover:bg-slate-800/50 transition-colors">
                                <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">SOC-8921</td>
                                <td class="px-6 py-4 font-semibold text-slate-900 dark:text-white">Valeria Albornoz</td>
                                <td class="px-6 py-4 text-slate-600 dark:text-slate-300">Plan Premium Anual</td>
                                <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">15/12/2026</td>
                                <td class="px-6 py-4">
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-emerald-50 text-emerald-700 dark:bg-emerald-500/10 dark:text-emerald-400 border border-emerald-200 dark:border-emerald-500/20 uppercase tracking-wider">Vigente</span>
                                </td>
                            </tr>
                            <tr class="hover:bg-slate-50 dark:hover:bg-slate-800/50 transition-colors">
                                <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">SOC-8922</td>
                                <td class="px-6 py-4 font-semibold text-slate-900 dark:text-white">Matías Benítez</td>
                                <td class="px-6 py-4 text-slate-600 dark:text-slate-300">Plan Exec Trimestral</td>
                                <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">30/09/2026</td>
                                <td class="px-6 py-4">
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-emerald-50 text-emerald-700 dark:bg-emerald-500/10 dark:text-emerald-400 border border-emerald-200 dark:border-emerald-500/20 uppercase tracking-wider">Vigente</span>
                                </td>
                            </tr>
                            <tr class="hover:bg-slate-50 dark:hover:bg-slate-800/50 transition-colors">
                                <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">SOC-8925</td>
                                <td class="px-6 py-4 font-semibold text-slate-900 dark:text-white">Camila Fuentes</td>
                                <td class="px-6 py-4 text-slate-600 dark:text-slate-300">Plan Base Mensual</td>
                                <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">10/08/2026</td>
                                <td class="px-6 py-4">
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-emerald-50 text-emerald-700 dark:bg-emerald-500/10 dark:text-emerald-400 border border-emerald-200 dark:border-emerald-500/20 uppercase tracking-wider">Vigente</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- REPORT 2: Total Recaudado en Rango de Fechas Agrupado por Plan (Con selector de fecha interactivo) -->
        <div id="report2" class="report-content space-y-6 hidden">
            <div class="bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 rounded-2xl shadow-sm overflow-hidden">
                <div class="p-5 border-b border-slate-200 dark:border-slate-800 flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                    <div>
                        <h2 class="text-lg font-bold text-slate-900 dark:text-white">Reporte del total recaudado en un rango de fechas, agrupado por plan</h2>
                        <p class="text-xs text-slate-500 dark:text-slate-400 mt-0.5">RF-16 • Seleccione el rango de fechas deseado para filtrar las transacciones.</p>
                    </div>
                    <!-- Inputs de Fecha Interactivos -->
                    <div class="flex items-center gap-2 bg-slate-50 dark:bg-navy-950 p-2 rounded-xl border border-slate-200 dark:border-slate-800 text-xs">
                        <div class="flex items-center gap-1.5">
                            <span class="text-slate-400 font-medium">Desde:</span>
                            <input type="date" value="2026-07-01" class="bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-700 rounded-lg px-2 py-1 text-slate-700 dark:text-slate-200 font-mono focus:outline-none focus:ring-1 focus:ring-sky-500">
                        </div>
                        <div class="flex items-center gap-1.5">
                            <span class="text-slate-400 font-medium">Hasta:</span>
                            <input type="date" value="2026-07-23" class="bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-700 rounded-lg px-2 py-1 text-slate-700 dark:text-slate-200 font-mono focus:outline-none focus:ring-1 focus:ring-sky-500">
                        </div>
                        <button class="bg-sky-600 hover:bg-sky-500 text-white font-semibold px-3 py-1.5 rounded-lg transition-all shadow-sm">
                            Filtrar
                        </button>
                    </div>
                </div>
                <div class="overflow-x-auto custom-scrollbar">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="bg-navy-900 dark:bg-navy-950 text-slate-200 border-b border-slate-800">
                                <th class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase border-r border-slate-800">PLAN COMERCIAL</th>
                                <th class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase border-r border-slate-800">TRANSACCIONES</th>
                                <th class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase border-r border-slate-800">VALOR UNITARIO</th>
                                <th class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase">RECAUDACIÓN TOTAL</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100 dark:divide-slate-800 text-sm">
                            <tr class="hover:bg-slate-50 dark:hover:bg-slate-800/50 transition-colors">
                                <td class="px-6 py-4 font-semibold text-slate-900 dark:text-white">Plan Premium Anual</td>
                                <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">142</td>
                                <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">$180.000</td>
                                <td class="px-6 py-4 font-mono font-bold text-emerald-600 dark:text-emerald-400">$25.560.000</td>
                            </tr>
                            <tr class="hover:bg-slate-50 dark:hover:bg-slate-800/50 transition-colors">
                                <td class="px-6 py-4 font-semibold text-slate-900 dark:text-white">Plan Exec Trimestral</td>
                                <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">210</td>
                                <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">$60.000</td>
                                <td class="px-6 py-4 font-mono font-bold text-emerald-600 dark:text-emerald-400">$12.600.000</td>
                            </tr>
                            <tr class="hover:bg-slate-50 dark:hover:bg-slate-800/50 transition-colors">
                                <td class="px-6 py-4 font-semibold text-slate-900 dark:text-white">Plan Base Mensual</td>
                                <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">352</td>
                                <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">$20.000</td>
                                <td class="px-6 py-4 font-mono font-bold text-emerald-600 dark:text-emerald-400">$7.040.000</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="px-6 py-3.5 bg-slate-50/50 dark:bg-navy-950/50 border-t border-slate-200 dark:border-slate-800 flex justify-between items-center text-xs font-semibold">
                    <span class="text-slate-500">Total general recaudado:</span>
                    <span class="font-mono text-emerald-600 dark:text-emerald-400 text-sm">$45.280.000</span>
                </div>
            </div>
        </div>

        <!-- REPORT 3: Plan Más Vendido del Mes -->
        <div id="report3" class="report-content space-y-6 hidden">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
                <div class="p-6 bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 rounded-2xl shadow-sm flex flex-col justify-between">
                    <div>
                        <span class="text-xs font-bold text-amber-600 dark:text-amber-400 uppercase tracking-wider">¡Destacado del Mes!</span>
                        <h3 class="text-xl font-bold text-slate-900 dark:text-white mt-2">Reporte del plan más vendido del mes</h3>
                        <p class="text-sm text-slate-500 dark:text-slate-400 mt-1">El plan con mayor volumen de suscripciones nuevas registradas durante el mes en curso.</p>
                    </div>
                    <div class="mt-6 pt-4 border-t border-slate-100 dark:border-slate-800 flex items-center justify-between">
                        <span class="text-xs text-slate-400 font-mono">RF-17 (Deseable)</span>
                        <span class="text-2xl font-bold text-sky-600 dark:text-sky-400 font-mono">352 Adquisiciones</span>
                    </div>
                </div>

                <div class="md:col-span-2 bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 rounded-2xl shadow-sm p-6">
                    <h3 class="text-sm font-bold text-slate-900 dark:text-white uppercase tracking-wider mb-4">Participación porcentual de ventas por plan</h3>
                    <div class="space-y-4">
                        <div>
                            <div class="flex justify-between text-xs font-semibold mb-1">
                                <span class="text-slate-700 dark:text-slate-300">Plan Base Mensual (Líder)</span>
                                <span class="text-sky-600 dark:text-sky-400 font-mono">50.2%</span>
                            </div>
                            <div class="w-full bg-slate-100 dark:bg-slate-800 h-2.5 rounded-full overflow-hidden">
                                <div class="bg-sky-500 h-full rounded-full" style="width: 50.2%"></div>
                            </div>
                        </div>
                        <div>
                            <div class="flex justify-between text-xs font-semibold mb-1">
                                <span class="text-slate-700 dark:text-slate-300">Plan Exec Trimestral</span>
                                <span class="text-sky-600 dark:text-sky-400 font-mono">30.0%</span>
                            </div>
                            <div class="w-full bg-slate-100 dark:bg-slate-800 h-2.5 rounded-full overflow-hidden">
                                <div class="bg-sky-600 h-full rounded-full" style="width: 30%"></div>
                            </div>
                        </div>
                        <div>
                            <div class="flex justify-between text-xs font-semibold mb-1">
                                <span class="text-slate-700 dark:text-slate-300">Plan Premium Anual</span>
                                <span class="text-sky-600 dark:text-sky-400 font-mono">19.8%</span>
                            </div>
                            <div class="w-full bg-slate-100 dark:bg-slate-800 h-2.5 rounded-full overflow-hidden">
                                <div class="bg-blue-600 h-full rounded-full" style="width: 19.8%"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script>
        // Funcionalidad de modo claro/oscuro
        document.getElementById('themeToggle').addEventListener('click', () => {
            document.documentElement.classList.toggle('dark');
        });

        // Funcionalidad para alternar entre las pestañas de reportes
        function switchReport(reportId, buttonElement) {
            // Ocultar todos los reportes
            document.querySelectorAll('.report-content').forEach(el => {
                el.classList.add('hidden');
            });
            // Mostrar el seleccionado
            document.getElementById(reportId).classList.remove('hidden');

            // Resetear estilos de las pestañas
            document.querySelectorAll('.report-tab').forEach(btn => {
                btn.className = "report-tab px-4 py-2.5 rounded-lg text-sm font-semibold transition-all bg-white dark:bg-navy-900 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-800 hover:bg-slate-100 dark:hover:bg-slate-800 flex items-center gap-2";
            });

            // Activar pestaña actual
            buttonElement.className = "report-tab px-4 py-2.5 rounded-lg text-sm font-semibold transition-all bg-sky-600 text-white shadow-md shadow-sky-600/20 flex items-center gap-2";
        }
    </script>
</body>

</html>
