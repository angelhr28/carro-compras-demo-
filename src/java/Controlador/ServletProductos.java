/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import static Controlador.ServletPrincipal.userGlobal;
import Modelo.bean.Categoria;
import Modelo.bean.Producto;
import Modelo.bean.RespuestaPago;
import Modelo.bean.Usuario;
import Modelo.dao.CategoriaDAO;
import Modelo.dao.PasarelaCulqi;
import Modelo.dao.PedidoDAO;
import Modelo.dao.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fabri
 */
@WebServlet(name = "ServletProductos", urlPatterns = {"/ServletProductos", "/todosProductos", "/categoria", "/cantidadProducto", "/pasarela"})
public class ServletProductos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (request.getServletPath().equals("/todosProductos")) {
            request.getRequestDispatcher("WEB-INF/TodosProductos.jsp").forward(request, response);
        }
        if (request.getServletPath().equals("/categoria")) {
            int id = Integer.parseInt(request.getParameter("id"));
            ArrayList<Producto> listadoProductos = ProductoDAO.listarProductoIdCategoria(id);
            Categoria cat = CategoriaDAO.datosCategoria(id);
            System.out.println("fdgfdgfdfdg" + listadoProductos);
            request.setAttribute("categoria", cat);
            request.setAttribute("listadoProductos", listadoProductos);
            request.getRequestDispatcher("WEB-INF/CategoriaProductos.jsp").forward(request, response);
        }
        if (request.getServletPath().equals("/pasarela")) {
            // ya entro y si capta los datos
            //ahora usalos para que pueda pagar con eso xq estas pagando con la tarjeta que pusiste por defecto
            String numeroTarjeta = request.getParameter("numeroTarjeta");
            System.out.println("tarjeta"+numeroTarjeta);
            String fechaCaducidad = request.getParameter("fechaCaducidad");
            System.out.println("fecha"+fechaCaducidad);
            String cvv = request.getParameter("cvv");
            System.out.println("cvv"+cvv);
            //parece que ni entra a pasarela xq no imprime los datos que traemos de alla
            DecimalFormat df = new DecimalFormat("#.00");

            String precio = "" + df.format(PedidoDAO.precioTotal(userGlobal.getId_usuario())); //////////////// colocar precio total xD  aca necesito el dao de precio total 
            //ese es el archivo que passaste, todavia no lo he puesto en el ultimo que se ha hecho,
            //que archicos son nuevos para pegarlo en el proyecto?
            //prro ese dao de preciototal da mal el resultado   ahora q arrgle el otro este ya funca creo ya chvre
            precio = precio.replace(",", "");
//este es :v jajaja xvr es el sue;o men :>< 
            //ya esta entibces=
            RespuestaPago rs = PasarelaCulqi.listarProducto(precio, numeroTarjeta.replace(" ", ""), fechaCaducidad , cvv);
// ya prro ahora la wea es como el cliente sabe que ya se hizo el pago   ya mira yo te retorno ese mensaje metido en este objeto 
           // mandalo a la vista en un alert dialog nomas 
            // mejor en una pagina xq ahi si no se como hacer un dialog desde servlet para enviarlo a js, esta pendejo :v  yaya normal pero deja arreglo una wea q vi
            request.getRequestDispatcher("WEB-INF/compraRealizada.jsp").forward(request, response);
        }
        if (request.getServletPath().equals("/cantidadProducto")) {
            Usuario user = (Usuario) request.getSession().getAttribute("usuario");
            int idProducto = Integer.parseInt(request.getParameter("idProducto"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            System.out.println("idproducto" + idProducto);
            System.out.println("cantidad" + cantidad);
            PedidoDAO.editarCantidad(cantidad, idProducto, user.getId_usuario());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
