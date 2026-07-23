/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sena.fitcimm.service;

import java.util.HashMap;
import java.util.Map;
import sena.fitcimm.dao.IngresoDAO;
import sena.fitcimm.model.Ingreso;
import sena.fitcimm.model.Socio;
import sena.fitcimm.util.FechaUtil;
import sena.fitcimm.util.Validador;
import sena.fitcimm.service.MembresiaService;
import sena.fitcimm.model.EstadoMembresia;

/**
 *
 * @author julil
 */
public class IngresoService {

    private IngresoDAO oIngresoDAO = new IngresoDAO();
    private MembresiaService oMembresiaService = new MembresiaService();

    public Map<String, Object> MtRegistrarIngreso(String documento, Ingreso oIngreso) throws Exception {

        //Documento Vacio
        if (Validador.esVacio(documento)) {
            throw new Exception("El número de documento es obligatorio.");
        }

        Socio oSocio = oIngresoDAO.MtConsultarIngresoPorDocumento(documento);

        //Socio inexistente o sin membresia registrada
        if (oSocio == null || oSocio.getMembresia() == null) {
            throw new Exception("El socio no existe o no tiene una membresía registrada.");
        }
        
        //Verificar Socio activo
        if (!oSocio.isActivo()) {
            throw new Exception("El socio no puede ingresar debido a que se encuentra inactivo");
        }

        //Verificar Membresia vencida
        EstadoMembresia estado = oMembresiaService.MTCalcularEstado(oSocio.getMembresia());
        if (estado == EstadoMembresia.VENCIDA) {
            throw new Exception("El socio no puede ingresar debido a que su membresia esta vencida");
        }


        //Verificar si ya ingreso el dia de hoy
        if (oIngresoDAO.MtYaIngreso(oSocio.getId())) {
            throw new Exception("Acceso denegado: El socio " + oSocio.getNombres() + " ya tiene registrado un ingreso el dia de hoy");
        }

        //Calcular los dias restantes de la membresia del socio
        long diasRestantes = FechaUtil.diasRestantes(oSocio.getMembresia().getFechaFin());


        //Registrar el Ingreso
        if (oIngreso == null) {
            oIngreso = new Ingreso();
        }
        oIngreso.setIdSocio(oSocio.getId());
        oIngresoDAO.MtRegistrarIngreso(oIngreso);

        Map<String, Object> resultado = new HashMap<>();
        resultado.put("nombres", oSocio.getNombres());
        resultado.put("diasRestantes", diasRestantes);
        resultado.put("socio", oSocio);

        return resultado;

    }

}
