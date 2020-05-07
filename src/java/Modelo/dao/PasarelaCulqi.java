/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.dao;

import static Controlador.ServletPrincipal.userGlobal;
import Modelo.bean.Categoria;
import Modelo.bean.RespuestaPago;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
/**
 *
 * @author angel
 */
public class PasarelaCulqi {
    
    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author HP
 */

    /**
     * @param precio
     * @param args the command line arguments
     * @return 
     */
    public static RespuestaPago listarProducto(String precio, String tarj, String fecha, String cvv) {
     try{
         System.out.println("culqui ::" + precio);
            return send(precio, tarj, fecha, cvv);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }//lo que pasa es que lo de alvaro te devuelve el
    public static RespuestaPago send( String precio, String tarj, String fecha, String cvv) throws IOException {
        String[] lista = fecha.split("/");
        URL url = new URL("https://secure.culqi.com/v2/tokens");
        //Map<String, Object> params = new LinkedHashMap<>();
        String parametro = "{\n" +
"                \"email\"            : \"angelhuamannahui@gmail.com\",\n" +
"                \"card_number\"      : \""+tarj+"\",\n" +
"                \"cvv\"              : \""+cvv+"\",\n" +
                //no deberia ir 4 digitos en el año   las targetas solo llevan losultimos 2 digitos yco mse rigen por mes y a;o como vi que en la platnilla vi el año completo x eso te decia nee xD 
"                \"expiration_year\"  : "+lista[1]+",\n" +
"                \"expiration_month\" : \""+lista[0]+"\"\n" +
"            }";
        //hay un pedo, solo te va a pasar el mes y el dia en este formato mm/yy o ponemos dos inputs, uno para mes y otro para año?   ya q chch para q sea mas rapidop aunq podemos hacer un split 
        //mejor hasle el split xd jaajja yaya 
        byte[] postDataBytes = parametro.getBytes("UTF-8");
 
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
        conn.setRequestProperty("authorization", "Bearer pk_test_GJwiPtN0C8aImsXj");
        conn.setDoOutput(true);
        conn.getOutputStream().write(postDataBytes);
 
        String rpta = "";
        Reader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        for (int c = in.read(); c != -1; c = in.read()) {
            rpta += (char)c;
        }
        //System.out.print(rpta);
        JSONParser parser = new JSONParser();
        try {
            JSONObject json = (JSONObject) parser.parse(rpta);
            //System.out.print(json.get("id"));
        parametro = "{\n" +
"                \"amount\"        : " +precio+ ",\n" +
"                \"currency_code\" : \"PEN\",\n" +
"                \"email\"         : \"angelhuamannahui@gmail.com\",\n" +
"                \"source_id\"     : \""+json.get("id")+"\",\n" +
"                \"description\"   : \"Lista de productos Kathiplass\",\n" +
"                \"antifraud_details\": {\n" +
"                    \"country_code\" : \"PE\",\n" +
"                    \"first_name\"   : \"" + userGlobal.getNomb_usuario() +"\",\n" +
"                    \"last_name\"    : \"" + userGlobal.getApe_usuario()+"\"\n" +
"                }\n" +
"            }";
        //hay dos proyectos finales, el de arriba es el tuyo y el de abajo es el proyecto final  vale
        postDataBytes = parametro.getBytes("UTF-8");
        //System.out.print(parametro);
        url = new URL("https://api.culqi.com/v2/charges");
        conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setRequestProperty("authorization", "Bearer sk_test_eXphvXZaITqxp6E1");
        conn.setDoOutput(true);
        conn.getOutputStream().write(postDataBytes);
 
        rpta = "";
        in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        for (int c = in.read(); c != -1; c = in.read()) {
            rpta += (char)c;
        }
        
        json = (JSONObject) parser.parse(rpta);
                Map outcome = ((Map)json.get("outcome")); 
          
        // iterating address Map 
        ArrayList<String> listaResult = new ArrayList<>();
        Iterator<Map.Entry> itr1 = outcome.entrySet().iterator(); 
        while (itr1.hasNext()) { 
            Map.Entry pair = itr1.next(); 
            listaResult.add((String) pair.getValue());
            System.out.println(pair.getKey() + " : " + pair.getValue()); 
        } 
        RespuestaPago rp = new RespuestaPago();
        rp.setMessage(listaResult.get(1));
        rp.setCodigoCompra(listaResult.get(0));
        rp.setTituloCompra((String) json.get("description"));
        rp.setMessageDesc(listaResult.get(2));
        editEstadoCompra(userGlobal.getId_usuario());
        // no funciono we, ese contador deberia esar en 0 uu
        // el select del contador esta mal entonces
        // tmr deja lo reviso donde esta ?? 
        return rp;
        } catch (ParseException ex) {
            Logger.getLogger(PasarelaCulqi.class.getName()).log(Level.SEVERE, null, ex);
        return null;
        }
    }
    
    //este no es we este ni es el dao de pedidos, esta es pasarela de culqi :V alv quiero dormir xD ya es deduia culero tmr yaya
    public static void editEstadoCompra(int idUser){
        try {
            String sql="UPDATE pedido_usuario SET flg_pedido= 'S' WHERE id_usuario = ?";
            Connection cn = Coneccion.coneccion.Abrir();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, idUser);
            pst.executeUpdate();
            cn.close();
            pst.close();
        } catch (Exception e) {
            System.out.println("errorrr :::  " + e );
        }
    }
}
