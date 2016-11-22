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
import org.db.model.Student;

/**
 * Servlet implementation class AnnouncementDetailToStudentServlet
 */
@WebServlet("/announcementdetailtostudent")
public class AnnouncementDetailToStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnnouncementDetailToStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int annID = Integer.parseInt(request.getParameter("announcement"));
		AnnouncementDAO annDAO = new AnnouncementHibernateImpl();
		Announcement announcement = annDAO.getAnnouncement(annID);
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("user");
		
		if(announcement != null) {
			announcement.setNumberOfPageViews(announcement.getNumberOfPageViews() + 1); //tek metotla 1 artır
			annDAO.updateAnnouncement(announcement); //aynı kullanıcı için sadece 1 görüntülenme sayılsın
			session.setAttribute("ilangetir", 1);
			
			if(student.isApplication(announcement.getId())) {
				session.setAttribute("basvuruvar", 1);
			} else {
				session.setAttribute("basvuruvar", 2);
			}
			
			session.setAttribute("announcement", announcement);
		} else {
			session.setAttribute("ilangetir", 1);
		}
		
		response.sendRedirect("student/ilan-detay.jsp");
	}

}
