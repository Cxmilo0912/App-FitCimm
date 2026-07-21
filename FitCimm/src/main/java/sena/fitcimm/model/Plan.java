/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sena.fitcimm.model;

/**
 *
 * @author julil
 */
public class Plan {
    
    private int Id;
    
    private String Nombre;
    
    private int DuracionDias;
    
    private double Valor;
    
    private boolean Activo;

    public Plan() {
    }

    public Plan(String Nombre, int DuracionDias, double Valor, boolean Activo) {
        this.Nombre = Nombre;
        this.DuracionDias = DuracionDias;
        this.Valor = Valor;
        this.Activo = Activo;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public int getDuracionDias() {
        return DuracionDias;
    }

    public void setDuracionDias(int DuracionDias) {
        this.DuracionDias = DuracionDias;
    }

    public double getValor() {
        return Valor;
    }

    public void setValor(double Valor) {
        this.Valor = Valor;
    }

    public boolean isActivo() {
        return Activo;
    }

    public void setActivo(boolean Activo) {
        this.Activo = Activo;
    }
    
    
    
    
}
