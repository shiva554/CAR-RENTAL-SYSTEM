package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class OwnerPayment extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	PrintWriter out = response.getWriter();
	String car_no=request.getParameter("t1").trim();
	String amount=request.getParameter("t2").trim();
		
	try{
		String res = Database.ownerPayment(car_no,amount);
    if(res.equals("success")){
		RequestDispatcher rd=request.getRequestDispatcher("PayOwner.jsp");
		rd.forward(request, response);
	}else{
		RequestDispatcher rd=request.getRequestDispatcher("PayOwner.jsp?t1=Error in adding car details");
		rd.forward(request, response);
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	}

}
