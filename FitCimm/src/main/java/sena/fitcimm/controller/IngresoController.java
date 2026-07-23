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
            req.getRequestDispatcher("/WEB-INF/Vistas/Ingreso/ModuloIngreso.jsp").forward(req, resp);

        } catch (Exception e) {
            req.getSession().setAttribute("errorMsg", e.getMessage());
            req.getRequestDispatcher("/WEB-INF/Vistas/Ingreso/ModuloIngreso.jsp").forward(req, resp);

        }

    }

}
