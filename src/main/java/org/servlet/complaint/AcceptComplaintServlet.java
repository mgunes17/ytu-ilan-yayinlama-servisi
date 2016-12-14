package org.servlet.complaint;

import org.db.dao.ComplaintDAO;
import org.db.hibernate.AnnouncementHibernateImpl;
import org.db.hibernate.ComplaintHibernateImpl;
import org.db.model.Announcement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by mgunes on 14.12.2016.
 */
@WebServlet(name = "AcceptComplaintServlet", urlPatterns = {"/acceptcomplaint"})
public class AcceptComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session  = request.getSession();
        request.setCharacterEncoding("UTF-8");

        int annId = Integer.parseInt(request.getParameter("annID"));
        String result = "Olumlu";
        String resultReply = request.getParameter("resultReply");

        ComplaintDAO complaintDAO = new ComplaintHibernateImpl();

        if(complaintDAO.punishAnnouncement(annId, result, resultReply)) {
            session.setAttribute("ceza", 1);
            List<Announcement> complaintAnnouncementList = new AnnouncementHibernateImpl().getComplaintAnnouncement();
            session.setAttribute("sikayetilan", complaintAnnouncementList);
        } else {
            session.setAttribute("ceza", 2);
        }

        response.sendRedirect("admin/sikayet-edilen-ilanlar.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
