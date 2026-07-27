/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sena.fitcimm.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import sena.fitcimm.dao.MembresiaDAO;
import sena.fitcimm.model.*;

/**
 *
 * @author julil
 */
public class MembresiaService {

    private MembresiaDAO dao = new MembresiaDAO();

    public void MtVender(int idSocio, Plan plan, double valor, LocalDate fechaInicio) throws Exception {

        List<Socio> listaMembresias = dao.MtListarMembresias();

        EstadoMembresia estado = null;

        for (Socio socio : listaMembresias) {
            if (socio.getId() == idSocio && socio.getMembresia() != null) {
                estado = MTCalcularEstado(socio.getMembresia());
                break;
            }
        }

        if (estado != null) {
            if (estado == EstadoMembresia.VIGENTE || estado == EstadoMembresia.POR_VENCER) {
                throw new Exception("¡Alerta! El socio ya cuenta con una membresía " + estado + ". No se puede registrar otra hasta que finalice.");
            } else if (estado == EstadoMembresia.VENCIDA) {
                throw new Exception("¡Alerta! El socio ya cuenta con una membresía " + estado + "Renueve la membresia actual.");
            }
        }

        LocalDate inicio = fechaInicio;
        LocalDate fin = inicio.plusDays(plan.getDuracionDias());
        Membresia oMembresia = new Membresia();
        oMembresia.setIdSocio(idSocio);
        oMembresia.setIdPlan(plan.getId());
        oMembresia.setFechaFin(fin);
        oMembresia.setFechaInicio(inicio);
        oMembresia.setValorPagado(valor);
        dao.MtInsertarMembresia(oMembresia);

    }

    public void MtRenovar(int idSocio, Plan plan, double valor, LocalDate fechaInicio) throws Exception {

        List<Socio> listaMembresias = dao.MtListarMembresias();

        EstadoMembresia estado = null;

        for (Socio socio : listaMembresias) {
            if (socio.getId() == idSocio && socio.getMembresia() != null) {
                estado = MTCalcularEstado(socio.getMembresia());
                break;
            }
        }

        if (estado != null) {
            if (estado == EstadoMembresia.VIGENTE || estado == EstadoMembresia.POR_VENCER) {
                throw new Exception("¡Alerta! El socio ya cuenta con una membresía " + estado + ". No se puede registrar otra hasta que finalice.");
            } else {
                LocalDate inicio = fechaInicio;
                LocalDate fin = inicio.plusDays(plan.getDuracionDias());
                Membresia oMembresia = new Membresia();
                oMembresia.setIdSocio(idSocio);
                oMembresia.setIdPlan(plan.getId());
                oMembresia.setFechaFin(fin);
                oMembresia.setFechaInicio(inicio);
                oMembresia.setValorPagado(valor);
                dao.MtInsertarMembresia(oMembresia);
            }
        }

    }

    public List<Map<String, Object>> MtListarMembresias() throws Exception {
        List<Socio> lista = dao.MtListarMembresias();
        List<Map<String, Object>> listaResultado = new ArrayList<>();

        for (Socio item : lista) {
            Map<String, Object> map = new HashMap<>();
            map.put("id", item.getId());
            map.put("nombres", item.getNombres());
            map.put("apellidos", item.getApellidos());
            map.put("documento", item.getDocumento());
            map.put("plan", item.getMembresia().getPlan().getNombre());
            map.put("fechaFin", item.getMembresia().getFechaFin());

            EstadoMembresia estado = MTCalcularEstado(item.getMembresia());
            map.put("estadoMembresia", estado != null ? estado.name() : "VENCIDA");
            listaResultado.add(map);
        }
        return listaResultado;
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

}
