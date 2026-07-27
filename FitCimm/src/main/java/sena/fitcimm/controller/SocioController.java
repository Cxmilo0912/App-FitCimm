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
import sena.fitcimm.model.*;
import sena.fitcimm.service.*;
import java.time.*;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SocioController", urlPatterns = {"/SocioController"})
public class SocioController extends HttpServlet {

    SocioService oSocioService = new SocioService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("action");

        try {
            if (accion.equals("listar")) {
                List<Map<String, Object>> listaSocios = oSocioService.MtListarSociosConEstado();

                req.setAttribute("listaSocios", listaSocios);
                req.getRequestDispatcher("/WEB-INF/Vistas/Socio/ListarSocios.jsp").forward(req, resp);

            } else if (accion.equals("nuevo")) {
                req.getRequestDispatcher("/WEB-INF/Vistas/Socio/NuevoSocio.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            req.setAttribute("errorMsg", e.getMessage());
            req.getRequestDispatcher("/WEB-INF/Vistas/Socio/ListarSocios.jsp").forward(req, resp);

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String accion = req.getParameter("action");

        try {
            if (accion.equals("registrar")) {

                Socio oSocio = new Socio();
                oSocio.setNombres(req.getParameter("nombres"));
                oSocio.setApellidos(req.getParameter("apellidos"));
                oSocio.setDocumento(req.getParameter("documento"));
                String fechaStr = req.getParameter("fecha_nacimiento");

                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

                LocalDate fechaNacimiento = LocalDate.parse(fechaStr, formatter);
                oSocio.setFechaNacimiento(fechaNacimiento);
                oSocio.setTelefono(req.getParameter("telefono"));
                oSocio.setCorreo(req.getParameter("correo"));

                oSocioService.MtRegistrarSocio(oSocio);

                resp.sendRedirect(req.getContextPath() + "/SocioController?action=nuevo&exito=true");
                return;
            } else if (accion.equals("actualizar")) {
                Socio oSocio = new Socio();
                oSocio.setId(Integer.parseInt(req.getParameter("id")));
                oSocio.setNombres(req.getParameter("partner_names"));
                oSocio.setApellidos(req.getParameter("partner_lastnames"));
                oSocio.setDocumento(req.getParameter("partner_document"));
                oSocio.setTelefono(req.getParameter("partner_cellnumber"));
                oSocio.setCorreo(req.getParameter("partner_email"));
                String fechaStr = req.getParameter("partner_date");
                if (fechaStr != null && !fechaStr.trim().isEmpty()) {
                    oSocio.setFechaNacimiento(LocalDate.parse(fechaStr));
                }
                oSocioService.MtActualizarSocio(oSocio);
                resp.sendRedirect(req.getContextPath() + "/SocioController?action=listar&exito=trueupdate");
                return;
            } else if (accion.equals("inactivar")) {
                int id = Integer.parseInt(req.getParameter("id"));

                oSocioService.MtCambiarEstado(id, false);

                resp.sendRedirect(req.getContextPath() + "/SocioController?action=listar&exito=trueinactivate");
                return;
            } else if (accion.equals("activar")) {
                int id = Integer.parseInt(req.getParameter("id"));

                oSocioService.MtCambiarEstado(id, true);

                resp.sendRedirect(req.getContextPath() + "/SocioController?action=listar&exito=trueactivate");
                return;
            }

            resp.sendRedirect(req.getContextPath() + "/SocioController?action=listar");
        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());

            if (accion.equals("registrar")) {
                req.getRequestDispatcher("/WEB-INF/Vistas/Socio/NuevoSocio.jsp").forward(req, resp);
            } else {
                try {
                    List<Map<String, Object>> listaSocios = oSocioService.MtListarSociosConEstado();
                    req.setAttribute("listaSocios", listaSocios);
                } catch (Exception exList) {
                    req.setAttribute("error", "Error al actualizar y al recargar la lista: " + e.getMessage());
                }
                req.getRequestDispatcher("/WEB-INF/Vistas/Socio/ListarSocios.jsp").forward(req, resp);
            }

        }
    }

}
