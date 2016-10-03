package org.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "NewAnnouncementPacketServlet", urlPatterns = {"/newannouncementpacketservlet"})
public class NewAnnouncementPacketServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        /*HttpSession session = request.getSession();
        List<Currency> currency = new CurrencyDAO().readCurrency();
        List<DonationAcceptUnit> unit = new DonationAcceptUnitDAO().readAllUnits();
        
        session.setAttribute("curr", currency);
        session.setAttribute("dau", unit);
        
        try{
            session.removeAttribute("olusturuldu");
        }
        catch(Exception e){
            
        }
        finally{
            response.sendRedirect("admin/paket-olustur.jsp");
        }*/
        
    }

}
