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
import sena.fitcimm.service.IngresoService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "IngresoController", urlPatterns = {"/IngresoController"})
public class IngresoController extends HttpServlet {

    //Redireccion
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        IngresoService oService = new IngresoService();
        LocalDate fechaConsulta;

        try {
            String fechaStr = req.getParameter("fechaConsulta");

            if (fechaStr != null && !fechaStr.isEmpty()) {
                fechaConsulta = LocalDate.parse(fechaStr);
            } else {
                fechaConsulta = LocalDate.now();
            }
            List<Map<String, Object>> listaHistorial = oService.MtListarIngresosPorFecha(fechaConsulta);
            req.setAttribute("historial", listaHistorial);

        } catch (Exception e) {
            req.setAttribute("errorMsg", "Error al cargar el historial: " + e.getMessage());
            try {
                req.setAttribute("historial", oService.MtListarIngresosPorFecha(LocalDate.now()));
            } catch (Exception ignored) {
            }
        }

        req.getRequestDispatcher("/WEB-INF/Vistas/Ingreso/ModuloIngreso.jsp").forward(req, resp);
    }

    //Ingreso
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String documento = req.getParameter("documentoSocio");

        IngresoService oService = new IngresoService();

        try {
            Map<String, Object> resultado = oService.MtRegistrarIngreso(documento);
            req.setAttribute("resultadoIngreso", resultado);

        } catch (Exception e) {
            req.setAttribute("errorMsg", e.getMessage());

        }

        doGet(req, resp);
    }

}
