package org.servlet.main;

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
        
        // user ı getir user null ise kullanıcı bulunamadı yazdır
        //, user ın paswwword u ile burdakini kıyasla doğruysa  user tipini getir respnsa getmain page, değilse aynı sayfa,
        //kullanıcı adı veya parola yanlış
        
        UserDAO userDAO = new UserHibernateImpl();
        User user = (User) userDAO.getUser(username);
        
        if(user == null) { } // kullanıcı bulunamadı
        else if(user.getPassword().equals(password)) {
        	UserTypeDAO userTypeDAO = new UserTypeHibernateImpl();
        	UserType userType = userTypeDAO.getUserType(user.getUserTypeNo()); // bunu sadece get main page olarak değiştir
        	HttpSession httpSession = request.getSession();
        	httpSession.setAttribute("user",user);
        	response.sendRedirect(userType.getMain_page());
        }
        else {
        	// parola yanlış //ileride bunu kullanıcı adı veya parola yanlış olarak düzelt
        }
    }
}