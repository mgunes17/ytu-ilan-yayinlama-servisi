package org.servlet.admin;

import org.db.dao.AccountingDAO;
import org.db.hibernate.AccountingHibernateImpl;
import org.db.model.Accounting;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by mgunes on 04.12.2016.
 */
@WebServlet("/filterbalance")
public class FilterBalanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountingDAO accDAO = new AccountingHibernateImpl();

        String allDate = request.getParameter("allDate");
        String allDau = request.getParameter("allDau");

        if(allDate != null && allDau != null) {
            List<Accounting> acc = accDAO.getAllAccountings();
            session.setAttribute("accounting", acc);
        } else if(allDate == null && allDau != null) {
            String start = request.getParameter("from");
            String end = request.getParameter("to");

            try {
                Date startDate = new SimpleDateFormat("dd/mm/yyyy").parse(start);
                Date endDate = new SimpleDateFormat("dd/mm/yyyy").parse(end);

                List<Accounting> acc = accDAO.getAccountingsFilterDate(start, end);
                session.setAttribute("accounting", acc);
            } catch (ParseException e) {
                e.printStackTrace();
            }

        } else if(allDate != null && allDau == null) {
            String departmentName = request.getParameter("department");
            List<Accounting> acc = accDAO.getAccountingsFilterName(departmentName);
            session.setAttribute("accounting", acc);
        } else if(allDate == null && allDau == null) {
            String start = request.getParameter("from");
            String end = request.getParameter("to");

            try {
                Date startDate = new SimpleDateFormat("dd/mm/yyyy").parse(start);
                Date endDate = new SimpleDateFormat("dd/mm/yyyy").parse(end);
                String departmentName = request.getParameter("department");
                List<Accounting> acc = accDAO.getAccountingsFilterDateAndName(departmentName, start, end);
                session.setAttribute("accounting", acc);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("admin/muhasebe-kayitlari.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
