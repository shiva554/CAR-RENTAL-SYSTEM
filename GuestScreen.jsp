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
			<li><a href="GuestBookCar.jsp">Booking Car</a></li>
			<li><a href="ViewGuestBooked.jsp">View Booked Car</a></li>
	<!--	<li><a href="BookCarStatus.jsp">Booking Status</a></li>-->
			<li><a href="Logout.jsp">Logout</a></li>
		</ul>
	</div>



	<div id="content">

		<div class="entry">
			<p>
			<%
			String user="guest";
			//HttpSession session=request.getSession();
			session.setAttribute("user",user);
			String mobile=request.getParameter("mobile");
			session.setAttribute("mobile",mobile);
			%>
                <%if(request.getParameter("t1")!=null){%>
                <font color="red"><b><%=user%></b></font>
                <%}%>
				</p>
               <br><br>
				  <table border=4  bordercolor="#0662bd" style="position: absolute;top: 160;left:300">
 
				<tr><td>
  
       <table align="center" cellspacing="3">
     <tr align="center">
<td  colspan="2"><font size="3" color="#0662bd"><strong>CAR RENTAL SYSTEM</strong></font></td>
</tr>
<tr>
<td><font size="2" ><p>Our Aim is to design and create a data management System for a car rental company.<tr><td> This enables customer to rent a vehicle that can be used temporarily for a fee during a Specified Period. </td><tr><td> This enables customer to rent a vehicle that can be used temporarily for a fee during a Specified Period. </p></font></td>
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


