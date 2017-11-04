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
			<li><a href="BookCar.jsp">Booking Car</a></li>
			<li><a href="ViewBooked.jsp">View Booked Car</a></li>
			<li><a href="ViewCars.jsp">View Cars</a></li>
<!--		<li><a href="BookCarStatus.jsp">Booking Status</a></li> -->
			<li><a href="UserpostOffer.jsp">Offers</a></li>
			<li><a href="Logout.jsp">Logout</a></li>
		</ul>
	</div>



	<div id="content">

		<div class="entry">
			<p>

                <font color="red"><b><%=session.getAttribute("user").toString()%></b></font>
               
				</p>                              
				  <table border=4  bordercolor="#0662bd" style="position: absolute;top: 160;left:300">
  <tr>
  <td>
  
       <table border="1" align="center" cellspacing="10">
     <tr><th>User Name</th><th>Car No</th><th>Booking Date</th><th>Kilometer Travels</th><th>Total Amount</th><th>Source</th><th>Destination</th><th>Discount</th><th>Final Rent</th></tr>
	 <%
	 java.util.Date d1 = new java.util.Date();
	 java.sql.Date end = new java.sql.Date(d1.getTime());
	 Connection con = Database.getCon();
	 Statement stmt = con.createStatement();
	 String uname=session.getAttribute("user").toString();
	 ResultSet rs = stmt.executeQuery("select * from book_car where username='"+uname+"'");
	 while(rs.next()){
		String user = rs.getString(1);
		String car = rs.getString(2);
		String date = rs.getString(3);
		String kilometer = rs.getString(4);
		String amount = rs.getString(6);
		String src = rs.getString(7);
		String des = rs.getString(8);
		String dis = rs.getString(10);
		String fin = rs.getString(11);
				%>
				<tr><td><%=user%></td>
				<td><%=car%></td>
				<td><%=date%></td>
				<td><%=kilometer%></td>
				<td><%=amount%></td>
				<td><%=src%></td>
				<td><%=des%></td>
				<td><%=dis%></td>
				<td><%=fin%></td>
				
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


