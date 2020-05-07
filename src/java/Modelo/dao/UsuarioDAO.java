/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.dao;

import Modelo.bean.Usuario;
import java.sql.*;

/**
 *
 * @author fabri
 */
public class UsuarioDAO {
    public static Usuario datosUsuario(String usuario, String contraseña) {
        String sql = "select * from usuario where usuario=? and contraseña=?";
        Usuario user = null;
        Connection cn = Coneccion.coneccion.Abrir();
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, usuario);
            pst.setString(2, contraseña);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                user = new Usuario();
                user.setId_usuario(rs.getInt("id_usuario"));
                user.setUsuario(rs.getString("usuario"));
                user.setContraseña(rs.getString("contraseña"));
                user.setNomb_usuario(rs.getString("nomb_usuario"));
                user.setApe_usuario(rs.getString("ape_usuario"));
                user.setDni(rs.getString("dni"));
                user.setE_mail(rs.getString("e_mail"));
                user.setCelular(rs.getString("celular"));
            }
            return user;
        } catch (Exception e) {
            return null;
        }
    }
    
    public static void registrarUsuario(Usuario user){
        String sql = "insert into usuario (usuario,contraseña,nomb_usuario,ape_usuario) values(?,?,?,?)";
        Connection cn = Coneccion.coneccion.Abrir();
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, user.getUsuario());
            pst.setString(2, user.getContraseña());
            pst.setString(3, user.getNomb_usuario());
            pst.setString(4, user.getApe_usuario());
            pst.executeUpdate();
            System.out.println("se registro :v");
        } catch (Exception e) {
            System.out.println("no se registro chingadamadre xd");
        }
    }
}
