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
import sena.fitcimm.model.Plan;
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
            ps.executeUpdate();

        }

    }

  public List<Socio> MtListarMembresias() throws SQLException {
    List<Socio> lista = new ArrayList<>();
    String consulta = "SELECT s.id_socio,s.documento, s.nombres, s.apellidos, m.fecha_fin, p.nombre "
        + "FROM socio s "
        + "INNER JOIN membresia m ON s.id_socio = m.id_socio "
        + "INNER JOIN plan p ON m.id_plan = p.id_plan "
        + "INNER JOIN ("
        + "    SELECT id_socio, MAX(fecha_fin) AS max_fin "
        + "    FROM membresia "
        + "    GROUP BY id_socio"
        + ") ultima ON m.id_socio = ultima.id_socio AND m.fecha_fin = ultima.max_fin";

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

        Membresia oMembresia = new Membresia();
        
        oMembresia.setFechaFin(rs.getObject("fecha_fin", LocalDate.class));
        
        Plan oplan = new Plan();
        oplan.setNombre(rs.getString("nombre"));
        oMembresia.setPlan(oplan);  
        
        
        oSocio.setMembresia(oMembresia);

        return oSocio;
    }

}
