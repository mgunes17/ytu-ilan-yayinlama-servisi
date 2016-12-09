package org.servlet.announcement;

import org.db.model.Announcement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

/**
 * Created by mgunes on 10.12.2016.
 */
@WebServlet(name = "AnnouncementOrderServlet", urlPatterns = {"/announcementorder"})
public class AnnouncementOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderType  = request.getParameter("condition");
        List<Announcement> annList = (List<Announcement>) request.getSession().getAttribute("announcements");
        Collections.sort(annList, new AnnouncementComparator());

        response.sendRedirect("student/ilanlar.jsp");
    }

    public static class AnnouncementComparator implements Comparator<Announcement> {
        public int compare(Announcement a1, Announcement a2) {
            return a1.compareTo(a2);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
