<%-- 
    Document   : ModuloIngreso
    Created on : 23/07/2026, 12:38:56 p. m.
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="es">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>PartnerPro - Panel de Gestión</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link
        href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@400;500;600;700;800;900&amp;family=JetBrains+Mono:wght@400;500;600;700&amp;display=swap"
        rel="stylesheet" />
    <link
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
        rel="stylesheet" />

    <style>
        /* ========================================================
           PALETA AZULADA Y VARIABLES DE TEMA EN CSS PURO
           ======================================================== */
        :root {
            /* Azules Principales y Acentos */
            --color-primary: #0284c7;
            /* Azul Océano / Cian Acento */
            --color-primary-hover: #0369a1;
            /* Azul primario hover */
            --color-primary-container: #2563eb;
            /* Azul Real vibrante */
            --color-on-primary-fixed: #ffffff;
            /* Texto blanco en botones */
            --color-inverse-primary: #38bdf8;
            /* Azul Cian brillante */

            /* Superficies y Navegación (Dark Slate/Navy) */
            --color-surface: #f8fafc;
            /* Gris/Azulado muy claro */
            --color-surface-container-low: #f1f5f9;
            --color-surface-container-high: #e2e8f0;
            --color-inverse-surface: #0f172a;
            /* Azul Noche Oscuro (Navy/Slate) */
            --color-inverse-surface-hover: #1e293b;

            /* Textos y Contrastes */
            --color-on-surface: #0f172a;
            --color-on-surface-variant: #475569;
            --color-inverse-on-surface: #f8fafc;

            /* Bordes y Líneas */
            --color-outline-variant: #cbd5e1;

            /* Fuentes */
            --font-main: 'Hanken Grotesk', sans-serif;
            --font-mono: 'JetBrains Mono', monospace;
        }

        body {
            font-family: var(--font-main);
            background-color: var(--color-surface);
            color: var(--color-on-surface);
        }

        .font-mono-custom {
            font-family: var(--font-mono);
        }

        /* Clases CSS personalizadas para los colores */
        .bg-custom-surface {
            background-color: var(--color-surface);
        }

        .bg-custom-surface-low {
            background-color: var(--color-surface-container-low);
        }

        .bg-custom-surface-high {
            background-color: var(--color-surface-container-high);
        }

        .bg-custom-inverse-surface {
            background-color: var(--color-inverse-surface);
        }

        .bg-custom-primary-container {
            background-color: var(--color-primary-container);
        }

        .text-custom-primary {
            color: var(--color-primary);
        }

        .text-custom-inverse-primary {
            color: var(--color-inverse-primary);
        }

        .text-custom-on-primary-fixed {
            color: var(--color-on-primary-fixed);
        }

        .text-custom-on-surface {
            color: var(--color-on-surface);
        }

        .border-custom-outline {
            border-color: var(--color-outline-variant);
        }

        /* Efectos Visuales */
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        .blur-backdrop {
            backdrop-filter: blur(8px);
            background-color: rgba(15, 23, 42, 0.5);
        }

        .premium-shadow {
            box-shadow: 0px 12px 48px -12px rgba(15, 23, 42, 0.25);
        }

        @keyframes shrink {
            from {
                width: 100%;
            }

            to {
                width: 0%;
            }
        }

        .animate-autoclose {
            animation: shrink 10000ms linear forwards;
        }
    </style>
</head>

<body class="overflow-hidden">

    <!-- Main Navigation Shell -->
    <aside
        class="bg-custom-inverse-surface h-full w-64 fixed left-0 top-0 flex flex-col h-screen py-6 px-3 border-r border-slate-800 z-10">
        <div class="px-3 mb-16">
            <h1 class="text-2xl font-bold text-custom-inverse-primary">PartnerPro</h1>
            <p class="font-mono-custom text-xs text-slate-400 uppercase tracking-widest mt-1">Gestión Corporativa</p>
        </div>
        <nav class="flex-1 space-y-1">
            <a class="flex items-center gap-3 px-3 py-3 text-custom-inverse-primary font-bold border-l-4 border-sky-400 bg-slate-800/60 transition-all"
                href="#">
                <span class="material-symbols-outlined" data-icon="dashboard">dashboard</span>
                <span class="font-mono-custom text-sm">Dashboard</span>
            </a>
            <a class="flex items-center gap-3 px-3 py-3 text-slate-300 font-medium hover:text-white hover:bg-slate-800/50 transition-colors"
                href="#">
                <span class="material-symbols-outlined" data-icon="group">group</span>
                <span class="font-mono-custom text-sm">Miembros</span>
            </a>
            <a class="flex items-center gap-3 px-3 py-3 text-slate-300 font-medium hover:text-white hover:bg-slate-800/50 transition-colors"
                href="#">
                <span class="material-symbols-outlined" data-icon="description">description</span>
                <span class="font-mono-custom text-sm">Contratos</span>
            </a>
            <a class="flex items-center gap-3 px-3 py-3 text-slate-300 font-medium hover:text-white hover:bg-slate-800/50 transition-colors"
                href="#">
                <span class="material-symbols-outlined" data-icon="payments">payments</span>
                <span class="font-mono-custom text-sm">Finanzas</span>
            </a>
            <a class="flex items-center gap-3 px-3 py-3 text-slate-300 font-medium hover:text-white hover:bg-slate-800/50 transition-colors"
                href="#">
                <span class="material-symbols-outlined" data-icon="settings">settings</span>
                <span class="font-mono-custom text-sm">Configuración</span>
            </a>
        </nav>
        <div class="pt-16 border-t border-slate-800 space-y-2">
            <button
                class="w-full flex items-center gap-3 px-3 py-3 text-sky-400 font-bold hover:bg-slate-800/50 transition-all">
                <span class="material-symbols-outlined" data-icon="add_circle">add_circle</span>
                <span class="font-mono-custom text-sm">Nuevo Socio</span>
            </button>
            <a class="flex items-center gap-3 px-3 py-2 text-slate-400 font-medium hover:text-white transition-all"
                href="#">
                <span class="material-symbols-outlined" data-icon="help_outline">help_outline</span>
                <span class="font-mono-custom text-xs">Ayuda</span>
            </a>
            <a class="flex items-center gap-3 px-3 py-2 text-slate-400 font-medium hover:text-white transition-all"
                href="#">
                <span class="material-symbols-outlined" data-icon="logout">logout</span>
                <span class="font-mono-custom text-xs">Cerrar Sesión</span>
            </a>
        </div>
    </aside>

    <!-- Header -->
    <header
        class="fixed top-0 right-0 left-64 h-16 flex justify-between items-center px-12 w-full bg-white border-b border-slate-200 z-10">
        <div class="flex items-center gap-6">
            <h2 class="text-xl font-black uppercase tracking-tight text-slate-900">Panel de Gestión</h2>
            <div class="relative w-96">
                <span
                    class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 text-sm">search</span>
                <input
                    class="w-full pl-10 pr-4 py-2 border border-slate-200 bg-slate-50 focus:ring-2 focus:ring-blue-500/50 focus:border-blue-500 outline-none text-xs font-mono-custom uppercase tracking-wider rounded"
                    placeholder="BUSCAR SOCIO O CONTRATO..." type="text" />
            </div>
        </div>
        <div class="flex items-center gap-6">
            <div class="flex gap-4 text-slate-500">
                <span
                    class="material-symbols-outlined hover:text-blue-600 cursor-pointer transition-all">notifications</span>
                <span
                    class="material-symbols-outlined hover:text-blue-600 cursor-pointer transition-all">calendar_today</span>
            </div>
            <div class="h-8 w-px bg-slate-200"></div>
            <div class="flex items-center gap-3 cursor-pointer group">
                <div class="text-right">
                    <p class="font-mono-custom text-[10px] text-slate-500 uppercase">Administrador</p>
                    <p class="font-mono-custom text-sm font-bold text-slate-800">A. Sánchez</p>
                </div>
                <div
                    class="h-10 w-10 rounded-full bg-slate-200 border border-slate-300 overflow-hidden flex items-center justify-center">
                    <img alt="Administrador" class="w-full h-full object-cover"
                        src="https://lh3.googleusercontent.com/aida-public/AB6AXuCqqfcksP1EOs674DOAevdxd_4Z4p5MRdmkvvByKafSk6qwz5X-0NwNePwexIOSzxVV6sHFVAtPx0qhnhIRlYL5wgKgXrkr_SYSiFirwseflNxdApDlYVu0Qj7TEHZKHKoW0Uy6zTumCDGFXNMXbogyaAZgHMNnH3uC-NEYHWNUajFjXHedax6LBDaAuF0VuTaWCuGtdmu5Om3Xh7ltQj1OTl6olX-42Sowkk9cSeSqGme-YFNDtYhxBy-ZYxBc5YgVHLvp4EibZXBR" />
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content Canvas -->
    <main class="ml-64 pt-16 min-h-screen p-12 bg-custom-surface transition-all duration-300 blur-sm" id="mainCanvas">
        <div class="max-w-[1440px] mx-auto">
            <nav
                class="flex gap-2 font-mono-custom text-slate-500 mb-8 items-center uppercase tracking-widest text-[10px]">
                <span>Control de Acceso</span>
                <span class="material-symbols-outlined text-sm">chevron_right</span>
                <span class="text-slate-900 font-bold">Módulo de Ingreso</span>
            </nav>
            <div class="grid grid-cols-12 gap-6">
                <!-- Main Access Panel -->
                <section
                    class="col-span-8 bg-white border border-slate-200 rounded-lg p-16 flex flex-col items-center justify-center min-h-[400px] shadow-sm">
                    <h3 class="text-3xl font-bold uppercase tracking-widest mb-16 text-slate-800">Identificación del
                        Socio</h3>
                    <div class="relative w-full max-w-lg mb-10">
                        <input
                            class="w-full text-center text-3xl font-bold py-6 px-4 bg-slate-50 border-2 border-slate-200 rounded outline-none tracking-widest text-slate-700"
                            disabled="" type="text" value="10.023.498-K" />
                        <span
                            class="material-symbols-outlined absolute right-6 top-1/2 -translate-y-1/2 text-slate-400">keyboard</span>
                    </div>
                    <button
                        class="bg-custom-primary-container hover:bg-blue-700 text-white font-bold py-4 px-12 text-lg uppercase tracking-widest flex items-center gap-4 hover:scale-[1.02] active:scale-95 transition-all shadow-md rounded"
                        onclick="openModal()">
                        Registrar Ingreso
                        <span class="material-symbols-outlined" data-icon="arrow_forward">arrow_forward</span>
                    </button>
                    <p class="mt-16 font-mono-custom text-xs text-slate-500 flex items-center gap-2">
                        Escáner activo en puerto COM4 <span
                            class="text-emerald-600 font-bold flex items-center gap-1"><span
                                class="material-symbols-outlined text-sm">check_circle</span> LISTO</span>
                    </p>
                </section>

                <!-- History Column -->
                <aside class="col-span-4 space-y-6">
                    <div class="bg-white border border-slate-200 rounded-lg p-6 shadow-sm">
                        <p class="font-mono-custom text-[10px] text-slate-500 uppercase tracking-widest mb-4">Último
                            Resultado</p>
                        <div class="flex flex-col items-center py-6 border-b border-slate-100">
                            <span class="material-symbols-outlined text-emerald-600 text-5xl mb-2"
                                data-icon="check_circle" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                            <p class="text-emerald-700 font-bold uppercase tracking-widest mb-1">Autorizado</p>
                            <p class="font-bold text-slate-800">Ana María Torres</p>
                            <p class="font-mono-custom text-xs text-slate-500">Membresía: Individual Gold</p>
                        </div>
                    </div>
                </aside>

                <!-- Recent History Table -->
                <section
                    class="col-span-12 bg-white border border-slate-200 rounded-lg mt-10 overflow-hidden shadow-sm">
                    <div class="p-6 border-b border-slate-200">
                        <h4 class="text-xl font-bold text-slate-800">Historial Reciente</h4>
                    </div>
                    <table class="w-full text-left border-collapse">
                        <thead class="bg-slate-900 text-white font-mono-custom uppercase tracking-widest text-[11px]">
                            <tr>
                                <th class="p-4">Hora</th>
                                <th class="p-4">Socio</th>
                                <th class="p-4">Documento</th>
                                <th class="p-4">Estado</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100 text-sm">
                            <tr class="bg-white hover:bg-slate-50 transition-colors">
                                <td class="p-4 font-mono-custom text-slate-600">09:41 AM</td>
                                <td class="p-4 font-bold uppercase text-slate-800">Ana María Torres <span
                                        class="text-xs font-normal text-slate-400 ml-2">(Membresía Individual
                                        Gold)</span></td>
                                <td class="p-4 font-mono-custom text-slate-600">10.023.498-K</td>
                                <td class="p-4"><span
                                        class="bg-emerald-100 text-emerald-700 px-3 py-1 text-xs font-bold uppercase tracking-tighter rounded">Autorizado</span>
                                </td>
                            </tr>
                            <tr class="bg-slate-50/50 hover:bg-slate-100 transition-colors">
                                <td class="p-4 font-mono-custom text-slate-600">09:35 AM</td>
                                <td class="p-4 font-bold uppercase text-slate-800">Carlos Ruiz Méndez <span
                                        class="text-xs font-normal text-slate-400 ml-2">(Pase Corporativo)</span></td>
                                <td class="p-4 font-mono-custom text-slate-600">78.901.234-5</td>
                                <td class="p-4"><span
                                        class="bg-emerald-100 text-emerald-700 px-3 py-1 text-xs font-bold uppercase tracking-tighter rounded">Autorizado</span>
                                </td>
                            </tr>
                            <tr class="bg-white hover:bg-slate-50 transition-colors">
                                <td class="p-4 font-mono-custom text-slate-600">09:12 AM</td>
                                <td class="p-4 font-bold uppercase text-slate-800">Elena Rojas Silva <span
                                        class="text-xs font-normal text-slate-400 ml-2">(Vencimiento: 12/05/2024)</span>
                                </td>
                                <td class="p-4 font-mono-custom text-slate-600">45.678.901-2</td>
                                <td class="p-4"><span
                                        class="bg-rose-100 text-rose-700 px-3 py-1 text-xs font-bold uppercase tracking-tighter rounded">Denegado</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </section>
            </div>
        </div>
    </main>

    <!-- CHECK-IN CONFIRMATION MODAL -->
    <div class="fixed inset-0 z-50 flex items-center justify-center p-4 blur-backdrop overflow-hidden opacity-100 transition-opacity duration-300"
        id="checkinModal">
        <div
            class="bg-white w-full max-w-lg premium-shadow rounded-lg relative overflow-hidden animate-in fade-in zoom-in duration-300 border border-slate-200">
            <!-- Auto-close Timer Bar -->
            <div class="h-1 bg-blue-600 w-full animate-autoclose" id="timerBar"></div>
            <div class="p-12 flex flex-col items-center text-center">
                <!-- Close Button -->
                <button aria-label="Cerrar modal"
                    class="absolute top-6 right-6 text-slate-400 hover:text-slate-800 transition-colors"
                    onclick="closeModal()">
                    <span class="material-symbols-outlined">close</span>
                </button>
                <!-- Status Icon -->
                <div class="w-24 h-24 bg-emerald-50 rounded-full flex items-center justify-center mb-8 relative">
                    <div class="absolute inset-0 rounded-full border-2 border-emerald-500/20 animate-ping"></div>
                    <span class="material-symbols-outlined text-emerald-600 text-6xl"
                        style="font-variation-settings: 'FILL' 1;">check_circle</span>
                </div>
                <!-- Main Message -->
                <h3 class="font-mono-custom text-sm uppercase tracking-[0.2em] text-emerald-700 mb-2 font-bold">Acceso
                    Autorizado</h3>
                <h2 class="text-3xl font-bold text-slate-900 mb-8">Ana María Torres</h2>
                <!-- Membership Details Bento Style -->
                <div class="w-full grid grid-cols-2 gap-4 mb-10">
                    <div class="bg-slate-50 p-4 text-left border border-slate-200 rounded">
                        <p class="font-mono-custom text-[10px] uppercase text-slate-500 mb-2">Estado Membresía</p>
                        <div class="flex items-center gap-2">
                            <span class="w-2 h-2 rounded-full bg-emerald-500"></span>
                            <span
                                class="font-mono-custom text-sm font-bold uppercase tracking-wider text-emerald-700">Activo</span>
                        </div>
                    </div>
                    <div class="bg-slate-50 p-4 text-left border border-slate-200 rounded">
                        <p class="font-mono-custom text-[10px] uppercase text-slate-500 mb-2">Plan Actual</p>
                        <span
                            class="font-mono-custom text-sm font-bold uppercase tracking-wider text-slate-800">Individual
                            Gold</span>
                    </div>
                </div>
                <!-- Progress/Remaining Days Info -->
                <div class="w-full mb-10">
                    <div class="flex justify-between items-end mb-2">
                        <div class="text-left">
                            <p class="font-mono-custom text-[10px] uppercase text-slate-500">Vencimiento del Ciclo</p>
                            <p class="text-lg font-bold text-slate-800">Días restantes: 15 días</p>
                        </div>
                        <span class="font-mono-custom text-[10px] font-bold text-blue-600">50% COMPLETADO</span>
                    </div>
                    <div class="h-2 w-full bg-slate-200 rounded-full overflow-hidden">
                        <div class="h-full bg-blue-600 w-1/2 transition-all duration-1000 ease-out"></div>
                    </div>
                </div>
                <!-- Footer Action -->
                <button
                    class="w-full bg-custom-primary-container hover:bg-blue-700 text-white py-5 font-bold uppercase tracking-[0.2em] text-sm active:scale-[0.98] transition-all flex items-center justify-center gap-2 rounded shadow-md"
                    onclick="closeModal()">
                    Entendido
                    <span class="material-symbols-outlined text-lg">check</span>
                </button>
                <p class="mt-6 font-mono-custom text-[10px] text-slate-400 uppercase tracking-widest">Registrado el 22
                    de mayo de 2024 a las 13:24</p>
            </div>
        </div>
    </div>

    <script>
        let autoCloseTimer;

        function closeModal() {
            const modal = document.getElementById('checkinModal');
            const mainCanvas = document.getElementById('mainCanvas');
            modal.classList.add('hidden');
            mainCanvas.classList.remove('blur-sm');
            clearTimeout(autoCloseTimer);
        }

        function openModal() {
            const modal = document.getElementById('checkinModal');
            const mainCanvas = document.getElementById('mainCanvas');
            const timerBar = document.getElementById('timerBar');

            modal.classList.remove('hidden');
            mainCanvas.classList.add('blur-sm');

            timerBar.classList.remove('animate-autoclose');
            void timerBar.offsetWidth; // Forzar re-flow
            timerBar.classList.add('animate-autoclose');

            clearTimeout(autoCloseTimer);
            autoCloseTimer = setTimeout(() => {
                closeModal();
            }, 4000);
        }

        window.addEventListener('DOMContentLoaded', () => {
            autoCloseTimer = setTimeout(() => {
                closeModal();
            }, 4000);
        });
    </script>
</body>

</html>