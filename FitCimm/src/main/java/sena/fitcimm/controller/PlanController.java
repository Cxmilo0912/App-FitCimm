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
import sena.fitcimm.model.Plan;
import sena.fitcimm.service.PlanService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PlanController",urlPatterns = {"/PlanController"})
public class PlanController extends HttpServlet{
    
    private PlanService oService = new PlanService();
    
    @Override
    protected void doGet(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        try{
        if("reportes".equals(accion)){
        request.getRequestDispatcher("WEB-INF/Vistas/Plan/Reportes.jsp").forward(request, response);
        }
        else if("gestion".equals(accion)){
            
           List<Plan> listaPlanes = oService.MtListarPlanes();
           request.setAttribute("planes", listaPlanes);
           request.getRequestDispatcher("WEB-INF/Vistas/Plan/GestionPlanes.jsp").forward(request, response);
        }
            
        else{
        request.getRequestDispatcher("WEB-INF/Vistas/Plan/NuevoPlan.jsp").forward(request, response);
        }
        }catch(Exception e){
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("WEB-INF/Vistas/Plan/GestionPlanes.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response)
    throws ServletException,IOException
    {
       String accion = request.getParameter("accion");
       if (accion == null){
           accion = "registrar";
       }
       try{
        if(accion.equals("registrar")){
        Plan oplan = new Plan();
        oplan.setNombre(request.getParameter("plan_name"));
        oplan.setDuracionDias(Integer.parseInt(request.getParameter("plan_duration")));
        oplan.setValor(Double.parseDouble(request.getParameter("plan_value")));
      
        PlanService oService = new PlanService();
        oService.MtRegistarPlan(oplan);
        }
        else if(accion.equals("actualizar")){
             Plan oplan = new Plan();
        oplan.setId(Integer.parseInt(request.getParameter("id")));
        oplan.setNombre(request.getParameter("plan_name"));
        oplan.setDuracionDias(Integer.parseInt(request.getParameter("plan_duration")));
        oplan.setValor(Double.parseDouble(request.getParameter("plan_value")));
        PlanService oService = new PlanService();
        oService.MtEditarPlan(oplan);
        }
        else if(accion.equals("inactivar")){
            int id = Integer.parseInt(request.getParameter("id"));
            
              PlanService oService = new PlanService();
              oService.MtInativarPlan(false, id);
        
        }
        
         response.sendRedirect(request.getContextPath() + "/PlanController?accion=gestion");
       }catch(Exception e){
           request.setAttribute("error", e.getMessage());
            response.sendRedirect(request.getContextPath() + "/PlanController?accion=gestion");
       }
       
                
    }
            
    
}
