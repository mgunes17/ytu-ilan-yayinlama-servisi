package org.servlet.student.activate;

import org.db.dao.StudentDAO;
import org.db.hibernate.StudentHibernateImpl;
import org.db.model.Student;
import org.db.model.VerificationCode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by mgunes on 25.01.2017.
 */
@WebServlet(name = "SendCodeByStudentServlet", urlPatterns = {"/sendcodebystudent"})
public class SendCodeByStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("user");
        session.setAttribute("yenikod", 0);

        String code = request.getParameter("code");

        StudentDAO studentDAO = new StudentHibernateImpl();
        int result = studentDAO.activateStudent(student, code);

        if(result == 1) {
            student = new StudentHibernateImpl().getStudent(student.getUserName());
            session.setAttribute("user", student);
        }

        session.setAttribute("aktif", result);
        response.sendRedirect("student/hesabi-aktiflestir.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
