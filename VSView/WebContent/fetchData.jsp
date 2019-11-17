<%@page import="service.SendEmailSSL"%>
<%@page import="javax.activation.FileDataSource"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VS View</title>

<script>
function sendMail()
{
	 
	alert("sendemail");

	 var url = "EmailData";  
     window.location.href = url;
   
   alert("zhala")
}
</script>

</head>
<body>
 <form method="post" action="EmailData" >
<center><h1> Transaction List  </h1><button type="submit"  >Send mail</button></center>
</form>
<h1>
<%

String jspPath = "/data/";
//String fileName = "app.log";
DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("dd-MM-yyyy");  
LocalDateTime now1 = LocalDateTime.now();  

String fileName="Transac-"+dtf1.format(now1)+".log";

//String jspPath = "C:\\data\\";
//String fileName = "app.log";
String txtFilePath = jspPath + fileName;
BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));

StringBuilder sb = new StringBuilder();
String line;
PrintWriter output = response.getWriter();
//output.println("<table>");


while((line = reader.readLine())!= null){
 //   sb.append(line+"\n");
   // sb.append(System.getProperty("line.separator"));
    System.out.println(line);
    String[] value_split = line.split("\\|");
    //output.println("<tr>");
    for (int i=0; i< value_split.length ; i++)
    {    //output.println("<td>");
    	
    	 out.println(value_split[i] +"");
    	// output.println("</td>");
    	
    }
   // output.println("</tr>");
  //  out.println(line +"\n");
   out.println("<br>");
}
//output.println("</table>");

%>
</h1>
</body>
</html>