<!--  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
hello user
${sessionScope.Status}
<form action="/action_page.php">
Enter Customer name: <input type="text" name="FirstName" value="Mickey"><br>
Last name: <input type="text" name="LastName" value="Mouse"><br>
<input type="submit" value="Submit">
</form>

<form method="post" action="Logout" >
 <button type="submit" >Logout</button>
 </form>
</body>
</html>
-->

<!DOCTYPE html>
<html>
<head>

	<title>
    VS Super Market
	</title>

  <link rel="shortcut icon" src="images/icon.png" />
  <link rel="stylesheet" href="css/style.css">
 <script type="text/javascript">
    function logout() {

        var url = "Logout";   //Here it is controllername/ActionName
        window.location.href = url;
    }
    
    function goHome()
    {
    	 var url = "home.jsp";   //Here it is controllername/ActionName
         window.location.href = url;
    }
    
    function myFunction()
    {
    	 var bill= '${sessionScope.Bill}';
         if(bill==""||bill==null ||bill=="success")
         	{
         	document.getElementById("BillAmount").innerHTML="";
         	}
         else 
         	{
         	 document.getElementById("BillAmount").innerHTML="Bill amount to be paid"+bill; 
         	}
    	
    }
    
    function transac()
    {
    	
    	 var url = "FetchData";   //Here it is controllername/ActionName
         window.location.href = url;
    }
</script> 

</head>
<body onload="myFunction()" >
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

<br>
  
   <form method="post" action="CalcBill" name="form1" >

  <div class="container">
  
 
    <label class ="uname" for="cname"><b>Customer Name: </b></label>
    <input type="text" placeholder="Enter Customer Name" name="username" id="custname" required>
    <br>
    <label for="uname"><b>Item 1 Quantity: </b></label>
    <input type="text" placeholder="Enter item 1" name="item1" id="item1" required >
    <br>
     <label for="uname"><b>Item 2 Quantity: </b></label>
    <input type="text" placeholder="Enter item 2" name="item2" id="item2" required>
    <br>
     <label for="uname"><b>Item 3 Quantity: </b></label>
    <input type="text" placeholder="Enter item 3" name="item3"id="item3" required>
    <br>
    <label for="uname"><b>Item 4 Quantity: </b></label>
    <input type="text" placeholder="Enter item 4" name="item4" id="item4" required>
    <br>
     <div id ="errorDiv" class ="errorDiv">
    
    </div> 
   
    <button type="submit" style="margin-left: 0px">Generate Bill</button>
    
  </div>
  </form>
  <br>
  <div id="BillAmount" class="billamount">
     
  </div>
  

  

  
  


</body>
</html>