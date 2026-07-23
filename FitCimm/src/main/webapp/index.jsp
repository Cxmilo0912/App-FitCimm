<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FitCIMM - Centro de Control</title>

        <!-- Google Fonts & Material Symbols -->
        <link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@400;600;700;900&family=JetBrains+Mono:wght@500&family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=block" rel="stylesheet">

        <!-- Tailwind CSS CDN -->
        <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

        <!-- Archivos locales con sintaxis JSP correcta ($) -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme.css">
        <script src="${pageContext.request.contextPath}/js/theme.js"></script>

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

        <button type="button" id="themeToggle" onclick="toggleTheme()"
                class="fixed top-6 right-6 p-2.5 bg-white dark:bg-slate-800 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 rounded-xl shadow-sm hover:shadow-md transition-all z-50 cursor-pointer">
            <span class="material-symbols-outlined text-[20px] dark:hidden">dark_mode</span>
            <span class="material-symbols-outlined text-[20px] hidden dark:block">light_mode</span>
        </button>

        <!-- MAIN CONTENT CANVAS -->
        <main class="min-h-screen w-full flex flex-col justify-center items-center p-6 md:p-10">
            <div class="w-full max-w-6xl mx-auto flex flex-col justify-center items-center my-auto">

                <!-- Header Section -->
                <div class="text-center mb-10 md:mb-14 space-y-3">
                    <h1 class="text-3xl md:text-5xl font-black text-slate-900 dark:text-white tracking-tight">
                        Sistema de GestiÃ³n de Gimnasio FitCIMM
                    </h1>
                    <p class="text-base md:text-lg text-slate-500 dark:text-slate-400 max-w-2xl mx-auto leading-relaxed">
                        Bienvenido al Centro de Control de su Gimnasio. Gestione fÃ¡cilmente socios, ingresos, planes y reportes en un solo lugar.
                    </p>
                </div>

                <!-- Launcher Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 w-full">

                    <!-- Card: GestiÃ³n de Socios -->
                    <a href="${pageContext.request.contextPath}/WEB-INF/Vistas/Socio/ListadoSocios.jsp"
                       class="module-card group relative bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 hover:border-sky-500 p-6 rounded-2xl flex flex-col items-start text-left transition-all duration-300 hover:-translate-y-2 hover:shadow-xl hover:shadow-sky-500/10 h-full cursor-pointer">
                        <div class="w-14 h-14 bg-slate-100 dark:bg-slate-800 flex items-center justify-center rounded-xl mb-6 group-hover:bg-sky-500/10 transition-colors duration-300">
                            <span class="material-symbols-outlined text-[32px] text-sky-600 dark:text-sky-400">group</span>
                        </div>
                        <h3 class="text-xl font-bold text-slate-900 dark:text-white mb-2">Gestión de Socios</h3>
                        <p class="text-sm text-slate-500 dark:text-slate-400 mb-6 flex-grow leading-relaxed">
                            GestiÃ³n integral del directorio de socios: cree nuevos registros, modifique perfiles y mantenga la informaciÃ³n al dÃ­a.
                        </p>
                        <div class="flex items-center gap-2 text-xs font-bold text-sky-600 dark:text-sky-400 group-hover:translate-x-1 transition-transform uppercase tracking-wider">

                            <span>ACCEDER MÓDULO</span>
                            <span class="material-symbols-outlined text-[18px]">arrow_forward</span>
                        </div>
                        <div class="absolute bottom-0 left-0 h-1 w-0 bg-sky-500 group-hover:w-full transition-all duration-500 rounded-b-2xl"></div>
                    </a>

                    <!-- Card: Control de Acceso -->
                    <a href="${pageContext.request.contextPath}/IngresoController"
                       class="module-card group relative bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 hover:border-sky-500 p-6 rounded-2xl flex flex-col items-start text-left transition-all duration-300 hover:-translate-y-2 hover:shadow-xl hover:shadow-sky-500/10 h-full cursor-pointer">
                        <div class="w-14 h-14 bg-slate-100 dark:bg-slate-800 flex items-center justify-center rounded-xl mb-6 group-hover:bg-sky-500/10 transition-colors duration-300">
                            <span class="material-symbols-outlined text-[32px] text-sky-600 dark:text-sky-400">security</span>
                        </div>
                        <h3 class="text-xl font-bold text-slate-900 dark:text-white mb-2">Control de Acceso</h3>
                        <p class="text-sm text-slate-500 dark:text-slate-400 mb-6 flex-grow leading-relaxed">
                            Monitoreo, validación de credenciales y registros de entrada.
                        </p>
                        <div class="flex items-center gap-2 text-xs font-bold text-sky-600 dark:text-sky-400 group-hover:translate-x-1 transition-transform uppercase tracking-wider">
                            <span>ACCEDER MÃDULO</span>
                            <span class="material-symbols-outlined text-[18px]">arrow_forward</span>
                        </div>
                        <div class="absolute bottom-0 left-0 h-1 w-0 bg-sky-500 group-hover:w-full transition-all duration-500 rounded-b-2xl"></div>
                    </a>



                    <a href="${pageContext.request.contextPath}/PlanController?accion=gestion"
                       class="module-card group relative bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 hover:border-sky-500 p-6 rounded-2xl flex flex-col items-start text-left transition-all duration-300 hover:-translate-y-2 hover:shadow-xl hover:shadow-sky-500/10 h-full cursor-pointer">
                        <div class="w-14 h-14 bg-slate-100 dark:bg-slate-800 flex items-center justify-center rounded-xl mb-6 group-hover:bg-sky-500/10 transition-colors duration-300">
                            <span class="material-symbols-outlined text-[32px] text-sky-600 dark:text-sky-400">payments</span>
                        </div>
                        <h3 class="text-xl font-bold text-slate-900 dark:text-white mb-2">Planes y MembresÃ­as</h3>
                        <p class="text-sm text-slate-500 dark:text-slate-400 mb-6 flex-grow leading-relaxed">
                            GestiÃ³n integral de la oferta: configure planes de cobro, administre la venta y renovaciÃ³n de membresÃ­as, y monitoree estados de vigencia.
                        </p>
                        <div class="flex items-center gap-2 text-xs font-bold text-sky-600 dark:text-sky-400 group-hover:translate-x-1 transition-transform uppercase tracking-wider">
                            <span>ACCEDER MÃDULO</span>
                            <span class="material-symbols-outlined text-[18px]">arrow_forward</span>
                        </div>
                        <div class="absolute bottom-0 left-0 h-1 w-0 bg-sky-500 group-hover:w-full transition-all duration-500 rounded-b-2xl"></div>
                    </a>

                    <!-- Card: Reportes -->
                    <a href="${pageContext.request.contextPath}/PlanController?accion=reportes"
                       class="module-card group relative bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 hover:border-sky-500 p-6 rounded-2xl flex flex-col items-start text-left transition-all duration-300 hover:-translate-y-2 hover:shadow-xl hover:shadow-sky-500/10 h-full cursor-pointer">
                        <div class="w-14 h-14 bg-slate-100 dark:bg-slate-800 flex items-center justify-center rounded-xl mb-6 group-hover:bg-sky-500/10 transition-colors duration-300">
                            <span class="material-symbols-outlined text-[32px] text-sky-600 dark:text-sky-400">analytics</span>
                        </div>
                        <h3 class="text-xl font-bold text-slate-900 dark:text-white mb-2">Reportes</h3>
                        <p class="text-sm text-slate-500 dark:text-slate-400 mb-6 flex-grow leading-relaxed">
                            Monitoreo de ventas y anÃ¡lisis de datos.
                        </p>
                        <div class="flex items-center gap-2 text-xs font-bold text-sky-600 dark:text-sky-400 group-hover:translate-x-1 transition-transform uppercase tracking-wider">
                            <span>ACCEDER MÃDULO</span>
                            <span class="material-symbols-outlined text-[18px]">arrow_forward</span>
                        </div>
                        <div class="absolute bottom-0 left-0 h-1 w-0 bg-sky-500 group-hover:w-full transition-all duration-500 rounded-b-2xl"></div>
                    </a>

                </div>
            </div>
        </main>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                // Hover animations para rellenar los Ã­conos de Material Symbols
                document.querySelectorAll('.module-card').forEach(card => {
                    card.addEventListener('mouseenter', () => {
                        const icon = card.querySelector('.material-symbols-outlined');
                        if (icon)
                            icon.style.fontVariationSettings = "'FILL' 1";
                    });
                    card.addEventListener('mouseleave', () => {
                        const icon = card.querySelector('.material-symbols-outlined');
                        if (icon)
                            icon.style.fontVariationSettings = "'FILL' 0";
                    });
                });
            });
        </script>
    </body>

</html>