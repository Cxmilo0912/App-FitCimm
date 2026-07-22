package sena.fitcimm.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {

    private static final String url = "jdbc:mysql://localhost:3306/fitcimm?useSSL=false&serverTimezone=America/Bogota&characterEncoding=UTF-8";
    private static final String user = "root";
    private static final String password = "";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Driver MySQL no encontrado", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }
}
