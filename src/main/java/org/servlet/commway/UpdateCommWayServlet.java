package org.servlet.commway;

import org.db.dao.CommunicationWayDAO;
import org.db.hibernate.CommunicationWayHibernateImpl;
import org.db.hibernate.UserHibernateImpl;
import org.db.model.CommunicationWay;
import org.db.model.Company;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by mgunes on 09.12.2016.
 */
@WebServlet(name = "UpdateCommWayServlet", urlPatterns = {"/updatecompanycommway"})
public class UpdateCommWayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("guncelle", 0);
        session.setAttribute("parolaguncelle", 0);
        session.setAttribute("iletisimeklendi", 0);
        session.setAttribute("iletisimsil", 0);
        session.setAttribute("iletisimguncelle", 0);

        Company company = (Company) session.getAttribute("user");

        String newCommType = request.getParameter("cway");
        String newCommValue = request.getParameter("cvalue");
        String oldCommType = request.getParameter("oldway");
        String oldCommValue = request.getParameter("oldvalue");

        CommunicationWayDAO commDAO = new CommunicationWayHibernateImpl();

        if(commDAO.updateCommWay(company.getUserName(),oldCommType, oldCommValue, newCommType, newCommValue)) {
            session.setAttribute("iletisimguncelle", 1);
            company = (Company) new UserHibernateImpl().getUser(company.getUserName());
            session.setAttribute("user", company);
        } else {
            session.setAttribute("iletisimguncelle", 2);
        }

        response.sendRedirect("company/profil-duzenle.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
