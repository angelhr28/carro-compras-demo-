/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.dao;

import Modelo.bean.*;
import java.sql.*;
import java.util.ArrayList;


public class ProductoDAO {
    
    public static ArrayList<Producto> listarProducto(){
        String sql=" select * from producto ";
        ArrayList <Producto> lista = new ArrayList();
        Producto prod = null;
        Connection cn = Coneccion.coneccion.Abrir();        
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();   
            while(rs.next()){
            prod = new Producto();
            prod.setId_producto(rs.getInt("id_producto"));
            prod.setId_categoria(rs.getInt("id_categoria"));
            prod.setNomb_producto(rs.getString("nomb_producto"));
            prod.setDesc_producto(rs.getString("desc_producto"));
            prod.setPrecio_producto(rs.getDouble("precio_producto"));
            prod.setImg_producto(rs.getString("img_producto"));
            prod.setCarac_producto(rs.getString("caract_producto"));
                lista.add(prod);            
            }
            return lista;
        } catch (Exception e) {
            return null;
        } 
    }
    
    
     public static ArrayList<Producto> listarProductoIdCategoria(int id){
        String sql=" select * from producto where id_categoria = ?";
        ArrayList <Producto> lista = new ArrayList();
        Producto prod = null;
        Connection cn = Coneccion.coneccion.Abrir();        
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();            
            while(rs.next()){
            prod = new Producto();
            prod.setId_producto(rs.getInt("id_producto"));
            prod.setId_categoria(rs.getInt("id_categoria"));
            prod.setNomb_producto(rs.getString("nomb_producto"));
            prod.setDesc_producto(rs.getString("desc_producto"));
            prod.setPrecio_producto(rs.getDouble("precio_producto"));
            prod.setImg_producto(rs.getString("img_producto"));
            prod.setCarac_producto(rs.getString("caract_producto"));
                System.out.println(prod.getNomb_producto());
                lista.add(prod);            
            }
            return lista;
        } catch (Exception e) {
            return null;
        } 
    }
     
    public static Producto productoSelect(int idProducto) {
        String sql = "select * from producto where id_producto =?";
        Producto prod = null;
        Connection cn = Coneccion.coneccion.Abrir();
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, idProducto);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                prod = new Producto();
                prod.setId_producto(rs.getInt("id_producto"));
                prod.setId_categoria(rs.getInt("id_categoria"));
                prod.setNomb_producto(rs.getString("nomb_producto"));
                prod.setDesc_producto(rs.getString("desc_producto"));
                prod.setPrecio_producto(rs.getDouble("precio_producto"));
                prod.setImg_producto(rs.getString("img_producto"));
                prod.setCarac_producto(rs.getString("caract_producto"));
            }
            return prod;
        } catch (Exception e) {
            return null;
        }
    }
    
    
    
}
