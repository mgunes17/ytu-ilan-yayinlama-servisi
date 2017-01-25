package org.mail;

/**
 * Created by mgunes on 25.01.2017.
 */
import org.hibernate.Session;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;
import java.io.IOException;
import java.util.Properties;

public class MailFunction {
    private String senderMail = null; //yeni mail açman lazım
    private String username = null; //sender mail ile aynı
    private String password = null; //mail in şifresi vt den oku - admine arayüz yap
    private String host = null; //altta atanmış zaten dokunma

    public MailFunction() {
        senderMail = "ytu.ilanservisi@gmail.com";
        username = "ytu.ilanservisi@gmail.com";
        password = "ytu.ilanservisi1717";
        host = "smtp.gmail.com";
    }

    public void send(final String to, final String subject, final String text) {
        new Thread(new Runnable() {
            public void run() {
                Properties props = new Properties();
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.host", host);
                props.put("mail.smtp.port", "587");

                javax.mail.Session session;
                session = javax.mail.Session.getInstance(props, new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

                try {
                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(senderMail));
                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
                    message.setSubject(subject);
                    message.setText(text);
                    Transport.send(message);
                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
            }
        }).start();
    }
}
