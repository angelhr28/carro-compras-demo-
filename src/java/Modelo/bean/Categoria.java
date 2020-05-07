/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.bean;

/**
 *
 * @author fabri
 */
public class Categoria {
    int idCategoria = 0;
    String nameCategoria = "";
    String fotoCategoria = "";

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNameCategoria() {
        return nameCategoria;
    }

    public void setNameCategoria(String nameCategoria) {
        this.nameCategoria = nameCategoria;
    }

    public String getFotoCategoria() {
        return fotoCategoria;
    }

    public void setFotoCategoria(String fotoCategoria) {
        this.fotoCategoria = fotoCategoria;
    }
    
    
}
