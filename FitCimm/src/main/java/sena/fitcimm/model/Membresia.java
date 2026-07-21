/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sena.fitcimm.model;

import java.sql.Date;

/**
 *
 * @author julil
 */
public class Membresia {

    private int Id;

    private int IdSocio;

    private int IdPlan;

    private Date FechaInicio;

    private Date FechaFin;

    private double ValorPagado;

    public Membresia() {
    }

    public Membresia(int Id, int IdSocio, int IdPlan, Date FechaInicio, Date FechaFin, double ValorPagado) {
        this.Id = Id;
        this.IdSocio = IdSocio;
        this.IdPlan = IdPlan;
        this.FechaInicio = FechaInicio;
        this.FechaFin = FechaFin;
        this.ValorPagado = ValorPagado;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public int getIdSocio() {
        return IdSocio;
    }

    public void setIdSocio(int IdSocio) {
        this.IdSocio = IdSocio;
    }

    public int getIdPlan() {
        return IdPlan;
    }

    public void setIdPlan(int IdPlan) {
        this.IdPlan = IdPlan;
    }

    public Date getFechaInicio() {
        return FechaInicio;
    }

    public void setFechaInicio(Date FechaInicio) {
        this.FechaInicio = FechaInicio;
    }

    public Date getFechaFin() {
        return FechaFin;
    }

    public void setFechaFin(Date FechaFin) {
        this.FechaFin = FechaFin;
    }

    public double getValorPagado() {
        return ValorPagado;
    }

    public void setValorPagado(double ValorPagado) {
        this.ValorPagado = ValorPagado;
    }

}
