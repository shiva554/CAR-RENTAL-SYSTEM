package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class AddCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String owner,no,manufacturer,seating,contact,address,rent,distrav,file;
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");

	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(1*1024*1024);
	factory.setRepository(new File("\\C"));
    ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(10*1024*1024);

	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

	
	try{
		List fileItems = upload.parseRequest(request);
		Iterator itr = fileItems.iterator();
		while(itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			if(item.isFormField()){
				String name = item.getFieldName();
		           String value = item.getString();
		              if(name.equals("t1")){
			           	  owner=value;
		              }
					  if(name.equals("t2")){
						  no=value;
		              }
					  if(name.equals("t3")){
						  manufacturer=value;
		              } 	
		              if(name.equals("t4")){
			           	  contact=value;
		              }
					  if(name.equals("t5")){
						  address=value;
		              }
					  if(name.equals("t6")){
						  rent=value;
		              }
					  if(name.equals("seating")){
						  seating=value;
		              }
					  if(name.equals("distrav")){
						  distrav=value;
		              }   
					  
				}else{
					file = item.getName(); 
					System.out.println("file : "+file);
					String filepath = getServletContext().getRealPath("/");
					System.out.println("FILE PATH is"+filepath);
					System.out.println("PATH is"+path);

					File savedFile = new File(filepath+"UploadedCars/"+file); 
					item.write(savedFile); 
				}
		   }

		String input[]={owner,no,manufacturer,seating,contact,address,rent,distrav,file};
		String res[] = Database.addCar(input).split(",");
		System.out.println("Name :"+owner);
    if(res[0].equals("success")){
		RequestDispatcher rd=request.getRequestDispatcher("AddCar.jsp?t1=Car details added. Car rented Start Date "+res[1]);
		rd.forward(request, response);
	}else{
		RequestDispatcher rd=request.getRequestDispatcher("AddCar.jsp?t1=Error in adding car details");
		rd.forward(request, response);
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	}

}
