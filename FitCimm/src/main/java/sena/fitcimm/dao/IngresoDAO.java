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

    private Ingreso MtMapear(ResultSet rs) throws SQLException {
        Ingreso oIngreso = new Ingreso();

        oIngreso.setId(rs.getInt("id_ingreso"));
        oIngreso.setIdSocio(rs.getInt("id_socio"));
        oIngreso.setFechaIngreso(rs.getObject("fecha_ingreso", LocalDate.class));
        oIngreso.setHoraIngreso(rs.getObject("hora_ingreso", LocalTime.class));

        return oIngreso;
    }
}
