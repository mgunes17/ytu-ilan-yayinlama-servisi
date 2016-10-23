package org.servlet.packet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.db.dao.AnnouncementPacketDAO;
import org.db.hibernate.AnnouncementPacketHibernateImpl;
import org.db.model.AnnouncementPacket;

@WebServlet(name = "DisplayPackets", urlPatterns = {"/displaypackets"})
public class DisplayPackets extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    	AnnouncementPacketDAO packetDAO = new AnnouncementPacketHibernateImpl();
        List<AnnouncementPacket> packets = packetDAO.getAllPackets();
        
        HttpSession session = request.getSession();
        session.setAttribute("packets", packets);
        response.sendRedirect("admin/paketleri-duzenle.jsp");
    }

}
