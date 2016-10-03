package org.servlet.company;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CompanyRegisterServlet", urlPatterns = {"/companyregisterservlet"})
public class CompanyRegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //sektör vt den çekilecek
        //sektör tablosu-sınıfı-ilgili foreign key ler
        response.sendRedirect("sirketkayit.jsp");
    }

}
