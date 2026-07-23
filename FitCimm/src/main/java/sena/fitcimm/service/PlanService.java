/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sena.fitcimm.service;

import java.time.LocalDate;
import java.util.List;
import sena.fitcimm.dao.PlanDAO;
import sena.fitcimm.model.Plan;

/**
 *
 * @author julil
 */
public class PlanService {
    
    private PlanDAO dao = new PlanDAO();
    
    public void MtRegistarPlan(Plan oPlan) throws Exception{
        
        if(oPlan.getNombre() == null || oPlan.getNombre().trim().isEmpty()){
            throw new Exception("El nombre del plan no puede estar vacio");
        }
        
        if(oPlan.getDuracionDias() <= 0){
            throw new Exception("La duracion tiene que ser mayor a 0");
        }
        
        if(oPlan.getValor() < 0){
            throw new Exception("El valor del plan tiene que ser mayor a 0 ");
        }
        
        dao.MtInsertarPlan(oPlan);
    }
    
    public void MtEditarPlan(Plan oPlan) throws Exception{
       dao.MtEditarPlan(oPlan);
    }
    
    public void MtIntivarPlan(Plan oPlan) throws Exception{
        dao.MtInactivarPlan(oPlan);
    }
    
    public double MtTotalRecaudo(LocalDate fecha1, LocalDate fecha2) throws Exception {
        return dao.MtTotalRecaudado(fecha1,fecha2);
    }
    
     public String MtMasVendido() throws Exception {
     return dao.MtMasVendido();
     }
     
     public List<Plan> MtListarPlanes() throws Exception {
         return dao.MtListarPlanes();
     }
}
