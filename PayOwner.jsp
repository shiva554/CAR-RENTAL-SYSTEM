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
			<li><a href="ViewRequest.jsp">View Rent Request</a></li>
<!--		<li><a href="PayOwner.jsp">Pay Owner</a></li> -->
			<li><a href="CollectRent.jsp">Collect Rent</a></li>
			<li><a href="ViewBooked.jsp">View Booked Car</a></li>
			<li><a href="postOffer.jsp">Post Offers</a></li>
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
  
       <table border="1" align="center" cellspacing="10">
     <tr><th>Owner Name</th><th>Car No</th><th>Manufacturer</th><th>Contact No</th><th>Seating</th><th>Address</th><th>Rent/Day</th><th>Rented Date</th><th>Total Days</th><th>Amount</th><th>Make Payment</th></tr>
	 <%
	 java.util.Date d1 = new java.util.Date();
	 java.sql.Date end = new java.sql.Date(d1.getTime());
	 Connection con = Database.getCon();
	 Statement stmt = con.createStatement();
	 ResultSet rs = stmt.executeQuery("select * from addcar");
	 while(rs.next()){
		String owner = rs.getString(1);
		System.out.println("owner :"+owner);
		String no = rs.getString(2);
		System.out.println("no :"+no);
		String manufacturer = rs.getString(3);
		System.out.println("manufacturer :"+manufacturer);
		String seating= rs.getString(4);
		System.out.println("seating :"+seating);
		String contact = rs.getString(5);
		System.out.println("contact :"+contact);
		String address = rs.getString(6);
		System.out.println("address :"+address);
		double rent = rs.getDouble(7);
		System.out.println("rent :"+rent);
		java.sql.Date start = rs.getDate(8);
		java.sql.Date checkout = rs.getDate(9);
		long diff = end.getTime() - start.getTime();
		long days = diff / (24 * 60 * 60 * 1000);
		System.out.println(start+" "+end+" "+days);
		if(end.after(start) && days >= 1){
		double total = days * rent;
		//String paid_rent = rs.getString(10);
				%>
				<tr><td><%=owner%></td>
				<td><%=no%></td>
				<td><%=manufacturer%></td>
				<td><%=seating%></td>
				<td><%=contact%></td>
				<td><%=address%></td>
				<td><%=rent%></td>
				<td><%=start%></td>
				<td><%=days%></td>
				<td><%=total%></td>
				<td><a href="OwnerPayment?t1=<%=no%>&t2=<%=total%>"><font size="" color="black">Click Here</font></a></td>
				<%}}rs.close();stmt.close();con.close();%>
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


