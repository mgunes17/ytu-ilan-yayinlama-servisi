package org.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.db.dao.DonationAcceptUnitDAO;
import org.db.hibernate.DauHibernateImpl;
import org.db.model.BankAccountInfo;
import org.db.model.DonationAcceptUnit;

/**
 * Servlet implementation class CreateDonationUnitServlet
 */

@WebServlet(name = "CreateDonationUnitServlet", urlPatterns = {"/createdonationunitservlet"})
public class CreateDonationUnitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateDonationUnitServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		// TODO Auto-generated method stub
		//okunan form bilgisi Türkçe karaktere uygun hale getirildi
        request.setCharacterEncoding("UTF-8");
        
        //Bağış kabul birimi özelliklerini oku
        DonationAcceptUnit dau = new DonationAcceptUnit();
        dau.setUnitName(request.getParameter("unit_name"));
        dau.setUserName(request.getParameter("user_name"));
        dau.setPassword(request.getParameter("password"));
        dau.setUserTypeNo(1);
        dau.setBalance(0);
        
        //Banka hesap bilgisi özelliklerini oku
        BankAccountInfo bai  = new BankAccountInfo();
        bai.setBankAccountNumber(Integer.parseInt(request.getParameter("account_number")));
        bai.setBankName(request.getParameter("bank_name"));
        bai.setBranchBankName(request.getParameter("name_of_branch"));
        bai.setCurrency(Integer.parseInt(request.getParameter("currency")));
        bai.setIban(request.getParameter("iban"));
        bai.setOwnerUnitName(dau.getUnitName());
        
        DonationAcceptUnitDAO dauDAO = new DauHibernateImpl();
        dauDAO.saveDonationAcceptUnit(dau);
        dauDAO.saveBankAccount(bai);
        
        response.sendRedirect("admin/success.jsp");
	}

}
