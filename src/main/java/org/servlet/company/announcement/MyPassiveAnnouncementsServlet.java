package org.servlet.company.announcement;

import org.db.dao.CompanyDAO;
import org.db.dao.CompanyOwnPacketDAO;
import org.db.hibernate.CompanyHibernateImpl;
import org.db.hibernate.CompanyOwnPacketHibernateImpl;
import org.db.model.Announcement;
import org.db.model.Company;
import org.db.model.CompanyOwnPacket;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by mgunes on 25.01.2017.
 */
@WebServlet(name = "MyPassiveAnnouncementsServlet", urlPatterns = {"/mypassiveannouncements"})
public class MyPassiveAnnouncementsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Company company = (Company) session.getAttribute("user");

        CompanyDAO companyDAO = new CompanyHibernateImpl();
        List<Announcement> announcementList = companyDAO.getMyPassiveAnnouncements(company.getUserName());
        session.setAttribute("announcements", announcementList);

        CompanyOwnPacketDAO copDAO = new CompanyOwnPacketHibernateImpl();
        List<CompanyOwnPacket> availablePackets = copDAO.getAvailablePackets(company.getUserName());
        session.setAttribute("availablepackets", availablePackets);
        response.sendRedirect("company/pasif-ilanlarim.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
