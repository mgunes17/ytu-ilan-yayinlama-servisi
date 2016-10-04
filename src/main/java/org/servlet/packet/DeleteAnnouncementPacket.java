package org.servlet.packet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.db.dao.AnnouncementPacketDAO;
import org.db.hibernate.AnnouncementPacketHibernateImpl;

@WebServlet(name = "DeleteAnnouncementPacket", urlPatterns = {"/deleteannouncementpacket"})
public class DeleteAnnouncementPacket extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int packetId = Integer.parseInt(request.getParameter("packetId"));
        AnnouncementPacketDAO packetDAO = new AnnouncementPacketHibernateImpl();
        packetDAO.deletePacket(packetId	); //silme işlemi başarılı-başarısız att ekle
        
        response.sendRedirect("displaypackets");
    }

}
