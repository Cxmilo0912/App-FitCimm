/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sena.fitcimm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sena.fitcimm.model.*;
import java.time.*;
import java.util.*;
import sena.fitcimm.util.ConexionDB;

/**
 *
 * @author julil
 */
public class IngresoDAO {

    public void MtRegistrarIngreso(Ingreso oIngreso) throws SQLException {
        String consulta = "Insert Into ingreso (id_socio, fecha_ingreso, hora_ingreso)"
                + "VALUES (?, CURDATE(), CURTIME())";

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta)) {
            ps.setInt(1, oIngreso.getIdSocio());
            ps.executeUpdate();
        }
    }

    public Socio MtConsultarIngresoPorDocumento(String documento) throws SQLException {
        String consulta = "SELECT s.id_socio, s.nombres, s.apellidos, m.fecha_fin "
                + "FROM socio s "
                + "INNER JOIN membresia m ON s.id_socio = m.id_socio "
                + "WHERE s.documento = ? "
                + "ORDER BY m.fecha_fin DESC "
                + "LIMIT 1";

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta)) {

            ps.setString(1, documento);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Socio oSocio = new Socio();
                    oSocio.setId(rs.getInt("id_socio"));
                    oSocio.setNombres(rs.getString("nombres"));

                    Membresia oMembresia = new Membresia();
                    oMembresia.setFechaFin(rs.getObject("fecha_fin", LocalDate.class));

                    oSocio.setMembresia(oMembresia);

                    return oSocio;
                }
            }
        }

        return null;
    }

    public List<Ingreso> MtListarIngresosPorFecha(LocalDate fecha) throws SQLException {
        List<Ingreso> lista = new ArrayList<>();
        String consulta = "SELECT * FROM ingreso WHERE fecha_ingreso = ?";

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta)) {

            ps.setObject(1, fecha);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    lista.add(MtMapear(rs));
                }
            }
        }

        return lista;
    }
    
    public boolean MtYaIngreso(int idSocio) throws SQLException{
        String consulta = "Select Count(*) From ingreso Where id_socio = ? and fecha_ingreso = CURDATE()";
        
        try(Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta)){
            
            ps.setInt(1, idSocio);
            
            try(ResultSet rs = ps.executeQuery()){
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        
        return false;
    }

    private Ingreso MtMapear(ResultSet rs) throws SQLException {
        Ingreso oIngreso = new Ingreso();

        oIngreso.setId(rs.getInt("id_ingreso"));
        oIngreso.setIdSocio(rs.getInt("id_socio"));
        oIngreso.setFechaIngreso(rs.getObject("fecha_ingreso", LocalDate.class));
        oIngreso.setHoraIngreso(rs.getObject("hora_ingreso", LocalTime.class));

        return oIngreso;
    }
}
