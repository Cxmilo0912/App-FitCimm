package sena.fitcimm.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import sena.fitcimm.model.Membresia;
import sena.fitcimm.model.Socio;
import sena.fitcimm.util.ConexionDB;

public class MembresiaDAO {

    public void MtInsertarMembresia(Membresia oMembresia) throws SQLException {
        String consulta = "Insert into membresia (id_socio,id_plan,fecha_inicio,fecha_fin,valor_pagado)"
                + "Values (?,?,?,?,?)";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {
            ps.setInt(1, oMembresia.getIdSocio());
            ps.setInt(2, oMembresia.getIdPlan());
            ps.setDate(3, Date.valueOf(oMembresia.getFechaInicio()));
            ps.setDate(4, Date.valueOf(oMembresia.getFechaFin()));
            ps.setDouble(5, oMembresia.getValorPagado());

        }

    }

    public List<Socio> MtListarMembresiasVigentes() throws SQLException {
        List<Socio> lista = new ArrayList<>();
        String consulta = "SELECT s.*, m.id_membresia, m.id_plan, m.fecha_inicio, m.fecha_fin, m.valor_pagado, "
                + "FROM socio s "
                + "INNER JOIN membresia m ON s.id_socio = m.id_socio "
                + "WHERE s.activo = 1 AND m.fecha_fin >= CURDATE()";

        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                lista.add(MtMapear(rs));
            }

        }
        return lista;

    }

    private Socio MtMapear(ResultSet rs) throws SQLException {

        Socio oSocio = new Socio();

        oSocio.setId(rs.getInt("id_socio"));
        oSocio.setDocumento(rs.getString("documento"));
        oSocio.setNombres(rs.getString("nombres"));
        oSocio.setApellidos(rs.getString("apellidos"));
        oSocio.setTelefono(rs.getString("telefono"));
        oSocio.setCorreo(rs.getString("correo"));
        oSocio.setFechaNacimiento(rs.getObject("fecha_nacimiento", LocalDate.class));

        Membresia oMembresia = new Membresia();

        oMembresia.setId(rs.getInt("id_membresia"));
        oMembresia.setIdSocio(rs.getInt("id_socio"));
        oMembresia.setIdPlan(rs.getInt("id_plan"));
        oMembresia.setFechaInicio(rs.getObject("fecha_inicio", LocalDate.class));
        oMembresia.setFechaFin(rs.getObject("fecha_fin", LocalDate.class));
        oMembresia.setValorPagado(rs.getDouble("valor_pagado"));
        
        oSocio.setMembresia(oMembresia);

        return oSocio;
    }

}
