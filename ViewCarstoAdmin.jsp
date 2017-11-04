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
   <form action="UpdateCar" method="POST" name="Rform" onSubmit="return doRegister()">

<table align="center" cellspacing="2" border="2">
<tr><th>Owner Name</th><th>Car No</th><th>Manufacturer</th><th>Seating Capacity</th><th>Owner Contact No</th><th>Owner Address</th><th>Rent/Day</th><th>Distance Travelled</th><th>Car Pic</th>
</tr>
<%
	String car_no=request.getParameter("t6");
	 Connection con = Database.getCon();
	 Statement stmt = con.createStatement();
	 ResultSet rs = stmt.executeQuery("select * from addcar ");
	 while(rs.next()){
		 session.setAttribute("t2",rs.getString(2));
%>

<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>

<!--
<tr>
<td>Paid Amount</td>
<td><%=rs.getString(10)%></td>
</tr>
-->
<td><%=rs.getString(11)%></td>
<td><a href="Myprofile.jsp?uname=<%= rs.getString(2)%>"><img src="http://localhost:8888/car/UploadedCars/<%= rs.getString(12)%>" 
height="75px" width="75px" border="1px" alt="Image cant be displayed"></a></td>
<!--<td rowspan="2">Click On the Image to Book</td>-->
</tr>

<%}%>

<tr align="center">
<!--<td colspan="2"><input type="submit" value="Add Car" style="font-family: Georgia;font-size: 17"></td>-->
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


