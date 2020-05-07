/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.dao;

import Modelo.bean.Pedidos;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author fabri
 */
public class PedidoDAO {
    public static void insertarPedido1(int id_u,int id_p,int cant){            
        try {
            String sql="call insertarPedido(?,?,?,@total)";
            Connection cn = Coneccion.coneccion.Abrir();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id_u);
            pst.setInt(2, id_p);
            pst.setInt(3, cant);
            pst.executeUpdate();
            cn.close();
            pst.close();
            
        } catch (Exception e) {
            System.out.println("error insertar pedido " + e);
        }        
    }
    
    public static void insertarPedido2(int id_p,int id_pu,int cant){            
        try {
            String sql="call insertarPedido2(?,?,?)";
            Connection cn = Coneccion.coneccion.Abrir();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id_p);
            pst.setInt(2, id_pu);
            pst.setInt(3, cant);
            pst.executeUpdate();
            cn.close();
            pst.close();
            
        } catch (Exception e) {
        }        
    }
    
    public static int cantidadPedido(int id_u){
        
        try {
            int cantPed=0;
            String sql="select count(id_usuario) from pedido_usuario WHERE id_usuario=? AND flg_pedido = 'N'";
            Connection cn = Coneccion.coneccion.Abrir();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id_u);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                cantPed = rs.getInt("count(id_usuario)");
            }
            cn.close();
            pst.close();
            return cantPed;
        } catch (Exception e) {
            return 0;
        }
    
    }
    
    public static ArrayList<Pedidos> listarPedidosByUser(int idUser){
        String sql="SELECT pd.id_producto AS id,\n" +
                    "	pd.nomb_producto AS nom,\n" +
                    "    pd.caract_producto AS caract,\n" +
                    "    pd.img_producto AS img,\n" +
                    "    FORMAT(pd.precio_producto,2) AS precio,\n" +
                    "    pap.cantidad AS cant \n" +
                    "FROM producto pd,\n" +
                    "	 pedido_usuario pu,\n" +
                    "	 pedidousuario_and_producto pap\n" +
                    "WHERE pu.id_usuario = ? \n" +
                    "  AND pu.flg_pedido = 'N'\n" +
                    "  AND pu.id_pedidoUsuario = pap.id_pedidoUsuario\n" +
                    "  AND pap.id_producto = pd.id_producto ";
        ArrayList <Pedidos> lista = new ArrayList();
        Pedidos ped = null;
        Connection cn = Coneccion.coneccion.Abrir();        
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, idUser);
            ResultSet rs = pst.executeQuery();   
            while(rs.next()){
                ped = new Pedidos();
                ped.setIdProducto(rs.getInt("id"));
                ped.setNomProducto(rs.getString("nom"));
                ped.setCaractProducto(rs.getString("caract"));
                ped.setImgProducto(rs.getString("img"));
                ped.setPrecioProducto(rs.getDouble("precio"));
                ped.setCantProducto(rs.getInt("cant"));
                lista.add(ped);            
            }
            return lista;
        } catch (Exception e) {
            System.out.println("NO RETORNO NADA :::: " + e);
            return null;
        } 
    }
     public static void editarCantidad(int cant, int id_p,int id_u){
        
        try {
            String sql="update pedidousuario_and_producto pap,pedido_usuario pu ,producto p\n" +
                            "set pap.cantidad = ? , pu.precio_total_pedido = (p.precio_producto*?)\n" +
                            "where \n" +
                            "pap.id_pedidoUsuario= pu.id_pedidoUsuario and \n" +
                            "pap.id_producto = p.id_producto and\n" +
                            "pap.id_producto = ? and \n" +
                            "pu.id_usuario = ? ";
            Connection cn = Coneccion.coneccion.Abrir();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, cant);
            pst.setInt(2, cant);
            pst.setInt(3, id_p);
            pst.setInt(4, id_u);
            pst.executeUpdate();
            cn.close();
            pst.close();
        } catch (Exception e) {
            
        }
    }
    public static void eliminarPedido(int id_u,int id_p){
        
        try {
            String sql="DELETE pp, pu \n" +
                        "from pedidousuario_and_producto AS pp JOIN\n" +
                        "pedido_usuario AS pu \n" +
                        "ON(  pu.id_pedidoUsuario = pp.id_pedidoUsuario  \n" +
                        "AND pp.id_producto = ? \n" +
                        "and pu.id_usuario = ? )";
            Connection cn = Coneccion.coneccion.Abrir();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id_p);
            pst.setInt(2, id_u);
           
            pst.executeUpdate();
            cn.close();
            pst.close();
        } catch (Exception e) {
        }
    
    }
    
    public static boolean validador(int id_p,int id_u){
        ArrayList<Integer> listaId_producto = new ArrayList();
        System.out.println("datos enviados :::  " + id_p +  " " + id_u);
        try {
            String sql ="select pap.id_producto \n" +
            "from pedido_usuario pu,pedidousuario_and_producto pap\n" +
            "WHERE pu.id_usuario=? AND pu.id_pedidoUsuario = pap.id_pedidoUsuario and \n"
                    + "pap.id_producto = ? AND pu.flg_pedido = 'N'";
            Connection cn = Coneccion.coneccion.Abrir();            
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id_u);
            pst.setInt(2, id_p);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                System.out.println("a");
                listaId_producto.add(rs.getInt("id_producto")); 
                System.out.println("llego esto " + rs.getInt("id_producto"));
             }            
        } catch (Exception e) {
            System.out.println("entro al error ::: " + e);
        }
         return listaId_producto.size()>0; 
    }
    
    public static Double precioTotal( int id_u){
        Double total=0.00;
        System.out.println("total"+total);
        try {
            String sql ="select sum(precio_total_pedido) as total \n" +
                        "from pedido_usuario \n" +
                        "where\n" +
                        "id_usuario = ? and flg_pedido =  'N'";
            Connection cn = Coneccion.coneccion.Abrir();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id_u);
            ResultSet rs = pst.executeQuery();
           
            if(rs.next()){
            total = rs.getDouble("total");
                System.out.println(total);
            }
            rs.close();
            pst.close();
            cn.close();
            return total;
        } catch (Exception e) {
            return total;
        }
    }
}
