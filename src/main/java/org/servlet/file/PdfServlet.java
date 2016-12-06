package org.servlet.file;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;

import static com.sun.xml.internal.stream.Entity.ScannedEntity.DEFAULT_BUFFER_SIZE;

/**
 * Created by mgunes on 06.12.2016.
 */
@WebServlet(name = "PdfServlet", urlPatterns = {"/pdfviewer"})
public class PdfServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            byte[] buffer = new byte[DEFAULT_BUFFER_SIZE];
            int inputStreamLength = 0;
            int length = 0;
            while ((length = getInputStream().read(buffer)) > 0) {
                inputStreamLength += length;
                baos.write(buffer, 0, length);
            }

            if (inputStreamLength > getContentLength()) {
                setContentLength(inputStreamLength);
            }

            if (response instanceof HttpServletResponse) {
                HttpServletResponse httpResponse = (HttpServletResponse) response;
                httpResponse.reset();
                httpResponse.setHeader("Content-Type", getContentType());
                httpResponse.setHeader("Content-Length", String.valueOf(getContentLength()));
                httpResponse.setHeader("Content-Disposition", "\"" + getContentDisposition() + "\"" + ((getFileName() != null && !getFileName().isEmpty()) ? "; filename=\"" + getFileName() + "\"": ""));
            }

            response.getOutputStream().write(baos.toByteArray(), 0, (int)getContentLength());

            //finally
            response.getOutputStream().flush();

            //clear
            baos = null;
        } finally {
            // TODO Auto-generated catch block
            close(response.getOutputStream());
            close(getInputStream());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
