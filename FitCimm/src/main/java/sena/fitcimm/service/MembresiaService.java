/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sena.fitcimm.service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import sena.fitcimm.dao.MembresiaDAO;
import sena.fitcimm.model.*;

/**
 *
 * @author julil
 */
public class MembresiaService {
    
    private MembresiaDAO dao = new MembresiaDAO();
    
    
    public Membresia MtVender(int idSocio, Plan plan,double valor) throws Exception { 
        LocalDate inicio = LocalDate.now(); 
        LocalDate fin = inicio.plusDays(plan.getDuracionDias()); 
        Membresia oMembresia = new Membresia();
        oMembresia.setIdSocio(idSocio);
        oMembresia.setIdPlan(plan.getId());
        oMembresia.setFechaFin(fin);
        oMembresia.setFechaInicio(inicio);
        oMembresia.setValorPagado(valor);
        dao.MtInsertarMembresia(oMembresia);
        
        return oMembresia;
       
    } 
    
     public EstadoMembresia MTCalcularEstado(Membresia m) { 
        LocalDate hoy = LocalDate.now(); 
        if (m.getFechaFin().isBefore(hoy)) { 
            return EstadoMembresia.VENCIDA; 
        } 
        long dias = ChronoUnit.DAYS.between(hoy, m.getFechaFin()); 
        if (dias <= 5) { 
            return EstadoMembresia.POR_VENCER; 
        } 
        return EstadoMembresia.VIGENTE; 
    }
     
     public List<Socio> MtListarMembresiasVigentes() throws Exception {
    return dao.MtListarMembresiasVigentes();
     }
}
