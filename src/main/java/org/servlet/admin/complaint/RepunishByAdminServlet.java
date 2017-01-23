package org.servlet.admin.complaint;

import org.db.dao.AnnouncementDAO;
import org.db.hibernate.AnnouncementHibernateImpl;
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
 * Created by mgunes on 23.01.2017.
 */
@WebServlet(name = "RepunishByAdminServlet", urlPatterns = {"/repunishbyadmin"})
public class RepunishByAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        int annId = Integer.parseInt(request.getParameter("id"));
        String description = request.getParameter("description");

        AnnouncementDAO announcementDAO = new AnnouncementHibernateImpl();

        if(announcementDAO.repunishByAdmin(annId, description)) {
            List<Announcement> rejectedList = announcementDAO.getRejectedComplaintList();
            session.setAttribute("retsikayet", rejectedList);
            session.setAttribute("yayindankaldir", 1);
        } else {
            session.setAttribute("yayindankaldir", 2);
        }

        response.sendRedirect("admin/reddedilen-sikayetler.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
