package org.servlet.company;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.db.dao.CompanyDAO;
import org.db.hibernate.CompanyHibernateImpl;
import org.db.model.Company;

@WebServlet(name = "CompanySaveServlet", urlPatterns = {"/companysaveservlet"})
public class CompanySaveServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        Company company = new Company(
            request.getParameter("mersis_no"),
            request.getParameter("company_name"),
            request.getParameter("location"),
            request.getParameter("user_name"),
            request.getParameter("password")
        );
        
        CompanyDAO companyDAO = new CompanyHibernateImpl();
        companyDAO.saveCompany(company);
        response.sendRedirect("index.jsp");
    }

}
