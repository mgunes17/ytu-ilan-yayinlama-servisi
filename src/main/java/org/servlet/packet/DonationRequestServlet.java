package org.servlet.packet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.db.dao.AnnouncementPacketDAO;
import org.db.dao.CompanyOwnPacketDAO;
import org.db.hibernate.AnnouncementPacketHibernateImpl;
import org.db.hibernate.CompanyOwnPacketHibernateImpl;
import org.db.model.AnnouncementPacket;
import org.db.model.Company;
import org.db.model.CompanyOwnPacket;

/**
 * Servlet implementation class DonatedPacket
 */
@WebServlet("/donationrequestservlet")
public class DonationRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonationRequestServlet() {
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
		int packetId = Integer.parseInt(request.getParameter("packetId"));
		
		AnnouncementPacketDAO annDAO = new AnnouncementPacketHibernateImpl();
		AnnouncementPacket packet = annDAO.getPacket(packetId);
		
		HttpSession httpSession = request.getSession();
		Company company = (Company) httpSession.getAttribute("user");
		
		CompanyOwnPacket cop = new CompanyOwnPacket();
		cop.setOwnerCompany(company);
		cop.setPacket(packet);
		cop.setTimeToRequest(new Date());
		
		CompanyOwnPacketDAO copDAO = new CompanyOwnPacketHibernateImpl();
		
		if(copDAO.save(cop)) {
			httpSession.setAttribute("donation_request", 1);
		} else {
			httpSession.setAttribute("donation_request", 2);
		}

		response.sendRedirect("company/paketleri-gor.jsp");
	}
}
