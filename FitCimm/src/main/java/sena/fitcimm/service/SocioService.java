/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sena.fitcimm.service;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import sena.fitcimm.dao.*;
import sena.fitcimm.model.*;
import sena.fitcimm.util.FechaUtil;
import sena.fitcimm.util.Validador;
import sena.fitcimm.service.*;

/**
 *
 * @author julil
 */
public class SocioService {

    private SocioDAO oSocioDao = new SocioDAO();

    private MembresiaService oMembresiaService = new MembresiaService();

    public void MtRegistrarSocio(Socio s) throws Exception {

        MtValidarDatos(s);
        if (oSocioDao.MtExisteDocumento(s.getDocumento())) {
            throw new Exception("Ya existe un socio con ese documento");
        }

        oSocioDao.MtInsertarSocio(s);
    }

    public void MtActualizarSocio(Socio s) throws Exception {
        if (s == null || s.getId() <= 0) {
            throw new Exception("Identificador del socio no válido para actualizar su informacion.");
        }

        if (s == null) {
            throw new Exception("Los datos del socio son obligatorios.");
        }

        if (Validador.esVacio(s.getNombres())) {
            throw new Exception("El nombre es obligatorio");
        }
        
        if (!Validador.esNumero(s.getTelefono())) {
            throw new Exception("El telefono debe estar constituido unicamente por números");
        }

        if (!Validador.esEmailValido(s.getCorreo())) {
            throw new Exception("El formato del correo electrónico no es válido");
        }

        int edad = Period.between(s.getFechaNacimiento(), LocalDate.now()).getYears();

        if (edad < 15) {
            throw new Exception("El socio debe ser mayor de 15 años");
        }

        oSocioDao.MtEditarSocio(s);
    }

    public void MtCambiarEstado(int id, boolean estado) throws Exception {

        oSocioDao.MtCambiarEstado(id, estado);
    }

    public List<Map<String, Object>> MtListarSociosConEstado() throws Exception {
        List<Socio> listaSocios = oSocioDao.MtListar();
        List<Map<String, Object>> listaResultado = new ArrayList<>();

        for (Socio socio : listaSocios) {
            Map<String, Object> map = new HashMap<>();
            map.put("Id", socio.getId());
            map.put("nombres", socio.getNombres());
            map.put("apellidos", socio.getApellidos());
            map.put("documento", socio.getDocumento());
            map.put("telefono", socio.getTelefono());
            map.put("email", socio.getCorreo());
            map.put("activo", socio.isActivo());
            map.put("fecha_nacimiento", socio.getFechaNacimiento());

            EstadoMembresia estado = oMembresiaService.MTCalcularEstado(socio.getMembresia());
            map.put("estadoMembresia", estado != null ? estado.name() : "SIN_MEMBRESIA");

            listaResultado.add(map);
        }

        return listaResultado;
    }

    public List<Map<String, Object>> MtHistorialMembresiaSocio(int id) throws Exception {
        List<Map<String, Object>> listaSocios = oSocioDao.MtHistorialMembresiaSocio(id);
        List<Map<String, Object>> listaResultado = new ArrayList<>();

        for (Map<String, Object> socios : listaSocios) {
            Map<String, Object> map = new HashMap<>();
            map.put("nombresSocio", socios.get("nombresSocio"));
            map.put("nombrePlan", socios.get("nombrePlan"));
            Membresia membresia = (Membresia) socios.get("membresiaObjeto");
            map.put("fechaInicio", membresia.getFechaInicio());
            map.put("fechaFin", membresia.getFechaFin());
            map.put("valorPagado", membresia.getValorPagado());
            EstadoMembresia estado = oMembresiaService.MTCalcularEstado(membresia);
            map.put("estadoMembresia", estado != null ? estado.name() : "SIN_MEMBRESIA");

            listaResultado.add(map);
        }
        return listaResultado;
    }

    public List<Socio> MtListarSocios() throws Exception {
        List<Socio> listaSocios = oSocioDao.MtListarSocios();
        return listaSocios;
    }

    private void MtValidarDatos(Socio s) throws Exception {
        if (s == null) {
            throw new Exception("Los datos del socio son obligatorios.");
        }

        if (Validador.esVacio(s.getDocumento())) {
            throw new Exception("El documento es obligatorio");
        }

        if (Validador.esVacio(s.getNombres())) {
            throw new Exception("El nombre es obligatorio");
        }
        if (!Validador.esNumero(s.getDocumento())) {
            throw new Exception("El documento debe estar constituido unicamente por números");
        }

        if (!Validador.esNumero(s.getTelefono())) {
            throw new Exception("El telefono debe estar constituido unicamente por números");
        }

        if (!Validador.esEmailValido(s.getCorreo())) {
            throw new Exception("El formato del correo electrónico no es válido");
        }
        if (!Validador.tieneLongitudValida(s.getDocumento(), 8, 11)) {
            throw new Exception("El documento debe tener una longitud entre 8-11 números");
        }


        int edad = Period.between(s.getFechaNacimiento(), LocalDate.now()).getYears();

        if (edad < 15) {
            throw new Exception("El socio debe ser mayor de 15 años");
        }

    }
}
