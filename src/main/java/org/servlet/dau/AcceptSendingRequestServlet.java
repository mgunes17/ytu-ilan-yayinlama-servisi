package org.servlet.dau;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.db.dao.SpendingRequestDAO;
import org.db.hibernate.SpendingRequestHibernateImpl;
import org.db.model.DauUser;
import org.db.model.SpendingRequest;
import org.db.model.SpendingRequestState;

/**
 * Servlet implementation class AcceptSendingRequestServlet
 */
@WebServlet("/acceptsendingrequest")
public class AcceptSendingRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcceptSendingRequestServlet() {
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
		
		int requestId = Integer.parseInt((String)request.getParameter("requestId"));
		String answer = request.getParameter("description");
		DauUser dauUser = (DauUser) session.getAttribute("user");
		
		SpendingRequestDAO requestDAO = new SpendingRequestHibernateImpl();
		
		SpendingRequest spendingRequest = requestDAO.getSpendingRequest(requestId);
		spendingRequest.setAnswerFromUpdater(answer);
		spendingRequest.setUpdatedDateTime(new Date());
		spendingRequest.setDauUser(dauUser);
		spendingRequest.setState(new SpendingRequestState(2));
		
		
		
		if(requestDAO.updateRequest(spendingRequest)) {
			session.setAttribute("istekguncelle", 1);
			SpendingRequestDAO spendingDAO = new SpendingRequestHibernateImpl();
			List<SpendingRequest> spendingRequestList = spendingDAO.listSpendingRequest(dauUser.getDau().getUnitName(), 1);
			session.setAttribute("spendingList", spendingRequestList);
		} else {
			session.setAttribute("istekguncelle", 2);
		}
		
		response.sendRedirect("dau/harcama-istekleri.jsp");
	}

}
