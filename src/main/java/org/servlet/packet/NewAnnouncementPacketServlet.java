package org.servlet.packet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.db.dao.CurrencyDAO;
import org.db.dao.DonationAcceptUnitDAO;
import org.db.hibernate.CurrencyHibernateImpl;
import org.db.hibernate.DauHibernateImpl;
import org.db.model.Currency;
import org.db.model.DonationAcceptUnit;

@WebServlet(name = "NewAnnouncementPacketServlet", urlPatterns = {"/newannouncementpacketservlet"})
public class NewAnnouncementPacketServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	CurrencyDAO currencyDAO = new CurrencyHibernateImpl();
        List<Currency> currency = currencyDAO.getAllCurrencies();
        
        DonationAcceptUnitDAO dauDAO = new DauHibernateImpl();
        List<DonationAcceptUnit> unit = dauDAO.getAllUnits();
       
        HttpSession session = request.getSession();
        session.setAttribute("curr", currency);
        session.setAttribute("dau", unit);
        
        try{
            session.removeAttribute("olusturuldu");
        }
        catch(Exception e){
            
        }
        finally{
            response.sendRedirect("admin/paket-olustur.jsp");
        }
        
    }

}
