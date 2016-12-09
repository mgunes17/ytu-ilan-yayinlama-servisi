package org.servlet.student;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.algorithm.FilterAnnouncement;
import org.announcement.SearchCriteria;
import org.db.dao.AnnouncementDAO;
import org.db.hibernate.AnnouncementCategoryHibernateImpl;
import org.db.hibernate.AnnouncementHibernateImpl;
import org.db.model.Announcement;
import org.db.model.AnnouncementCategory;

/**
 * Servlet implementation class SearchAnnouncementServlet
 */
@WebServlet("/searchannouncement")
public class SearchAnnouncementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int categoryId = Integer.parseInt(request.getParameter("category"));
        int annTypeId = Integer.parseInt(request.getParameter("type"));
        String language = request.getParameter("language");

        String sql = "SELECT * FROM announcement ";

        AnnouncementCategory category = new AnnouncementCategoryHibernateImpl().getCategory(categoryId);
        Map<String, Object> parameter = new HashMap<String, Object>();

        //kategori seç, parent i 0sa, onun tüm alt başıkları da gelecek
        if(categoryId != 3 && category.getParentCategory() != 0) { //Tüm kategoriler seçilmediyse
            parameter.put("announcement_category", categoryId);
        } else if(categoryId != 3 && category.getParentCategory() == 0) { //Alt kategorileriyle beraber getir
            for(AnnouncementCategory c : category.getChildren()) {
                parameter.put("announcement_category", c.getId());
            }
        }

        if(!language.equals("alllanguages")) {
            parameter.put("announcement_language", "'" + language + "'");
        }

        if(annTypeId != 6) { //Tüm tipler seçilmediyse
            parameter.put("announcement_type", annTypeId);
        }

        AnnouncementDAO annDAO = new AnnouncementHibernateImpl();
        List<Announcement> annList = annDAO.getByCriteria(parameter);
		
		HttpSession session = request.getSession();

        if(annList == null) {
            session.setAttribute("size", 0);
        } else {
            //anahtar kelime var mı yı dönen sonuçlardan filtrele
            if(request.getParameter("usekw") != null) {
                String[] keywords = request.getParameter("keywords").split(",");
                annList = new FilterAnnouncement().filterByKeywords(annList, keywords);
            }

            session.setAttribute("announcements", annList);
        }
		
		response.sendRedirect("student/ilanlar.jsp");
	}

}
