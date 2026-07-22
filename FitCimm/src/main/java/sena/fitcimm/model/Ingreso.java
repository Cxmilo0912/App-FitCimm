package sena.fitcimm.model;

import  java.time.*;


public class Ingreso {
    
    private int Id;

    private int IdSocio;

    private LocalDate FechaIngreso;

    private LocalTime HoraIngreso;

    public Ingreso() {
    }

    public Ingreso(LocalDate FechaIngreso, LocalTime HoraIngreso, int IdSocio) {
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

    public LocalDate getFechaIngreso() {
        return FechaIngreso;
    }

    public void setFechaIngreso(LocalDate FechaIngreso) {
        this.FechaIngreso = FechaIngreso;
    }

    public LocalTime getHoraIngreso() {
        return HoraIngreso;
    }

    public void setHoraIngreso(LocalTime HoraIngreso) {
        this.HoraIngreso = HoraIngreso;
    }


}
