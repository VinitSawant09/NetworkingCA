package service;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.MessagingException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Properties;

public class SendEmailSSL 
{
	
    public void sendMail () {

        final String username = "vinitvilassawant@gmail.com";
        final String password = "9167041011";

        Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("from@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse("vinit_sawant2000@yahoo.com")
            );
            message.setSubject("VSSuperMarket Transaction Details");
            message.setText("Dear Mail Crawler,"
                    + "\n\n Please do not spam my email!");
            BodyPart messageBodyPart = new MimeBodyPart();

            // Now set the actual message
            messageBodyPart.setText("PFA for todays latest transactions. ");
            Multipart multipart = new MimeMultipart();

            // Set text message part
            multipart.addBodyPart(messageBodyPart);

            // Part two is attachment
            messageBodyPart = new MimeBodyPart();
           // String filename = "/home/manisha/file.txt";
            DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("dd-MM-yyyy");  
            LocalDateTime now1 = LocalDateTime.now();  

            String filename="C:\\data\\Transac-"+dtf1.format(now1)+".log";
            DataSource source = new FileDataSource(filename);
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(filename);
            multipart.addBodyPart(messageBodyPart);

            // Send the complete message parts
            message.setContent(multipart);

            Transport.send(message);
           
            System.out.println("Done");
          

        } catch (MessagingException e) {
            e.printStackTrace();
        }
      
    }

}
