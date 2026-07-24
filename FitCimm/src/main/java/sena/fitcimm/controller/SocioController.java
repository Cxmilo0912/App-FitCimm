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
import java.util.List;
import java.util.Map;
import sena.fitcimm.service.*;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SocioController", urlPatterns = {"/SocioController"})
public class SocioController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("action");

        SocioService oSocioService = new SocioService();

        if (accion == null) {
            try {
                List<Map<String, Object>> listaSocios = oSocioService.MtListarSociosConEstado();

                req.setAttribute("listaSocios", listaSocios);

            } catch (Exception e) {
                req.setAttribute("errorMsg", e.getMessage());
            }
            req.getRequestDispatcher("/WEB-INF/Vistas/Socio/ListadoSocios.jsp").forward(req, resp);

        } else {
            if (accion.equals("nuevo")) {
                req.getRequestDispatcher("/WEB-INF/Vistas/Socio/NuevoSocio.jsp").forward(req, resp);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
