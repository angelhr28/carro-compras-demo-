/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.bean;

import java.sql.Date;

/**
 *
 * @author hp
 */
public class Pedido {
    public int id_pedidoUsuario;
    public int id_usuario;
    public int flg_pedido;
    public Double precio_total_pedido;
    public Date fecha_pedido;
    public int catidad;
    public String nomb_producto;
    public Double precio_producto;
    public String img_producto;

    public int getId_pedidoUsuario() {
        return id_pedidoUsuario;
    }

    public void setId_pedidoUsuario(int id_pedidoUsuario) {
        this.id_pedidoUsuario = id_pedidoUsuario;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getFlg_pedido() {
        return flg_pedido;
    }

    public void setFlg_pedido(int flg_pedido) {
        this.flg_pedido = flg_pedido;
    }

    public Double getPrecio_total_pedido() {
        return precio_total_pedido;
    }

    public void setPrecio_total_pedido(Double precio_total_pedido) {
        this.precio_total_pedido = precio_total_pedido;
    }

    public Date getFecha_pedido() {
        return fecha_pedido;
    }

    public void setFecha_pedido(Date fecha_pedido) {
        this.fecha_pedido = fecha_pedido;
    }

    public int getCatidad() {
        return catidad;
    }

    public void setCatidad(int catidad) {
        this.catidad = catidad;
    }

    public String getNomb_producto() {
        return nomb_producto;
    }

    public void setNomb_producto(String nomb_producto) {
        this.nomb_producto = nomb_producto;
    }

    public Double getPrecio_producto() {
        return precio_producto;
    }

    public void setPrecio_producto(Double precio_producto) {
        this.precio_producto = precio_producto;
    }

    public String getImg_producto() {
        return img_producto;
    }

    public void setImg_producto(String img_producto) {
        this.img_producto = img_producto;
    }
    
}
