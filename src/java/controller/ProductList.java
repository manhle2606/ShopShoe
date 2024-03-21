/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BrandDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author chi
 */
public class ProductList extends HttpServlet {

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
        String categoryId = request.getParameter("categoryId") == null ? "" : request.getParameter("categoryId");
        String brandId = request.getParameter("brandId") == null ? "" : request.getParameter("brandId");
        ProductDAO pdao = new ProductDAO();
        ArrayList<Category> clist = pdao.getCategory();
        int totalproduct = pdao.getNumberProduct(categoryId, brandId);
        int numberPage = (int) Math.ceil((double) totalproduct / 8);
        int index;
        String currentPage = request.getParameter("index");
        if (currentPage == null) {
            index = 1;
        } else {
            index = Integer.parseInt(currentPage);
        }
        ArrayList<Product> plist = pdao.getProduct(categoryId, brandId, index);
        request.setAttribute("plist", plist);
        request.setAttribute("numberPage", numberPage);
        BrandDAO bd = new BrandDAO();
        List<Brand> listBrand = new ArrayList<>();
        listBrand = bd.getAllBrand();
        
        String option = request.getParameter("option");
        if(option == null || option.isEmpty()){
            option = "0";
        }
        if(!option.equalsIgnoreCase("0")){
            ProductDAO pd = new ProductDAO();
            List<Product> listSort = pd.sort(option);
            request.setAttribute("plist", listSort);
        }
        request.setAttribute("tag", option);
        request.setAttribute("listBrand", listBrand);
        
        request.setAttribute("clist", clist);
        request.getRequestDispatcher("productlist.jsp").forward(request, response);
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
