package org.servlet.dau;

import java.io.IOException;
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

/**
 * Servlet implementation class ListSpendingRequestServlet
 */
@WebServlet("/listspendingrequest")
public class ListSpendingRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListSpendingRequestServlet() {
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
		DauUser user = (DauUser) session.getAttribute("user");
		
		SpendingRequestDAO spendingDAO = new SpendingRequestHibernateImpl();
		List<SpendingRequest> spendingRequestList = spendingDAO.listSpendingRequest(user.getDau().getUnitName(), 1);
		
		session.setAttribute("istekguncelle", 0);
		session.setAttribute("spendingList", spendingRequestList);
		
		response.sendRedirect("dau/harcama-istekleri.jsp");
	}

}
