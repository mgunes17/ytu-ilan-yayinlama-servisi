package org.servlet.company;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.db.compositePK.CommunicationWayPK;
import org.db.dao.CompanyDAO;
import org.db.hibernate.CompanyHibernateImpl;
import org.db.model.CommunicationWay;
import org.db.model.Company;

@WebServlet(name = "CompanySaveServlet", urlPatterns = {"/companysaveservlet"})
public class CompanySaveServlet extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        //sirket maili onayladıktan sonra status admin onayı bekleniyor olacak
        Company company = readRequestParameter(request);
        company.setUserTypeNo(2);
        company.setStatus(0); //mail onayı bekleniyor
        CompanyDAO companyDAO = new CompanyHibernateImpl();
        
        if(companyDAO.saveCompany(company))
        	//islem basarılı
        
        response.sendRedirect("index.jsp");
    }
    
    private Company readRequestParameter(HttpServletRequest request) {
    	Company company = new Company();
    	company.setUserName(request.getParameter("username"));
    	company.setPassword(request.getParameter("password"));
    	company.setCompanyName(request.getParameter("company_name"));
    	
    	List<CommunicationWay> commWays = new ArrayList<CommunicationWay>();
    	CommunicationWayPK cwpk = new CommunicationWayPK();
    	
    	cwpk.setCommType("telefon");
    	cwpk.setCommValue(request.getParameter("telephone_number"));
    	commWays.add(new CommunicationWay(cwpk));
    	
    	CommunicationWayPK cwpk1 = new CommunicationWayPK();
    	cwpk1.setCommType("mail");
    	cwpk1.setCommValue(request.getParameter("email"));
    	commWays.add(new CommunicationWay(cwpk1));
    	
    	company.setCommWays(commWays);

    	return company;
   
    }

}
