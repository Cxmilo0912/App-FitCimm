package sena.fitcimm.model;

import  java.sql.Date;
import java.sql.Time;


public class Ingreso {
    
    private int Id;

    private int IdSocio;

    private Date FechaIngreso;

    private Time HoraIngreso;

    public Ingreso() {
    }

    public Ingreso(Date FechaIngreso, Time HoraIngreso, int IdSocio) {
        this.FechaIngreso = FechaIngreso;
        this.HoraIngreso = HoraIngreso;
        this.IdSocio = IdSocio;
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

    public Date getFechaIngreso() {
        return FechaIngreso;
    }

    public void setFechaIngreso(Date FechaIngreso) {
        this.FechaIngreso = FechaIngreso;
    }

    public Time getHoraIngreso() {
        return HoraIngreso;
    }

    public void setHoraIngreso(Time HoraIngreso) {
        this.HoraIngreso = HoraIngreso;
    }


}
