package org.servlet.announcement;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.db.model.Announcement;
import org.db.model.Company;

/**
 * Servlet implementation class ListMyAnnouncementsServlet
 */
@WebServlet("/listmyannouncementsservlet")
public class ListMyAnnouncementsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListMyAnnouncementsServlet() {
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
		HttpSession session = request.getSession();
		Company company = (Company) session.getAttribute("user");
		List<Announcement> announcements = company.getAnnouncements(); 
		session.setAttribute("announcements", announcements);
		response.sendRedirect("company/ilanlarim.jsp");
	}

}
