/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.dao;

import Modelo.bean.Categoria;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author fabri
 */
public class CategoriaDAO {

    public static ArrayList<Categoria> listarProducto() {
        System.out.println("llegue 1");
        String sql = "select * from categoria";
        ArrayList<Categoria> lista = new ArrayList();
        Categoria categ = null;
        Connection cn = Coneccion.coneccion.Abrir();
        System.out.println("llegue 2");
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                categ = new Categoria();
                categ.setIdCategoria(rs.getInt("id_categoria"));
                categ.setNameCategoria(rs.getString("nomb_categoria"));
                categ.setFotoCategoria(rs.getString("foto_categoria"));
                lista.add(categ);
            }
            return lista;
        } catch (Exception e) {
            System.out.println("eror"+e);
            return null;
            
        }
    }
    
    public static Categoria datosCategoria(int id) {
        String sql = "select * from categoria where id_categoria=?";
        Categoria categ = null;
        Connection cn = Coneccion.coneccion.Abrir();
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                categ = new Categoria();
                categ.setIdCategoria(rs.getInt("id_categoria"));
                categ.setNameCategoria(rs.getString("nomb_categoria"));
                categ.setFotoCategoria(rs.getString("foto_categoria"));
            }
            return categ;
        } catch (Exception e) {
            return null;
            
        }
    }
}
