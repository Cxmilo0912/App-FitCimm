<%-- 
    Document   : ReporteIngreso
    Created on : 23/07/2026, 2:02:02 p. m.
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


Ingresos por fecha
<!DOCTYPE html>
<html class="light" lang="es">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Reporte de Ingresos por Fecha - PartnerPro</title>
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

<body
    class="bg-slate-50 dark:bg-navy-950 text-slate-800 dark:text-slate-100 min-h-screen transition-colors duration-200">

    <!-- SIDEBAR UNIFICADA (NAVBAR + SIDEBAR) -->
    <aside
        class="fixed left-0 top-0 h-screen flex flex-col p-4 z-50 bg-slate-900 border-r border-slate-800 w-64 hidden md:flex text-slate-300 justify-between">
        <div class="space-y-6">
            <!-- Brand Logo Header -->
            <div class="flex items-center justify-between px-2 pt-2">
                <div class="flex items-center gap-2.5">
                    <div
                        class="w-9 h-9 rounded-xl bg-gradient-to-tr from-sky-600 to-blue-600 flex items-center justify-center text-white font-bold shadow-md shadow-sky-500/20">
                        <span class="material-symbols-outlined text-[22px]">view_quilt</span>
                    </div>
                    <span class="text-xl font-bold tracking-tight text-white">Partner<span
                            class="text-sky-400">Pro</span></span>
                </div>
                <!-- Modos Claro / Oscuro -->
                <button id="themeToggle"
                    class="p-1.5 text-slate-400 hover:text-white rounded-lg hover:bg-slate-800 transition-all">
                    <span class="material-symbols-outlined text-[20px] dark:hidden">dark_mode</span>
                    <span class="material-symbols-outlined text-[20px] hidden dark:block">light_mode</span>
                </button>
            </div>

            <!-- Admin Console / Status Badge -->
            <div class="flex items-center gap-3 px-3 py-2.5 rounded-xl bg-slate-800/60 border border-slate-700/50">
                <div
                    class="w-8 h-8 bg-sky-500/20 text-sky-400 rounded-lg flex items-center justify-center border border-sky-500/30 shrink-0">
                    <span class="material-symbols-outlined text-[20px]">admin_panel_settings</span>
                </div>
                <div class="overflow-hidden">
                    <p class="text-xs font-bold text-white tracking-tight truncate">Admin Console</p>
                    <p class="text-[11px] text-sky-400/80 font-medium truncate">Reports & Analytics</p>
                </div>
            </div>

            <!-- Menú de Navegación Unificado -->
            <nav class="space-y-1.5">
                <a href="#"
                    class="flex items-center gap-3 px-3 py-2.5 text-slate-300 hover:bg-slate-800 hover:text-white rounded-lg transition-all font-medium text-sm">
                    <span class="material-symbols-outlined text-[20px]">dashboard</span>
                    <span>Overview</span>
                </a>
                <a href="#"
                    class="flex items-center gap-3 px-3 py-2.5 text-slate-300 hover:bg-slate-800 hover:text-white rounded-lg transition-all font-medium text-sm">
                    <span class="material-symbols-outlined text-[20px]">group</span>
                    <span>Partner Directory</span>
                </a>
                <!-- Elemento Activo -->
                <a href="#"
                    class="flex items-center gap-3 px-3 py-2.5 bg-sky-600 text-white font-semibold rounded-lg shadow-lg shadow-sky-600/20 transition-all text-sm">
                    <span class="material-symbols-outlined text-[20px]">description</span>
                    <span>Income Reports</span>
                </a>
                <a href="#"
                    class="flex items-center gap-3 px-3 py-2.5 text-slate-300 hover:bg-slate-800 hover:text-white rounded-lg transition-all font-medium text-sm">
                    <span class="material-symbols-outlined text-[20px]">history</span>
                    <span>Audit Logs</span>
                </a>
                <a href="#"
                    class="flex items-center gap-3 px-3 py-2.5 text-slate-300 hover:bg-slate-800 hover:text-white rounded-lg transition-all font-medium text-sm">
                    <span class="material-symbols-outlined text-[20px]">analytics</span>
                    <span>System Health</span>
                </a>
                <a href="#"
                    class="flex items-center justify-between px-3 py-2.5 text-slate-300 hover:bg-slate-800 hover:text-white rounded-lg transition-all font-medium text-sm">
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
            <!-- Profile info -->
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
                <button
                    class="w-full flex items-center gap-3 px-3 py-2 text-slate-400 hover:text-white hover:bg-slate-800/60 rounded-lg transition-colors text-sm font-medium">
                    <span class="material-symbols-outlined text-[20px]">settings</span>
                    <span>Ajustes</span>
                </button>
                <button
                    class="w-full flex items-center gap-3 px-3 py-2 text-rose-400 hover:bg-rose-500/10 rounded-lg transition-colors text-sm font-medium">
                    <span class="material-symbols-outlined text-[20px]">logout</span>
                    <span>Cerrar Sesión</span>
                </button>
            </div>
        </div>
    </aside>

    <!-- MAIN DASHBOARD CONTENT -->
    <main class="md:ml-64 p-6 md:p-10 min-h-screen max-w-[1600px] mx-auto">
        <!-- Page Header -->
        <header class="mb-8 flex flex-col sm:flex-row justify-between items-start sm:items-end gap-4">
            <div>
                <h1 class="text-2xl md:text-3xl font-bold text-slate-900 dark:text-white tracking-tight">Reporte de
                    Ingresos por Fecha</h1>
                <p class="text-sm md:text-base text-slate-500 dark:text-slate-400 mt-1">Consulta y exportación detallada
                    de accesos de socios.</p>
            </div>
            <button
                class="px-4 py-2.5 bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-700 hover:border-slate-300 dark:hover:border-slate-600 text-slate-700 dark:text-slate-200 font-semibold rounded-lg shadow-sm hover:bg-slate-50 dark:hover:bg-slate-800 transition-all flex items-center gap-2 text-sm">
                <span class="material-symbols-outlined text-[20px]">download</span>
                Descargar Reporte
            </button>
        </header>

        <!-- Filter Section -->
        <section class="mb-8">
            <div
                class="bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 p-5 rounded-2xl shadow-sm">
                <div class="flex flex-col md:flex-row gap-4 items-end">
                    <div class="flex-1 space-y-2 w-full">
                        <label
                            class="text-xs font-semibold text-slate-500 dark:text-slate-400 uppercase tracking-wider">Rango
                            de Fecha</label>
                        <div class="relative flex items-center">
                            <span
                                class="material-symbols-outlined absolute left-3.5 text-slate-400">calendar_month</span>
                            <input
                                class="w-full pl-11 pr-4 py-2.5 bg-slate-50 dark:bg-navy-950 border border-slate-200 dark:border-slate-700 rounded-lg focus:ring-2 focus:ring-sky-500 focus:border-sky-500 text-slate-800 dark:text-slate-100 font-medium text-sm transition-all"
                                type="text" value="Oct 24, 2023 - Oct 25, 2023" />
                        </div>
                    </div>
                    <div class="w-full md:w-auto">
                        <button
                            class="w-full md:w-48 bg-sky-600 hover:bg-sky-500 text-white font-semibold h-[42px] rounded-lg shadow-lg shadow-sky-600/20 active:scale-[0.98] transition-all flex items-center justify-center gap-2 text-sm tracking-wide uppercase">
                            <span class="material-symbols-outlined text-[20px]">search</span>
                            Consultar
                        </button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Stats Cards Area -->
        <section class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5 mb-8">
            <div
                class="p-5 bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 rounded-2xl flex items-center gap-4 shadow-sm">
                <div
                    class="w-12 h-12 rounded-xl bg-sky-500/10 text-sky-600 dark:text-sky-400 flex items-center justify-center border border-sky-500/20">
                    <span class="material-symbols-outlined">groups</span>
                </div>
                <div>
                    <p class="text-xs font-semibold text-slate-500 dark:text-slate-400 uppercase tracking-wider">Total
                        Ingresos</p>
                    <p class="text-2xl font-bold text-slate-900 dark:text-white mt-0.5">128</p>
                </div>
            </div>

            <div
                class="p-5 bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 rounded-2xl flex items-center gap-4 shadow-sm">
                <div
                    class="w-12 h-12 rounded-xl bg-rose-500/10 text-rose-600 dark:text-rose-400 flex items-center justify-center border border-rose-500/20">
                    <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">warning</span>
                </div>
                <div>
                    <p class="text-xs font-semibold text-slate-500 dark:text-slate-400 uppercase tracking-wider">Alertas
                        de Acceso</p>
                    <p class="text-2xl font-bold text-rose-600 dark:text-rose-400 mt-0.5">3</p>
                </div>
            </div>

            <div
                class="p-5 bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 rounded-2xl flex items-center gap-4 shadow-sm">
                <div
                    class="w-12 h-12 rounded-xl bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-300 flex items-center justify-center border border-slate-200 dark:border-slate-700">
                    <span class="material-symbols-outlined">schedule</span>
                </div>
                <div>
                    <p class="text-xs font-semibold text-slate-500 dark:text-slate-400 uppercase tracking-wider">Hora
                        Pico</p>
                    <p class="text-2xl font-bold text-slate-900 dark:text-white mt-0.5">10:00 AM</p>
                </div>
            </div>

            <div
                class="p-5 bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 rounded-2xl flex items-center gap-4 shadow-sm">
                <div
                    class="w-12 h-12 rounded-xl bg-emerald-500/10 text-emerald-600 dark:text-emerald-400 flex items-center justify-center border border-emerald-500/20">
                    <span class="material-symbols-outlined">trending_up</span>
                </div>
                <div>
                    <p class="text-xs font-semibold text-slate-500 dark:text-slate-400 uppercase tracking-wider">
                        Crecimiento</p>
                    <p class="text-2xl font-bold text-emerald-600 dark:text-emerald-400 mt-0.5">+12%</p>
                </div>
            </div>
        </section>

        <!-- Results Table -->
        <section
            class="bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 rounded-2xl shadow-sm overflow-hidden">
            <div class="overflow-x-auto custom-scrollbar">
                <table class="w-full text-left border-collapse">
                    <thead>
                        <tr class="bg-navy-900 dark:bg-navy-950 text-slate-200 border-b border-slate-800">
                            <th
                                class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase border-r border-slate-800">
                                HORA</th>
                            <th
                                class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase border-r border-slate-800">
                                SOCIO</th>
                            <th
                                class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase border-r border-slate-800">
                                DOCUMENTO</th>
                            <th class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase">ESTADO</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100 dark:divide-slate-800 text-sm">
                        <tr class="hover:bg-slate-50 dark:hover:bg-slate-800/50 transition-colors">
                            <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">08:45 AM</td>
                            <td class="px-6 py-4 font-semibold text-slate-900 dark:text-white">Carlos Rodríguez</td>
                            <td class="px-6 py-4 text-slate-500 dark:text-slate-400 font-mono">20.455.932-K</td>
                            <td class="px-6 py-4">
                                <span
                                    class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-emerald-50 text-emerald-700 dark:bg-emerald-500/10 dark:text-emerald-400 border border-emerald-200 dark:border-emerald-500/20 uppercase tracking-wider">Autorizado</span>
                            </td>
                        </tr>
                        <tr class="hover:bg-slate-50 dark:hover:bg-slate-800/50 transition-colors">
                            <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">09:12 AM</td>
                            <td class="px-6 py-4 font-semibold text-slate-900 dark:text-white">María José Valdés</td>
                            <td class="px-6 py-4 text-slate-500 dark:text-slate-400 font-mono">18.223.109-2</td>
                            <td class="px-6 py-4">
                                <span
                                    class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-emerald-50 text-emerald-700 dark:bg-emerald-500/10 dark:text-emerald-400 border border-emerald-200 dark:border-emerald-500/20 uppercase tracking-wider">Autorizado</span>
                            </td>
                        </tr>
                        <tr class="hover:bg-slate-50 dark:hover:bg-slate-800/50 transition-colors">
                            <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">10:05 AM</td>
                            <td class="px-6 py-4 font-semibold text-slate-900 dark:text-white">Juan Pablo Soto</td>
                            <td class="px-6 py-4 text-slate-500 dark:text-slate-400 font-mono">15.882.341-0</td>
                            <td class="px-6 py-4">
                                <span
                                    class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-rose-50 text-rose-700 dark:bg-rose-500/10 dark:text-rose-400 border border-rose-200 dark:border-rose-500/20 uppercase tracking-wider">Denegado</span>
                            </td>
                        </tr>
                        <tr class="hover:bg-slate-50 dark:hover:bg-slate-800/50 transition-colors">
                            <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">10:45 AM</td>
                            <td class="px-6 py-4 font-semibold text-slate-900 dark:text-white">Roberto Méndez</td>
                            <td class="px-6 py-4 text-slate-500 dark:text-slate-400 font-mono">12.339.400-5</td>
                            <td class="px-6 py-4">
                                <span
                                    class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-emerald-50 text-emerald-700 dark:bg-emerald-500/10 dark:text-emerald-400 border border-emerald-200 dark:border-emerald-500/20 uppercase tracking-wider">Autorizado</span>
                            </td>
                        </tr>
                        <tr class="hover:bg-slate-50 dark:hover:bg-slate-800/50 transition-colors">
                            <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">11:20 AM</td>
                            <td class="px-6 py-4 font-semibold text-slate-900 dark:text-white">Ana Luisa Pérez</td>
                            <td class="px-6 py-4 text-slate-500 dark:text-slate-400 font-mono">21.009.223-1</td>
                            <td class="px-6 py-4">
                                <span
                                    class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-emerald-50 text-emerald-700 dark:bg-emerald-500/10 dark:text-emerald-400 border border-emerald-200 dark:border-emerald-500/20 uppercase tracking-wider">Autorizado</span>
                            </td>
                        </tr>
                        <tr class="hover:bg-slate-50 dark:hover:bg-slate-800/50 transition-colors">
                            <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">12:05 PM</td>
                            <td class="px-6 py-4 font-semibold text-slate-900 dark:text-white">Esteban Orellana</td>
                            <td class="px-6 py-4 text-slate-500 dark:text-slate-400 font-mono">19.344.201-9</td>
                            <td class="px-6 py-4">
                                <span
                                    class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-emerald-50 text-emerald-700 dark:bg-emerald-500/10 dark:text-emerald-400 border border-emerald-200 dark:border-emerald-500/20 uppercase tracking-wider">Autorizado</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Pagination Bar -->
            <div
                class="px-6 py-4 border-t border-slate-200 dark:border-slate-800 flex justify-between items-center bg-slate-50/50 dark:bg-navy-950/50">
                <p class="text-xs font-medium text-slate-500 dark:text-slate-400">Mostrando <span
                        class="font-bold text-slate-700 dark:text-slate-200">6</span> de <span
                        class="font-bold text-slate-700 dark:text-slate-200">128</span> ingresos</p>
                <div class="flex gap-2">
                    <button
                        class="p-2 rounded-lg border border-slate-200 dark:border-slate-800 text-slate-400 hover:text-slate-600 dark:hover:text-slate-200 disabled:opacity-40 transition-colors"
                        disabled>
                        <span class="material-symbols-outlined text-[18px]">chevron_left</span>
                    </button>
                    <button
                        class="p-2 rounded-lg border border-slate-200 dark:border-slate-800 text-slate-600 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-slate-800 transition-colors">
                        <span class="material-symbols-outlined text-[18px]">chevron_right</span>
                    </button>
                </div>
            </div>
        </section>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const themeToggle = document.getElementById('themeToggle');
            themeToggle.addEventListener('click', () => {
                document.documentElement.classList.toggle('dark');
            });
        });
    </script>
</body>

</html>