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
                <%if(request.getParameter("t1")!=null){%>
                <font color="red"><b><%=request.getParameter("t1")%></b></font>
                <%}%>
               
				  <table border=4  bordercolor="#0662bd" style="position: absolute;top: 160;left:300">
  <tr>
  <td>
   <form action="AddCar" method="POST" name="Rform" onSubmit="return doRegister()">
       <table align="center" cellspacing="10">
     <tr align="center">
<td colspan="2"><font size="3" color="#0662bd"><strong>Offer Details</strong></font></td>
</tr>
<tr>
<td>Users who are booked morethan 5 times can get 500 rupees discount</td>
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


