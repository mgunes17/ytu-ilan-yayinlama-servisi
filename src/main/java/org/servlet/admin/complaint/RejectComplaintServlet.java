package org.servlet.admin.complaint;

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
 * Created by mgunes on 18.12.2016.
 */
@WebServlet(name = "RejectComplaintServlet", urlPatterns = {"/rejectcomplaint"})
public class RejectComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session  = request.getSession();
        session.setAttribute("ceza", 0);
        request.setCharacterEncoding("UTF-8");

        int annId = Integer.parseInt(request.getParameter("annID"));
        String result = "Olumsuz";
        String resultReply = request.getParameter("resultReply");

        ComplaintDAO complaintDAO = new ComplaintHibernateImpl();

        if(complaintDAO.rejectComplaint(annId, result, resultReply)) {
            session.setAttribute("ret", 1);
            List<Announcement> complaintAnnouncementList = new AnnouncementHibernateImpl().getComplaintAnnouncement();
            session.setAttribute("sikayetilan", complaintAnnouncementList);
        } else {
            session.setAttribute("ret", 2);
        }

        response.sendRedirect("admin/sikayet-edilen-ilanlar.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
