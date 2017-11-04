<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CRS</title>
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<script language="javascript">
function doRegister(){

if(document.Rform.t1.value==""){
  		alert('Please Enter username');
		document.Rform.t1.focus();
        return false;
 }
 if(document.Rform.t2.value==""){
  		alert('Please Enter password name');
		document.Rform.t2.focus();
        return false;
 }
 if(document.Rform.t3.value==""){
  		alert('Please Enter Contact no');
		document.Rform.t3.focus();
        return false;
 }
 return true;
}

</script>
</head>

<body>

<div id="wrapper">

	<div id="header">
	<h1>CAR RENTAL SYSTEM</h1>
	</div>

	<div id="menu">
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="Admin.jsp">Administrator</a></li>
			<li><a href="Customer.jsp">Customer</a></li>
			<li><a href="GuestScreen.jsp">Guest</a></li>
			<li><a href="Register.jsp">Register Here</a></li>
		</ul>
	</div>



	<div id="content">

		<div class="entry">
			<p>
                <%if(request.getParameter("t1")!=null){%>
                <font color="red"><b><%=request.getParameter("t1")%></b></font>
                <%}%>
               
				  <table border=4  bordercolor="#0662bd" style="position: absolute;top: 160;left:300">
  <tr>
  <td>
   <form action="Register" method="POST" name="Rform" onSubmit="return doRegister()">
       <table align="center" cellspacing="10">
     <tr align="center">
<td colspan="2"><font size="3" color="#0662bd"><strong>Registration Form</strong></font></td>
</tr>

<tr>
<td>First Name</td>
<td><input type="text" name="t1"></td>
</tr>

<tr>
<td>Last Name</td>
<td><input type="text" name="t2"></td>
</tr>

<tr>
<td>Username</td>
<td><input type="text" name="t3"></td>
</tr>

<tr>
<td>Password</td>
<td><input type="password" name="t4"></td>
</tr>

<tr>
<td>Email Id</td>
<td><input type="text" name="t5"></td>
</tr>

<tr>
<td>Contact No</td>
<td><input type="text" name="t6"></td>
</tr>

<tr align="center">
<td colspan="2"><input type="submit" value="Register" style="font-family: Georgia;font-size: 17"></td>
</tr>
</table>
</table>
   </form>
            </p>
		</div>
	</div>

	<div id="footer">
		<div id="footer-valid">
			<a href="">Railway Routing</a> / <a href="">Railway Routing</a>
		</div>
	</div>

</div>

</body>
</html>


