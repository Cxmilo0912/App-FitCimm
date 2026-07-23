/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sena.fitcimm.util;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

/**
 *
 * @author Admin
 */
public class FechaUtil {
      public static long diasRestantes(LocalDate fin) { 
        return ChronoUnit.DAYS.between(LocalDate.now(), fin); 
      }
}
