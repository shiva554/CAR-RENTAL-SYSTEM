package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.io.File;

public class Register extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	PrintWriter out = response.getWriter();
	String fname=request.getParameter("t1").trim();
	String lname=request.getParameter("t2").trim();
	String uname=request.getParameter("t3").trim();
	String pass=request.getParameter("t4").trim();
	String email=request.getParameter("t5").trim();
	String contact=request.getParameter("t6").trim();
	
	
	try{
		String input[]={fname,lname,uname,pass,email,contact};
		String res = Database.register(input);
    if(res.equals("success")){
		RequestDispatcher rd=request.getRequestDispatcher("Customer.jsp?t1=Registration process completed");
		rd.forward(request, response);
	}else{
		RequestDispatcher rd=request.getRequestDispatcher("Register.jsp?t1=Error in registration");
		rd.forward(request, response);
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	}

}
