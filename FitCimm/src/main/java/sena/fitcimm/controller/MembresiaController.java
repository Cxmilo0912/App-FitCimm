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
import sena.fitcimm.model.Socio;
import sena.fitcimm.service.*;

/**
 *
 * @author Admin
 */
@WebServlet(name = "MembresiaController", urlPatterns = {"/MembresiaController"})
public class MembresiaController extends HttpServlet {

    private SocioService oSocio = new SocioService();
    private PlanService oPlan = new PlanService();
    private MembresiaService oMembresia = new MembresiaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("accion");

        if ("menu".equals(action)) {
            try {
                List<Map<String, Object>> listaMembresias = oMembresia.MtListarMembresias();
                request.setAttribute("membresias", listaMembresias);
                 List<Plan> listaPlanes = oPlan.MtListarPlanes();
                request.setAttribute("planes", listaPlanes);
             
                String success = (String) request.getSession().getAttribute("success");
                if (success != null) {
                    request.setAttribute("success", success);
                    request.getSession().removeAttribute("success"); 
                }
                String error = (String) request.getSession().getAttribute("error");
                if (error != null) {
                    request.setAttribute("error", error);
                    request.getSession().removeAttribute("error"); 
                }
                 request.getRequestDispatcher("WEB-INF/Vistas/Membresia/Membresia.jsp").forward(request, response);

            } catch (Exception e) {
                request.setAttribute("errorMsg", e.getMessage());

            }
        } else if ("nuevo".equals(action)) {

            try {

                List<Socio> listaSocios = oSocio.MtListarSocios();
                request.setAttribute("socios", listaSocios);
                List<Plan> listaPlanes = oPlan.MtListarPlanes();
                request.setAttribute("planes", listaPlanes);
                String error = (String) request.getSession().getAttribute("error");
                if (error != null) {
                    request.setAttribute("error", error);
                    request.getSession().removeAttribute("error");
                }

            } catch (Exception e) {
                request.setAttribute("errorMsg", e.getMessage());

            }
            request.getRequestDispatcher("WEB-INF/Vistas/Membresia/CrearMembresia.jsp").forward(request, response);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion.equals("registrar")) {
            try {
                int idPlan = Integer.parseInt(request.getParameter("plan"));
                Plan oplan = new Plan();
                Plan plan = oPlan.MtListarPlan(idPlan);

                oplan.setId(idPlan);
                oplan.setDuracionDias(plan.getDuracionDias());

                int idSocio = (Integer.parseInt(request.getParameter("idSocio")));
                LocalDate fechaInicio = LocalDate.parse(request.getParameter("fechaInicio"));
                double valorPagado = Double.parseDouble(request.getParameter("valorpagado"));

                oMembresia.MtVender(idSocio, oplan, valorPagado, fechaInicio);
                request.setAttribute("success", "la membresia se ha registado correctamente");
                request.getRequestDispatcher("WEB-INF/Vistas/Plan/CrearMembresia.jsp").forward(request, response);
                return;
            } catch (Exception e) {
                request.getSession().setAttribute("error", e.getMessage());
                response.sendRedirect(request.getContextPath() + "/MembresiaController?accion=nuevo");

            }

        } else if (accion.equals("renovar")) {
            try {
                int idPlan = Integer.parseInt(request.getParameter("Plan"));
                Plan oplan = new Plan();
                Plan plan = oPlan.MtListarPlan(idPlan);
                oplan.setId(idPlan);
                oplan.setDuracionDias(plan.getDuracionDias());

                int idSocio = (Integer.parseInt(request.getParameter("id")));
                LocalDate fechaInicio = LocalDate.parse(request.getParameter("fechaInicio"));
                double valorPagado = Double.parseDouble(request.getParameter("totalPagado"));

                oMembresia.MtRenovar(idSocio,oplan, valorPagado, fechaInicio);

                request.getSession().setAttribute("success", "la membresia se ha renovado correctamente");
                 response.sendRedirect(request.getContextPath() + "/MembresiaController?accion=menu");
                return;
            } catch (Exception e) {
                request.getSession().setAttribute("error", e.getMessage());
                 response.sendRedirect(request.getContextPath() + "/MembresiaController?accion=menu");

            }
        }

    }

}
