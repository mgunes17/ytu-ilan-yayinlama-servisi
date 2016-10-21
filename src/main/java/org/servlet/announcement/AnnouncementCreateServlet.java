package org.servlet.announcement;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.db.dao.AnnouncementDAO;
import org.db.hibernate.AnnouncementHibernateImpl;
import org.db.model.Announcement;
import org.db.model.Company;

/**
 * Servlet implementation class AnnouncementCreateServlet
 */
@WebServlet("/announcementcreateservlet")
public class AnnouncementCreateServlet extends HttpServlet {
	private Announcement announcement;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnnouncementCreateServlet() {
        super();
        announcement = new Announcement();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		readForm(request);
		announcement.setState(0);
		announcement.setOwnerCompany((Company)session.getAttribute("user"));
		announcement.setOwnerPacket(-1);
		AnnouncementDAO annDAO = new AnnouncementHibernateImpl();
		
		if(annDAO.saveAnnouncement(announcement)) {
			session.setAttribute("olusturuldu", 1);
		}
		else {
			session.setAttribute("olusturuldu", 2);
		}
		
		response.sendRedirect("company/ilan-olustur.jsp");
	}

	private void readForm(HttpServletRequest request) {
		announcement.setTitle(request.getParameter("title"));
		announcement.setBrief(request.getParameter("brief"));
		announcement.setContent(request.getParameter("content"));
		announcement.setAnnouncementType(Integer.parseInt(request.getParameter("type")));
	}
}
