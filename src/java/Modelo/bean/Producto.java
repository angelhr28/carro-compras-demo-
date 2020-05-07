/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.bean;

/**
 *
 * @author hp
 */
public class Producto {
    public int id_producto;
    public int id_categoria;
    public String desc_producto;
    public String nomb_producto;
    public Double precio_producto;
    public String img_producto;
    public String carac_producto;

    public String getCarac_producto() {
        return carac_producto;
    }

    public void setCarac_producto(String carac_producto) {
        this.carac_producto = carac_producto;
    }
    

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getDesc_producto() {
        return desc_producto;
    }

    public void setDesc_producto(String desc_producto) {
        this.desc_producto = desc_producto;
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
