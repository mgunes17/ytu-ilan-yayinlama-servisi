package org.servlet.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.db.dao.UserDAO;
import org.db.dao.UserTypeDAO;
import org.db.hibernate.UserHibernateImpl;
import org.db.hibernate.UserTypeHibernateImpl;
import org.db.model.User;
import org.db.model.UserType;

@WebServlet("/logincontrolservlet")
public class LoginControlServlet extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        UserDAO userDAO = new UserHibernateImpl();
        User user = (User) userDAO.getUser(username);
        
        //giriste membership status kontrol edilecek
        if(user == null || !user.getPassword().equals(password)) {
        	HttpSession httpSession = request.getSession();
        	httpSession.setAttribute("giris", 0);
        	response.sendRedirect("giris-yap.jsp");
        } 
        else {
        	UserTypeDAO userTypeDAO = new UserTypeHibernateImpl();
        	UserType userType = userTypeDAO.getUserType(user.getUserTypeNo()); // bunu sadece get main page olarak değiştir
        	HttpSession httpSession = request.getSession();
        	httpSession.setAttribute("user",user);
        	httpSession.setAttribute("status", user.getStatus());
        	response.sendRedirect(userType.getMain_page());
        }

    }
}