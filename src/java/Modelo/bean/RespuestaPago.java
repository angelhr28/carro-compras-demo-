/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.bean;

/**
 *
 * @author angel
 */
public class RespuestaPago {
    String message = "";
    String messageDesc = "";
    String codigoCompra = "";
    String tituloCompra = "";

    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }

    public String getMessageDesc() {
        return messageDesc;
    }

    public void setMessageDesc(String messageDesc) {
        this.messageDesc = messageDesc;
    }

    public String getCodigoCompra() {
        return codigoCompra;
    }

    public void setCodigoCompra(String codigoCompra) {
        this.codigoCompra = codigoCompra;
    }

    public String getTituloCompra() {
        return tituloCompra;
    }

    public void setTituloCompra(String tituloCompra) {
        this.tituloCompra = tituloCompra;
    }

   
}
