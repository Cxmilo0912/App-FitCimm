/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sena.fitcimm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import sena.fitcimm.model.Plan;
import sena.fitcimm.util.ConexionDB;

/**
 *
 * @author julil
 */
public class PlanDAO {

    public void MtInsertarPlan(Plan oPlan) throws SQLException {
        String consulta = "Insert into plan (nombre,duracion_dias,valor) Values (?,?,?)";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {
            ps.setString(1, oPlan.getNombre());
            ps.setInt(2, oPlan.getDuracionDias());
            ps.setDouble(3, oPlan.getValor());
            ps.executeUpdate();

        }

    }

    public void MtEditarPlan(Plan oPlan) throws SQLException {
        String consulta = "Update plan set nombre=?,duracion_dias=?,valor=? where id_plan=?";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta);) {
            ps.setString(1, oPlan.getNombre());
            ps.setInt(2, oPlan.getDuracionDias());
            ps.setDouble(3, oPlan.getValor());

            ps.setInt(4, oPlan.getId());
            ps.executeUpdate();

        }

    }

    public void MtInactivarPlan(boolean estado,int id) throws SQLException {
        String consulta = "Update plan set activo=? where id_plan=?";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {
            ps.setBoolean(1, estado);
            ps.setInt(2, id);
            ps.executeUpdate();

        }

    }

    public double MtTotalRecaudado(LocalDate fecha1, LocalDate fecha2) throws SQLException {
        String consulta = "SELECT p.nombre, SUM(m.valor_pagado) AS recaudado"
                + " FROM plan p "
                + " INNER JOIN membresia m ON m.id_plan = p.id_plan"
                + " WHERE m.fecha_inicio BETWEEN ? AND ?"
                + " GROUP BY p.nombre";
        double total = 0;
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {
            ps.setObject(1, fecha1);
            ps.setObject(2, fecha2);
         
            try(ResultSet rs = ps.executeQuery()){
                if(rs.next()){
                    total = rs.getDouble("recaudado");
                }
            }
            return total;
        }

    }

    public String MtMasVendido() throws SQLException {
        String consulta = "SELECT p.nombre, COUNT(m.id_membresia) AS total_vendidos "
                + "FROM plan p "
                + "INNER JOIN membresia m ON m.id_plan = p.id_plan "
                + "WHERE MONTH(m.fecha_inicio) = MONTH(CURDATE()) "
                + "AND YEAR(m.fecha_inicio) = YEAR(CURDATE()) "
                + "GROUP BY p.nombre "
                + "ORDER BY total_vendidos DESC "
                + "LIMIT 1";
        String Plan = "Sin Ventas";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta);
           

            ResultSet rs = ps.executeQuery()){
              if(rs.next()){
                    Plan = rs.getString("nombre");
                }
        }
        return Plan;
        

    }

    public List<Plan> MtListarPlanes() throws Exception {
        List<Plan> lista = new ArrayList<>();
        String consulta = "Select * from plan";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                lista.add(MtMapear(rs));
            }
        }
        return lista;
    }

    public Plan MtMapear(ResultSet rs) throws SQLException {
        Plan oPlan = new Plan();
        oPlan.setId(rs.getInt("id_plan"));
        oPlan.setNombre(rs.getString("nombre"));
        oPlan.setDuracionDias(rs.getInt("duracion_dias"));
        oPlan.setValor(rs.getDouble("valor"));
        oPlan.setActivo(rs.getBoolean("activo"));
        return oPlan;
    }

}
