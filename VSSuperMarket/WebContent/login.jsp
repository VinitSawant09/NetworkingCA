<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script>

	/*
	var uname=document.getElementById("uname").value;
	alert(uname);
	var password=document.getElementById("password").value;
	var flag= true;
	if(uname!='admin' && password !='admin')
		{
		  flag=false;
		}
    if(flag==false)
    	{
    	document.getElementById("errorDiv").innerHTML="Invalid credentials";
    	alert("invalid credentials")
    	}
    */
   function  myFunction() 
    { 
        var status= '${sessionScope.Status}';
        if(status==""||status==null ||status=="success")
        	{
        	document.getElementById("errorDiv").innerHTML="";
        	}
        else if(status=="Invalid user credentials")
        	{
        	 document.getElementById("errorDiv").innerHTML="${sessionScope.Status}"; 
        	}
       
    }
    
	//document.getElementById("errorDiv").value="` ${sessionScope.Status}`';

</script>
</head>



<body onload="myFunction()">

<h2><center>Login Form for VS Super-market</center></h2>

<form method="post" action="LoginCheck" >
  <div class="imgcontainer">
    <img src="images/icon.jpg" alt="Avatar" class="avatar">
  </div>

  <div class="containerlogin">
    <label for="uname"><b style="margin-left: -30px">Username : </b></label>
    <input type="text" placeholder="Enter Username" name="uname" id="uname" required>

    <label for="psw"><b style="margin-left: -30px">Password : </b></label>
    <input type="password" placeholder="Enter Password" name="password" id ="password" required>
      <div id ="errorDiv" class ="errorDiv" style="
    margin-left: -30px;
      ">
    
    </div> 
   
    <button type="submit"  >Login</button>
    
  </div>
  

  
</form>

</body>
</html>
