<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.Database"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

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
  		alert('Please Enter owner name');
		document.Rform.t1.focus();
        return false;
 }
 if(document.Rform.t2.value==""){
  		alert('Please Enter car no');
		document.Rform.t2.focus();
        return false;
 }
 if(document.Rform.t3.value==""){
  		alert('Please Enter manufacturer');
		document.Rform.t3.focus();
        return false;
 }
 if(document.Rform.t4.value==""){
  		alert('Please Enter contact no');
		document.Rform.t4.focus();
        return false;
 }
 if(document.Rform.t5.value==""){
  		alert('Please Enter address');
		document.Rform.t5.focus();
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
			<li><a href="AddCar.jsp">Add Car</a></li>
			<li><a href="Updatecar.jsp">Update Car</a></li>
			<li><a href="ViewCarstoAdmin.jsp">View Cars</a></li>
			<li><a href="ViewRequest.jsp">View Rent Request</a></li>
<!--		<li><a href="PayOwner.jsp">Pay Owner</a></li> -->
			<li><a href="CollectRent.jsp">Send Bill</a></li>
<!--		<li><a href="ViewBooked.jsp">View Booked Car</a></li> -->
			<li><a href="postOffer.jsp">Offers</a></li>
			<li><a href="Logout.jsp">Logout</a></li>
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
   <form action="UpdateCar1.jsp" method="POST" name="Rform" onSubmit="return doRegister()">
       <table align="center" cellspacing="10">
     <tr align="center">
<td colspan="2"><font size="3" color="#0662bd"><strong>Update Form</strong></font></td>
</tr>
<tr>
<td>Select Number to be Updated</td>
<td><select name="t6">
<%
	 Connection con = Database.getCon();
	 Statement stmt = con.createStatement();
	 ResultSet rs = stmt.executeQuery("select * from addcar");
	 while(rs.next()){
%>

	<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
<%}%>
</select></td>
</tr>

<tr align="center">
<td colspan="2"><input type="submit" value="Retrieve Car" style="font-family: Georgia;font-size: 17"></td>
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


