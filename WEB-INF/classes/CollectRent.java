package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class CollectRent extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	PrintWriter out = response.getWriter();
	String user=request.getParameter("t1").trim();
	String src=request.getParameter("t2").trim();
	String des=request.getParameter("t3").trim();
	String kilometer=request.getParameter("t4").trim();
	String car=request.getParameter("t5").trim();
	String amount=request.getParameter("t6").trim();
	
	try{
		String input[]={user,src,des,kilometer,car,amount};
		String res = Database.collectRent(input);
    if(res.equals("success")){
		RequestDispatcher rd=request.getRequestDispatcher("CollectRent.jsp?t1=Rent collected");
		rd.forward(request, response);
	}else{
		RequestDispatcher rd=request.getRequestDispatcher("CollectRent.jsp?t1=Error in collecting rent");
		rd.forward(request, response);
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	}

}
