package org.servlet.admin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.db.dao.AnnouncementPacketDAO;
import org.db.dao.CurrencyDAO;
import org.db.dao.DonationAcceptUnitDAO;
import org.db.hibernate.AnnouncementPacketHibernateImpl;
import org.db.hibernate.CurrencyHibernateImpl;
import org.db.hibernate.DauHibernateImpl;
import org.db.model.AnnouncementPacket;
import org.db.model.Currency;
import org.db.model.DonationAcceptUnit;


@WebServlet(name = "CreateAnnouncementPackageServlet", urlPatterns = {"/createannouncementpackageservlet"})
public class CreateAnnouncementPackageServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AnnouncementPacket packet;
	private DonationAcceptUnit dau;
	private Currency currency;
	
	public CreateAnnouncementPackageServlet() {
		super();
		packet = new AnnouncementPacket();
		dau = new DonationAcceptUnit();
		currency = new Currency();
	}

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        /*String date = request.getParameter("last_date_used");
        Date expired = new Date(); //düzeltilecek*/
        
        DonationAcceptUnitDAO dauDAO = new DauHibernateImpl();
        dau = (DonationAcceptUnit) dauDAO.getUnit(request.getParameter("unit"));
        
        CurrencyDAO currencyDAO = new CurrencyHibernateImpl();
        currency = currencyDAO.getCurrency(Integer.parseInt(request.getParameter("currency")));
        
        readParameters(request);
                
        AnnouncementPacketDAO packetDAO = new AnnouncementPacketHibernateImpl();
        
        HttpSession session = request.getSession();
        
        if(packetDAO.savePacket(packet)) {
        	session.setAttribute("olusturuldu", 1);
        } else {
        	session.setAttribute("olusturuldu", 2);
        }        	
        
        response.sendRedirect("admin/paket-olustur.jsp");
    }
    
    private void readParameters(HttpServletRequest request) {
        packet.setTitle(request.getParameter("packet_name"));
        packet.setActiveTime(Integer.parseInt(request.getParameter("activate_date")));
        packet.setLastDateUsed(new Date());
        packet.setAnnouncementCount(Integer.parseInt(
                request.getParameter("announcement_number")));
        packet.setPrice(Integer.parseInt(request.getParameter("price")));
        packet.setCondition(request.getParameter("condition"));
        
        packet.setDonateAcceptUnit(dau);
        packet.setCurrency(currency);

    }

}
