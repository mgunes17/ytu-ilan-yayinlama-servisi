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
import org.db.hibernate.AnnouncementPacketHibernateImpl;
import org.db.model.AnnouncementPacket;


@WebServlet(name = "CreateAnnouncementPackageServlet", urlPatterns = {"/createannouncementpackageservlet"})
public class CreateAnnouncementPackageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String date = request.getParameter("last_date_used");
        Date expired = new Date(); //düzeltilecek
        
        System.out.println(expired);
        
        AnnouncementPacket packet = new AnnouncementPacket();
        packet.setTitle(request.getParameter("packet_name"));
        packet.setDonateAcceptUnit(request.getParameter("unit"));
        packet.setActiveTime(Integer.parseInt(request.getParameter("activate_date")));
        packet.setLastDateUsed(new Date());
        packet.setAnnouncementCount(Integer.parseInt(
                request.getParameter("announcement_number")));
        packet.setCurrency(Integer.parseInt(request.getParameter("currency")));
        packet.setPrice(Integer.parseInt(request.getParameter("price")));
        packet.setCondition(request.getParameter("condition"));
        
        AnnouncementPacketDAO packetDAO = new AnnouncementPacketHibernateImpl();
        
        HttpSession session = request.getSession();
        
        if(packetDAO.savePacket(packet))
        	session.setAttribute("olusturuldu", 1);
        else
        	session.setAttribute("olusturuldu", 2);
        
        response.sendRedirect("admin/paket-olustur.jsp");
    }

}
