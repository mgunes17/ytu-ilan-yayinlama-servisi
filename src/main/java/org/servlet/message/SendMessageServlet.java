package org.servlet.message;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.db.dao.MessageDAO;
import org.db.hibernate.MessageHibernateImpl;
import org.db.model.Message;

@WebServlet(name = "SendMessageServlet", urlPatterns = {"/sendmessageservlet"})
public class SendMessageServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Message message;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        message = new Message();
        request.setCharacterEncoding("UTF-8");
        readRequest(request);

        MessageDAO messageDAO = new MessageHibernateImpl();
        System.out.println("-------------------------------"+message.getMessageBody());
        messageDAO.sendMessage(message);
        
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("gonderildi", 1);
        
        response.sendRedirect("iletisim.jsp");
    }

    private void readRequest(HttpServletRequest request){
        message.setMessageTitle(request.getParameter("title"));
        message.setMessageBody(request.getParameter("message"));
        message.setMailAddress(request.getParameter("mail"));
        
        message.setIPAddress(request.getRemoteAddr());
        message.setDateTime(new Date());
    }
}
