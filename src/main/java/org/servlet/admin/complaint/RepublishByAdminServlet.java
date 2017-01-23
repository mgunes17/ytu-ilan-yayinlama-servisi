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
@WebServlet(name = "RepublishByAdminServlet", urlPatterns = {"/republishbyadmin"})
public class RepublishByAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        int annId = Integer.parseInt(request.getParameter("id"));
        String description = request.getParameter("description");

        AnnouncementDAO announcementDAO = new AnnouncementHibernateImpl();
        int iadeGun = announcementDAO.republishByAdmin(annId, description);

        if(iadeGun != -1) {
            session.setAttribute("yenidenyayin", 1);
            List<Announcement> suspendedAnnouncements = announcementDAO.getSuspendedAnnouncements();
            session.setAttribute("cezaliilanlar", suspendedAnnouncements);
            session.setAttribute("iadegun", iadeGun);
        } else {
            session.setAttribute("yenidenyayin", 2);
        }

        response.sendRedirect("admin/onaylanan-sikayetler.jsp");

        //kayıp günlerin hesaplanıp son yayın tarihine eklenmesi
        //kayıp gün rapordan çıkar son ceza aldığı gün - now
        //o ilanın current state cezalı olanlarını tarihe göre azalan sırala limit 1 de
        //o tarih son ceza aldığı tarih
        //bunu son yayın tarihine ekle
        //ilan durumunu aktif e çevir
        //bu ilanı artık reddedilenlerden görebilmen gerek
        //rapora current_state i yayında olarak ekle
        //reddedilenlere şikayet edilemez ve cezalı olmayanlar gelecek
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
