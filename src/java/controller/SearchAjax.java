/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;
import model.Product;

/**
 *
 * @author asus
 */
@WebServlet(name="SearchAjax", urlPatterns={"/searchajax"})
public class SearchAjax extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String txt = request.getParameter("search");
        ProductDAO pd = new ProductDAO();
        List<Product> list = pd.getAllProductByName(txt);
        PrintWriter out = response.getWriter();
       for(Product p : list){
           System.out.println(p.getImage());
           out.print("  <div class=\"col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat\">\n" +
"                            <div class=\"featured__item\">\n" +
"                                <div class=\"featured__item__pic set-bg\" data-setbg=\""+p.getImage()+"\">\n" +
        "     <img src=\""+p.getImage()+"\">"+
"                                    <ul class=\"featured__item__pic__hover\">\n" +
"                                        <li><a href=\"addtocart?pid="+p.getId()+"&quantity=1\"><i class=\"fa fa-shopping-cart\"></i></a></li>\n" +
"                                    </ul>\n" +
"                                </div>\n" +
"                                <div class=\"featured__item__text\">\n" +
"                                    <h6><a href=\"detail?id="+p.getId()+"\">"+p.getName()+"</a></h6>\n" +
"                                    <h5>$ "+p.getPrice()+"</h5>\n" +
"                                </div>\n" +
"                            </div>\n" +
"                        </div>");
       }
        }
    
        

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
