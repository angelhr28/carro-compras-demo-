/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Coneccion;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
/**
 *
 * @author hp
 */
public class coneccion {
    
    public static String url = "jdbc:mysql://localhost/prueba2";
    public static String user = "root";
    public static String paswd = "";
    public static Connection cn;
    public static Connection Abrir() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(url, user, paswd);
            return cn;
        } catch (Exception e) {
            System.out.println("error conexion"+e);
            return null;
        }
    }
    
    
}
