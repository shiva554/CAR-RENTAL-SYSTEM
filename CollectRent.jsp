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
                              
				  <table border=4  bordercolor="#0662bd" style="position: absolute;top: 160;left:300">
  <tr>
  <td>
  
       <table border="1" align="center" cellspacing="10">
     <tr><th>User Name</th><th>Contact No</th><th>Booking Date</th><th>Source</th><th>Destination</th><th>Make Payment</th></tr>
	 <%
	 java.util.Date d1 = new java.util.Date();
	 java.sql.Date end = new java.sql.Date(d1.getTime());
	 Connection con = Database.getCon();
	 Statement stmt = con.createStatement();
	 ResultSet rs = stmt.executeQuery("select username,booking_date,source,destination from book_car where total_rent=0");
	 while(rs.next()){
		String user = rs.getString(1);
		String contact = Database.getContact(user);
		String date = rs.getString(2);
		String src = rs.getString(3);
		String des = rs.getString(4);
				%>
				<tr><td><%=user%></td>
				<td><%=contact%></td>
				<td><%=date%></td>
				<td><%=src%></td>
				<td><%=des%></td>
				<td><a href="RentCollection.jsp?t1=<%=user%>&t2=<%=src%>&t3=<%=des%>"><font size="" color="black">Click Here</font></a></td>
				<%}rs.close();stmt.close();con.close();%>
</table>
</table>
   </form>
            </p>
		</div>
	</div>

	<div id="footer">
		
	</div>

</div>

</body>
</html>


