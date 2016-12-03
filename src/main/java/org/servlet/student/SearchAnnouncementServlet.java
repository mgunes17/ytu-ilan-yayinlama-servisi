package org.servlet.student;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.announcement.SearchCriteria;
import org.db.dao.AnnouncementDAO;
import org.db.hibernate.AnnouncementHibernateImpl;
import org.db.model.Announcement;

/**
 * Servlet implementation class SearchAnnouncementServlet
 */
@WebServlet("/searchannouncement")
public class SearchAnnouncementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAnnouncementServlet() {
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
		request.setCharacterEncoding("UTF-8");
		SearchCriteria searchCriteria = new SearchCriteria();
		searchCriteria.setCategoryId(Integer.parseInt(request.getParameter("category")));
		searchCriteria.setTypeId(Integer.parseInt(request.getParameter("type")));
		searchCriteria.setKeywords(request.getParameter("keywords").split(","));
		searchCriteria.setLanguage(request.getParameter("language"));
		
		AnnouncementDAO annDAO = new AnnouncementHibernateImpl();
		List<Announcement> annList = annDAO.getByCriteria(searchCriteria);
		
		/*annList = searchCriteria.filterKeywords(annList);
		
		ilanları keyword filtresinden geçir // eğer keyword kullan seçildiyse
		bunun için criteria da bir metot yap, tüm listeyi alıp geriye içinde o keywordlerin
		oldupu ilanları döndüren, hem başlık hem özet hem de içerik olarak arat*/
		
		HttpSession session = request.getSession();
		session.setAttribute("announcements", annList);
		
		response.sendRedirect("student/ilanlar.jsp");
		//ilan listesi bul
		//ilanlar jspye yönlendir
		
	}

}
