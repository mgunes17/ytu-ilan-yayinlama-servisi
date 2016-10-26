package org.servlet.packet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.db.dao.CompanyOwnPacketDAO;
import org.db.hibernate.CompanyOwnPacketHibernateImpl;
import org.db.model.CompanyOwnPacket;
import org.db.model.User;

/**
 * Servlet implementation class ApprovedDonationServlet
 */
@WebServlet("/approveddonationservlet")
public class ApprovedDonationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApprovedDonationServlet() {
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
		User user = (User) session.getAttribute("user");
		//nesneyi bul ve approved, timeToAppreved, userForApproved alanlarını güncelle
		CompanyOwnPacketDAO copDAO = new CompanyOwnPacketHibernateImpl();
		CompanyOwnPacket cop = copDAO.getPacket(Integer.parseInt(request.getParameter("packetId")));
		
		cop.setApproved(true);
		cop.setTimeToApproved(new Date());
		cop.setUsernameForApproed(user.getUserName());
		
		if(copDAO.updatePacket(cop)) {
			session.setAttribute("onaylandi", 1);
		} else {
			session.setAttribute("onaylandi", 2);
		}
		
		response.sendRedirect("dau/bagis-onaylari.jsp");
	}

}
