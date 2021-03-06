/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS3520.main.servlet;

import CS3520.main.UserValidation;
import CS3520.main.util.DBUtil;
import CS3520.main.util.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Keith
 */
public class CreateAccount extends HttpServlet {

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
        HttpSession sessionID = request.getSession();
        String url = "/";
        User user = new User();
        
        if(UserValidation.isNew(request.getParameter("userName"),request)){
            user = DBUtil.createNewAccount(request.getParameter(
                    "userName"), request.getParameter("password"), 
                    request.getParameter("firstName"), request.getParameter(
                    "lastName"), request.getParameter("email"), 
                    request.getParameter("billingAddress"), request.getParameter(
                    "mailingAddress"), request.getParameter("phone"));
            request.removeAttribute("errMsg");
            url = "/new_Account_Confirmation.jsp";
            sessionID.setAttribute("newUser", user);  
           
        }
        else{
            url = "/accountCreation.jsp";
            request.setAttribute("errMsg", "Account with that username already exists, try again.");
        }
         getServletContext().getRequestDispatcher(url).forward(request, 
                    response);
        
        
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
