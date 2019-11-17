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
<title>VSSuperMarket</title><title>
    VS Super Market
	</title>

  <link rel="shortcut icon" src="images/icon.png" />
  <link rel="stylesheet" href="css/style.css">
  
<script>

function goHome()
{
	 var url = "home.jsp";   //Here it is controllername/ActionName
     window.location.href = url;
}

function logout() {

    var url = "Logout";   //Here it is controllername/ActionName
    window.location.href = url;
}

</script>
 
</head>
<body>
	<div class="header">
		
    	<div class="logoheader">

			<img class="od_header_icon_img" rel="shortcut icon" src="images/icon.jpg" />
    
    		<span class="logo">VS Super Market</span>
    		
   		</div>
   		
   			<div class="meta-nav">
   				<div class="main_nav">
    				<a class="navi" onclick="goHome()">Home</a>
    				
    				<a class="navi" onclick="transac()">Transactions</a>
    				
   					 <a onclick="logout()" class ="navi" >Logout</a>
   					 
   					 <span class="username">Hello ${sessionScope.username}  .!</span>
    			</div>
    		</div>
     	
        
    </div>

<center><h1> Transaction List  </h1></center>
<div>
<h2>
<%

String jspPath = "/data/";
//String fileName = "app.log";
  DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("dd-MM-yyyy");  
		   LocalDateTime now1 = LocalDateTime.now();  
		 
		   String dateNow="Transac-"+dtf1.format(now1);
		
//String jspPath = "C:\\data\\";
String fileName = dateNow+".log";
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
</h2>
</div>
</body>
</html>