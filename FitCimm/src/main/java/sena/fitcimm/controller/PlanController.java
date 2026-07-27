/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sena.fitcimm.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import sena.fitcimm.model.Plan;
import sena.fitcimm.service.MembresiaService;
import sena.fitcimm.service.PlanService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PlanController", urlPatterns = {"/PlanController"})
public class PlanController extends HttpServlet {

    private PlanService oService = new PlanService();
    private MembresiaService oMembresia = new MembresiaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("reporte".equals(accion)) {
            try {
                String plan = oService.MtMasVendido();
                 List<Map<String, Object>> listaMembresias = oMembresia.MtListarMembresias();
                request.setAttribute("membresias", listaMembresias);
                request.setAttribute("masVendido", plan);
                request.getRequestDispatcher("/WEB-INF/Vistas/Plan/Reportes.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("WEB-INF/Vistas/Plan/Reportes.jsp").forward(request, response);
            }
        } else if ("reportePlan".equals(accion)) {
            try {

                LocalDate Fecha1 = LocalDate.parse(request.getParameter("fechaInicio"));
                LocalDate Fecha2 = LocalDate.parse(request.getParameter("fechaFin"));
                List<Map<String, Object>> lista = oService.MtTotalRecaudo(Fecha1, Fecha2);
                 String plan = oService.MtMasVendido();
                 List<Map<String, Object>> listaMembresias = oMembresia.MtListarMembresias();
                request.setAttribute("membresias", listaMembresias);
                request.setAttribute("masVendido", plan);
                
                request.setAttribute("total", lista);
                request.getRequestDispatcher("/WEB-INF/Vistas/Plan/Reportes.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("WEB-INF/Vistas/Plan/Reportes.jsp").forward(request, response);
            }
        } else if ("gestion".equals(accion)) {
            try {

                List<Plan> listaPlanes = oService.MtListarPlanes();
                request.setAttribute("planes", listaPlanes);
                String success = (String) request.getSession().getAttribute("success");
                if (success != null) {
                    request.setAttribute("success", success);
                    request.getSession().removeAttribute("success"); 
                }
                request.getRequestDispatcher("WEB-INF/Vistas/Plan/GestionPlanes.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("WEB-INF/Vistas/Plan/GestionPlanes.jsp").forward(request, response);
            }
        } else if ("nuevo".equals(accion)) {
            request.getRequestDispatcher("WEB-INF/Vistas/Plan/NuevoPlan.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion.equals("registrar")) {
            try {
                Plan oplan = new Plan();
                oplan.setNombre(request.getParameter("plan_name"));
                oplan.setDuracionDias(Integer.parseInt(request.getParameter("plan_duration")));
                oplan.setValor(Double.parseDouble(request.getParameter("plan_value")));

                PlanService oService = new PlanService();
                oService.MtRegistarPlan(oplan);
                request.setAttribute("success", "el plan se ha registado correctamente");
                request.getRequestDispatcher("WEB-INF/Vistas/Plan/NuevoPlan.jsp").forward(request, response);
                return;
            } catch (Exception e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("WEB-INF/Vistas/Plan/NuevoPlan.jsp").forward(request, response);
            }
        } else if (accion.equals("actualizar")) {
            try {
                Plan oplan = new Plan();
                oplan.setId(Integer.parseInt(request.getParameter("id")));
                oplan.setNombre(request.getParameter("plan_name"));
                oplan.setDuracionDias(Integer.parseInt(request.getParameter("plan_duration")));
                oplan.setValor(Double.parseDouble(request.getParameter("plan_value")));
                PlanService oService = new PlanService();
                oService.MtEditarPlan(oplan);
                request.getSession().setAttribute("success", "el plan se ha actualizado correctamente");
                response.sendRedirect(request.getContextPath() + "/PlanController?accion=gestion");
                return;
            } catch (Exception e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("WEB-INF/Vistas/Plan/gestionPlanes.jsp").forward(request, response);
            }
        } else if (accion.equals("inactivar")) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));

                PlanService oService = new PlanService();
                oService.MtInativarPlan(false, id);
                request.getSession().setAttribute("success", "el plan se ha inactivado correctamente");
                response.sendRedirect(request.getContextPath() + "/PlanController?accion=gestion");
                return;
            } catch (Exception e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("WEB-INF/Vistas/Plan/GestionPlanes.jsp").forward(request, response);
            }

        }

    }

}
