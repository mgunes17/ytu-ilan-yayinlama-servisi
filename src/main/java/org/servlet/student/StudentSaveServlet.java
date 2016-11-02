package org.servlet.student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.db.compositePK.CommunicationWayPK;
import org.db.dao.StudentDAO;
import org.db.dao.UserDAO;
import org.db.dao.UserTypeDAO;
import org.db.hibernate.StudentHibernateImpl;
import org.db.hibernate.UserHibernateImpl;
import org.db.hibernate.UserTypeHibernateImpl;
import org.db.model.CommunicationWay;
import org.db.model.Student;
import org.db.model.UserType;

@WebServlet(name = "StudentSaveServlet", urlPatterns = {"/studentsaveservlet"})
public class StudentSaveServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Student student;
	private CommunicationWay mail;

	public StudentSaveServlet() {
		super();
		student = new Student();
		mail = new CommunicationWay();
	}
	
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession httpSession = request.getSession();
        readParameters(request);
        
        UserTypeDAO typeDAO = new UserTypeHibernateImpl();
        UserType type  = typeDAO.getUserType(3);
        
        student.setUserTypeNo(type); 
        
        StudentDAO studentDAO = new StudentHibernateImpl();
        UserDAO userDAO = new UserHibernateImpl();
             
        if (userDAO.isUserExist(request.getParameter("username"))) {
        	httpSession.setAttribute("kayit", 2);
        	httpSession.setAttribute("username", request.getParameter("username"));
        	httpSession.setAttribute("name", request.getParameter("name"));
        	httpSession.setAttribute("surname", request.getParameter("surname"));
        	httpSession.setAttribute("mail", request.getParameter("mail"));
        	response.sendRedirect("ogrenci-kayit.jsp");
        } else if(studentDAO.saveStudent(student)) { //başarıyla kaydedildi
        	httpSession.setAttribute("kayit", 1);
        	response.sendRedirect("studentremoveformattributesservlet");
        } else {
        	httpSession.setAttribute("kayit", 3);
        	httpSession.setAttribute("username", request.getParameter("username"));
        	httpSession.setAttribute("name", request.getParameter("name"));
        	httpSession.setAttribute("surname", request.getParameter("surname"));
        	httpSession.setAttribute("mail", request.getParameter("mail"));
        	response.sendRedirect("ogrenci-kayit.jsp");
        }
    }
    
    private void readParameters(HttpServletRequest request) {
    	student.setUserName(request.getParameter("username"));
        student.setPassword(request.getParameter("password"));
        student.setName(request.getParameter("name"));
        student.setSurname(request.getParameter("surname"));
        student.setDepartment(request.getParameter("department"));
        
        CommunicationWayPK mailPK = new CommunicationWayPK();
        mailPK.setCommType("mail");
        mailPK.setCommValue(request.getParameter("mail"));
        
        mail.setPk(mailPK);
        mail.setUser(student);
        
        student.getCommWays().add(mail);
    }

}
