package org.servlet.student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.db.dao.StudentDAO;
import org.db.hibernate.StudentHibernateImpl;
import org.db.model.Student;

@WebServlet(name = "StudentSaveServlet", urlPatterns = {"/studentsaveservlet"})
public class StudentSaveServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        Student student = new Student();
        student.setUserName(request.getParameter("username"));
        student.setPassword(request.getParameter("password"));
        student.setName(request.getParameter("name"));
        student.setSurname(request.getParameter("surname"));
        student.setUserTypeNo(3); 
        student.setDepartment(request.getParameter("department"));
        
        StudentDAO studentDAO = new StudentHibernateImpl();
        
        boolean result = studentDAO.saveStudent(student);
        
        if(result) {
        	//response a değişkeni koy
        }
        
        //eğer kayıt başarılıysa yönlendir
        //basarısız kontrolü nasıl olabilir? 
        response.sendRedirect("girisyap.jsp");
    }

}
