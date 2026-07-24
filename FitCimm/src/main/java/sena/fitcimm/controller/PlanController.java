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
import sena.fitcimm.model.Plan;
import sena.fitcimm.service.PlanService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PlanController",urlPatterns = {"/PlanController"})
public class PlanController extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        if("reportes".equals(accion)){
        request.getRequestDispatcher("WEB-INF/Vistas/Plan/Reportes.jsp").forward(request, response);
        }
        else if("gestion".equals(accion)){
           request.getRequestDispatcher("WEB-INF/Vistas/Plan/GestionPlanes.jsp").forward(request, response);
        }
                
        else{
        request.getRequestDispatcher("WEB-INF/Vistas/Plan/NuevoPlan.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response)
    throws ServletException,IOException
    {
       try{
        Plan oplan = new Plan();
        oplan.setNombre(request.getParameter("plan_name"));
        oplan.setDuracionDias(Integer.parseInt(request.getParameter("plan_duration")));
        oplan.setValor(Double.parseDouble(request.getParameter("plan_value")));
      
        PlanService oService = new PlanService();
        oService.MtRegistarPlan(oplan);
         request.getRequestDispatcher("WEB-INF/Vistas/Plan/GestionPlanes.jsp").forward(request, response);
       }catch(Exception e){
           request.setAttribute("error", e.getMessage());
           request.getRequestDispatcher("WEB-INF/Vistas/Plan/GestionPlanes.jsp").forward(request, response);
       }
       
                
    }
            
    
}
