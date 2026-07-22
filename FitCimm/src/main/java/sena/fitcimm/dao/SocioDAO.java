/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sena.fitcimm.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import sena.fitcimm.model.*;
import sena.fitcimm.util.ConexionDB;

/**
 *
 * @author julil
 */
public class SocioDAO {

    public List<Socio> MtListar() throws SQLException {
        List<Socio> lista = new ArrayList<>();
        String consulta = "Select * From Socio";

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                lista.add(MtMapear(rs));
            }
        }

        return lista;
    }

    public void MtInsertarSocio(Socio oSocio) throws SQLException {

        String consulta = "INSERT INTO socio (documento, nombres, apellidos, "
                + "telefono, correo, fecha_nacimiento)"
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta)) {

            ps.setString(1, oSocio.getDocumento());
            ps.setString(2, oSocio.getNombres());
            ps.setString(3, oSocio.getApellidos());
            ps.setString(4, oSocio.getTelefono());
            ps.setString(5, oSocio.getCorreo());
            ps.setDate(6, Date.valueOf(oSocio.getFechaNacimiento()));
            ps.executeUpdate();
        }

    }

    public Socio MtBuscarPorDocumento(String documento) throws SQLException {
        String consulta = "Select s.nombres,s.apellidos, DATEDIFF(m.fecha_fin,CURDATE()) AS "
                + "DiasRestantes from socio s inner join membresia m "
                + "ON"
                + "s.id_socio = m.id_socio"
                + " where documento = ? ";

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta)) {

            ps.setString(1, documento);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Socio oSocio = new Socio();
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

    public void MtEditarSocio(Socio oSocio) throws SQLException {
        String consulta = "UPDATE socio SET documento = ?, nombres = ?, apellidos = ?,"
                + "telefono = ?, correo = ?, fecha_nacimiento = ? Where id_socio = ?";

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta)) {
            ps.setString(1, oSocio.getDocumento());
            ps.setString(2, oSocio.getNombres());
            ps.setString(3, oSocio.getApellidos());
            ps.setString(4, oSocio.getTelefono());
            ps.setString(5, oSocio.getCorreo());
            ps.setDate(6, Date.valueOf(oSocio.getFechaNacimiento()));
            ps.setInt(7, oSocio.getId());
            ps.executeUpdate();
        }
    }

    public void MtCambiarEstado(int id, boolean estado) throws SQLException {
        String consulta = "UPDATE socio SET activo = ? Where id_socio = ?";

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta)) {
            ps.setBoolean(1, estado);
            ps.setInt(2, id);
            ps.executeUpdate();
        }
    }

    public boolean MtExisteDocumento(String documento) throws SQLException {

        String consulta = "Select 1 From socio Where documento = ?";

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta)) {

            ps.setString(1, documento);

            try (ResultSet rs = ps.executeQuery();) {
                return rs.next();
            }

        }
    }

    private Socio MtMapear(ResultSet rs) throws SQLException {

        Socio oSocio = new Socio();

        oSocio.setDocumento(rs.getString("documento"));
        oSocio.setNombres(rs.getString("nombres"));
        oSocio.setApellidos(rs.getString("apellidos"));
        oSocio.setTelefono(rs.getString("telefono"));
        oSocio.setCorreo(rs.getString("correo"));
        oSocio.setFechaNacimiento(rs.getObject("fecha_nacimiento", LocalDate.class));

        return oSocio;

    }
}
