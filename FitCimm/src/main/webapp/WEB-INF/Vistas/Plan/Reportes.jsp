<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
        </style>
    </head>

    <body class="bg-slate-50 dark:bg-navy-950 text-slate-800 dark:text-slate-100 min-h-screen transition-colors duration-200">

        <jsp:include page="/WEB-INF/Vistas/Menu.jsp" />

        <main class="p-6 md:p-10 min-h-screen max-w-[1600px] mx-auto">
            <!-- Page Header -->
            <header class="mb-6 flex flex-col sm:flex-row justify-between items-start sm:items-end gap-4">
                <div>
                    <h1 class="text-2xl md:text-3xl font-bold text-slate-900 dark:text-white tracking-tight">Panel de Reportes del Sistema</h1>
                    <p class="text-sm md:text-base text-slate-500 dark:text-slate-400 mt-1">Visualización de datos consolidados para socios, recaudación y analítica de planes.</p>
                </div>
            </header>

            <!-- Report Tabs Selector -->
            <div class="flex flex-wrap gap-2 mb-6 border-b border-slate-200 dark:border-slate-800 pb-4">
                <button onclick="switchReport('report1', this)"
                        class="report-tab px-4 py-2.5 rounded-lg text-sm font-semibold transition-all flex items-center gap-2
                        ${param.accion == 'reporteplan' 
                          ? 'bg-white dark:bg-navy-900 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-800 hover:bg-slate-100 dark:hover:bg-slate-800' 
                          : 'bg-sky-600 text-white shadow-md shadow-sky-600/20'}">
                    <span class="material-symbols-outlined text-[18px]">badge</span>
                    Socios Activos (Vigentes)
                </button>

                <button onclick="switchReport('report2', this)"
                        class="report-tab px-4 py-2.5 rounded-lg text-sm font-semibold transition-all flex items-center gap-2
                        ${param.accion == 'reporteplan' 
                          ? 'bg-sky-600 text-white shadow-md shadow-sky-600/20' 
                          : 'bg-white dark:bg-navy-900 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-800 hover:bg-slate-100 dark:hover:bg-slate-800'}">
                    <span class="material-symbols-outlined text-[18px]">payments</span>
                    Reporte Planes
                </button>

            </div>


            <div id="report1" class="report-content space-y-6 ${param.accion == 'reportePlan' ? 'hidden' : ''}">
                <div class="bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 rounded-2xl shadow-sm overflow-hidden">
                    <div class="p-5 border-b border-slate-200 dark:border-slate-800 flex justify-between items-center">
                        <div>
                            <h2 class="text-lg font-bold text-slate-900 dark:text-white">Reporte de socios activos con membresía vigente</h2>
                        </div>
                      
                    </div>
                    <div class="overflow-x-auto custom-scrollbar">
                        <table id="tablaMembresias" class="w-full text-left border-collapse">
                            <thead>
                                <tr>
                                    <th>Documento Socio</th>
                                    <th>Nombre del Socio</th>
                                    <th>Plan Asignado</th>
                                    <th>Válido Hasta</th>
                                    <th>Estado</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="m" items="${membresias}">
                                    <c:if test="${m.estadoMembresia == 'VIGENTE'}">
                                        <tr>
                                            <td class="mono">${m.documento}</td>
                                            <td style="font-weight: 600;">${m.nombres} ${m.apellidos}</td>
                                            <td>Plan ${m.plan}</td>
                                            <td class="mono">${m.fechaFin}</td>
                                            <td>

                                                <span class="badge badge-vigente">Vigente</span>



                                            </td>

                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>


                    </div>
                </div>
            </div>


            <div id="report2" class="report-content space-y-6 ${param.accion == 'reportePlan' ? '' : 'hidden'}">
                <!-- Tarjeta: Plan Más Vendido del Mes -->
                <div class="bg-gradient-to-r from-sky-600 to-blue-700 text-white rounded-2xl shadow-md p-6 flex items-center justify-between gap-6">
                    <div class="flex items-center gap-4">
                        <div class="bg-white/10 p-3 rounded-xl">
                            <span class="material-symbols-outlined text-[28px]">trending_up</span>
                        </div>
                        <div>
                            <span class="text-xs uppercase tracking-wider text-sky-200 font-semibold">Plan más vendido del mes</span>
                            <h3 class="text-xl sm:text-2xl font-extrabold tracking-tight">Plan ${masVendido}</h3>
                        </div>
                    </div>

                </div>
                <div class="bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-800 rounded-2xl shadow-sm overflow-hidden">
                    <div class="p-5 border-b border-slate-200 dark:border-slate-800 flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                        <div>
                            <h2 class="text-lg font-bold text-slate-900 dark:text-white">Reporte del total recaudado en un rango de fechas, agrupado por plan</h2>

                        </div>

                        <form action="${pageContext.request.contextPath}/PlanController" method="GET" class="flex items-center gap-2 bg-slate-50 dark:bg-navy-950 p-2 rounded-xl border border-slate-200 dark:border-slate-800 text-xs">
                            <input type="hidden" name="accion" value="reportePlan">
                            <div class="flex items-center gap-1.5">
                                <span class="text-slate-400 font-medium">Desde:</span>
                                <input type="date" name="fechaInicio" value="" class="bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-700 rounded-lg px-2 py-1echaInici text-slate-700 dark:text-slate-200 font-mono focus:outline-none focus:ring-1 focus:ring-sky-500">
                            </div>
                            <div class="flex items-center gap-1.5">
                                <span class="text-slate-400 font-medium">Hasta:</span>
                                <input type="date" name="fechaFin" value="" class="bg-white dark:bg-navy-900 border border-slate-200 dark:border-slate-700 rounded-lg px-2 py-1 text-slate-700 dark:text-slate-200 font-mono focus:outline-none focus:ring-1 focus:ring-sky-500">
                            </div>
                            <button type="submit" class="bg-sky-600 hover:bg-sky-500 text-white font-semibold px-3 py-1.5 rounded-lg transition-all shadow-sm">
                                Filtrar
                            </button>
                        </form>
                    </div>
                    <div class="overflow-x-auto custom-scrollbar">
                        <table class="w-full text-left border-collapse">
                            <thead>
                                <tr class="bg-navy-900 dark:bg-navy-950 text-slate-200 border-b border-slate-800">
                                    <th class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase border-r border-slate-800">PLAN COMERCIAL</th>

                                    <th class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase border-r border-slate-800">VALOR UNITARIO</th>
                                    <th class="px-6 py-4 text-xs font-semibold font-mono tracking-wider uppercase">RECAUDACIÓN TOTAL</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-slate-100 dark:divide-slate-800 text-sm">
                                <c:forEach var="p" items="${total}">
                                    <tr class="hover:bg-slate-50 dark:hover:bg-slate-800/50 transition-colors">
                                        <td class="px-6 py-4 font-semibold text-slate-900 dark:text-white">Plan ${p.nombrePlan}</td>
                                        <td class="px-6 py-4 font-mono text-slate-500 dark:text-slate-400">$ ${p.valorUnitario}</td>
                                        <td class="px-6 py-4 font-mono font-bold text-emerald-600 dark:text-emerald-400">$ ${p.recaudacionTotal}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>

            </div>


        </main>

        <script>
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