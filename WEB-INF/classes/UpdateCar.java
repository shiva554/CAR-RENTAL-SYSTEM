package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class UpdateCar extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	HttpSession session=request.getSession();
	PrintWriter out = response.getWriter();
	String name=request.getParameter("t1").trim();
	String no=session.getAttribute("t2").toString();
	String manufacturer=request.getParameter("t3").trim();
	String contact=request.getParameter("t4").trim();
	String address=request.getParameter("t5").trim();
	String rent=request.getParameter("t6").trim();
	String seating=request.getParameter("seating").trim();
	
	try{
		String input[]={name,no,manufacturer,seating,contact,address,rent};
		String res[] = Database.updateCar(input).split(",");
    if(res[0].equals("success")){
		RequestDispatcher rd=request.getRequestDispatcher("AdminScreen.jsp?t1=Car details added. Car rented Start Date "+res[1]);
		rd.forward(request, response);
	}else{
		RequestDispatcher rd=request.getRequestDispatcher("Updatecar.jsp?t1=Error in adding car details");
		rd.forward(request, response);
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	}

}
