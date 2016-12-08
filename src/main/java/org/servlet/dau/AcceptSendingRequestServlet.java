package org.servlet.dau;

import java.io.*;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.db.dao.AccountingDAO;
import org.db.dao.SpendingRequestDAO;
import org.db.hibernate.AccountingHibernateImpl;
import org.db.hibernate.SpendingRequestHibernateImpl;
import org.db.hibernate.UserHibernateImpl;
import org.db.model.Accounting;
import org.db.model.DauUser;
import org.db.model.SpendingRequest;
import org.db.model.SpendingRequestState;

/**
 * Servlet implementation class AcceptSendingRequestServlet
 */
@WebServlet("/acceptsendingrequest")
@MultipartConfig
public class AcceptSendingRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
		
		int requestId = Integer.parseInt(request.getParameter("requestId"));
		String answer = request.getParameter("description");
		DauUser dauUser = (DauUser) session.getAttribute("user");
		dauUser = (DauUser) new UserHibernateImpl().getUser(dauUser.getUserName());
		session.setAttribute("user", dauUser);
		
		SpendingRequestDAO requestDAO = new SpendingRequestHibernateImpl();
		
		SpendingRequest spendingRequest = requestDAO.getSpendingRequest(requestId);
		spendingRequest.setAnswerFromUpdater(answer);
		spendingRequest.setUpdatedDateTime(new Date());
		spendingRequest.setDauUser(dauUser);
		spendingRequest.setState(new SpendingRequestState(2));

        Part filePart = null;
        String fileName = "";
        String filePath = "";
        Part imagePart = null;
        String imageName = "";
        String imagePath = "";

        if(request.getPart("file") != null) {
            filePart = request.getPart("file");
            fileName += new Random().nextInt(10000) + "_";
            fileName += getFileName(filePart);
            filePath = request.getServletContext().getInitParameter("pdfFilePath");
        }

        if(request.getPart("image") != null) {
            imagePart = request.getPart("image");
            imageName += new Random().nextInt(10000) + "_";
            imageName += getFileName(imagePart);
            imagePath = request.getServletContext().getInitParameter("imageFilePath");
        }

        OutputStream out = null;
        InputStream filecontent = null;
        PrintWriter writer = response.getWriter();

        try {
            if(request.getPart("file") != null) {
                out = new FileOutputStream(new File(filePath + File.separator
                        + fileName));
                filecontent = filePart.getInputStream();

                int read = 0;
                final byte[] bytes = new byte[1024];

                while ((read = filecontent.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                }

                spendingRequest.setPdfPath(fileName);
            }

            if(request.getPart("image") != null) {
                out = new FileOutputStream(new File(imagePath + File.separator
                        + imageName));
                filecontent = imagePart.getInputStream();

                int read = 0;
                final byte[] bytes = new byte[1024];

                while ((read = filecontent.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                }

                spendingRequest.setImagePath(imageName);
            }

            if(requestDAO.updateRequest(spendingRequest)) {
                session.setAttribute("istekguncelle", 1);
                SpendingRequestDAO spendingDAO = new SpendingRequestHibernateImpl();
                List<SpendingRequest> spendingRequestList = spendingDAO.listSpendingRequest(dauUser.getDau().getUnitName(), 1);
                session.setAttribute("spendingList", spendingRequestList);
            } else {
                session.setAttribute("istekguncelle", 2);
            }

            response.sendRedirect("dau/harcama-istekleri.jsp");
        } catch (FileNotFoundException fne) {
            writer.println("You either did not specify a file to upload or are "
                    + "trying to upload a file to a protected or nonexistent "
                    + "location.");
            writer.println("<br/> ERROR: " + fne.getMessage());
        } finally {
            if (out != null) {
                out.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }
            if (writer != null) {
                writer.close();
            }
        }
	}

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

}
