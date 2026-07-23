/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sena.fitcimm.service;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import sena.fitcimm.dao.*;
import sena.fitcimm.model.*;
import sena.fitcimm.util.Validador;

/**
 *
 * @author julil
 */
public class SocioService {

    private SocioDAO oSocioDao = new SocioDAO();

    public void MtRegistrarSocio(Socio s) throws Exception {

        
        MtValidarDatos(s);
        if (oSocioDao.MtExisteDocumento(s.getDocumento())) {
            throw new Exception("Ya existe un socio con ese documento");
        }

        oSocioDao.MtInsertarSocio(s);
    }
    
    public void MtActualizarSocio(Socio s) throws Exception{
        if (s == null || s.getId() <= 0) {
            throw new Exception("Identificador del socio no válido para actualizar su informacion.");
        }
        
        MtValidarDatos(s);
        
        oSocioDao.MtEditarSocio(s);
    }
    
    public void MtCambiarEstado(int id, boolean estado) throws Exception{
        
        oSocioDao.MtCambiarEstado(id, estado);
    }

    private void MtValidarDatos(Socio s) throws Exception {
        if (s != null) {
            throw new Exception("Los datos del socio son obligatorios.");
        }

        if (Validador.esVacio(s.getDocumento())) {
            throw new Exception("El documento es obligatorio");
        }

        if (Validador.esVacio(s.getNombres())) {
            throw new Exception("El noombre son obligatorios");
        }
        if (Validador.esNumero(s.getDocumento())) {
            throw new Exception("El documento debe estar constituido unicamente por números");
        }

        if (Validador.esEmailValido(s.getCorreo())) {
            throw new Exception("El formato del correo electrónico no es válido");
        }

        int edad = Period.between(s.getFechaNacimiento(), LocalDate.now()).getYears();

        if (edad < 15) {
            throw new Exception("El socio debe ser mayor de 15 años");
        }

    }
}
