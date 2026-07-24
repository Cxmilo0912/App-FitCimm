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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import sena.fitcimm.service.SocioService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "MembresiaController", urlPatterns = {"/MembresiaController"})
public class MembresiaController extends HttpServlet {

    private SocioService oSocio = new SocioService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("accion");

        if ("menu".equals(action)) {
            request.getRequestDispatcher("WEB-INF/Vistas/Membresia/Membresia.jsp").forward(request, response);
        } else if ("nuevo".equals(action)) {

            try {

                List<Map<String, Object>> listaSocios = oSocio.MtListarSociosConEstado();
                request.setAttribute("socios", listaSocios);
            } catch (Exception e) {
                request.setAttribute("errorMsg", e.getMessage());

            }
            request.getRequestDispatcher("WEB-INF/Vistas/Membresia/CrearMembresia.jsp").forward(request, response);

        }

    }

}
