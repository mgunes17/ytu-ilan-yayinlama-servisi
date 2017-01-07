package org.servlet.student.interests;

import org.db.dao.AnnouncementCategoryDAO;
import org.db.dao.AnnouncementTypeDAO;
import org.db.dao.InterestsDAO;
import org.db.hibernate.AnnouncementCategoryHibernateImpl;
import org.db.hibernate.AnnouncementTypeHibernateImpl;
import org.db.hibernate.InterestsHibernateImpl;
import org.db.model.AnnouncementCategory;
import org.db.model.AnnouncementType;
import org.db.model.Interests;
import org.db.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by mgunes on 07.01.2017.
 */
@WebServlet(name = "AddInterestsServlet", urlPatterns = {"/addinterests"})
public class AddInterestsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();

        Student student = (Student) session.getAttribute("user");
        int category = Integer.parseInt(request.getParameter("category"));
        int type = Integer.parseInt(request.getParameter("type"));
        String language = request.getParameter("language");
        String keywords = request.getParameter("keywords");

        Interests interests = new Interests();
        interests.setStudent(student);
        interests.setCategory(new AnnouncementCategory(category));
        interests.setKeywords(keywords);
        interests.setLanguage(language);
        interests.setType(new AnnouncementType(type));

        InterestsDAO interestsDAO = new InterestsHibernateImpl();

        if(interestsDAO.saveInterests(interests)) {
            session.setAttribute("eklendi", 1);
            List<Interests> myInterests = interestsDAO.getMyInterests(student.getUserName());

            AnnouncementTypeDAO annTypeDAO = new AnnouncementTypeHibernateImpl();
            List<AnnouncementType> annType = annTypeDAO.getAllAnnouncementTypes();

            AnnouncementCategoryDAO categoryDAO = new AnnouncementCategoryHibernateImpl();
            List<AnnouncementCategory> categoryList = categoryDAO.getAllCategories();

            session.setAttribute("annType", annType);
            session.setAttribute("categoryList", categoryList);
            session.setAttribute("interests", myInterests);

        } else {
            session.setAttribute("eklendi", 2);
        }

        response.sendRedirect("student/ilgilendiklerim.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
