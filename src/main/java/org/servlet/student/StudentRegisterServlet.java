package org.servlet.student;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@WebServlet(name = "StudentRegisterServlet", urlPatterns = {"/studentregisterservlet"})
public class StudentRegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
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
        
       /* ArrayList<String> department = new ArrayList<String>();
        department.add("bilgisayar muh");
        department.add("insaat muh");
        department.add("elektronik");
        department.add("kontrol");*/
        //Configuration cfg=new Configuration();  
        //cfg.addAnnotatedClass(Department.class);
        //cfg.configure("hibernate.cfg.xml"); 
        
        //SessionFactory factory=cfg.buildSessionFactory(); 
        //Session session=factory.openSession(); 
        
        //Query query = (Query) session.createQuery("from Department");
        //List<Department> department = query.list();
        
        //System.out.println(department.get(0).getName());
        //HttpSession httpSession = request.getSession();
        
        //httpSession.setAttribute("d", department);
        response.sendRedirect("ogrencikayit.jsp");
    }


}
