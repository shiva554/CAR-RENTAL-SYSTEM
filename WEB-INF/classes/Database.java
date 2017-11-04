package com;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;
import java.sql.Statement;
import java.util.ArrayList;
import java.io.FileWriter;
public class Database{
    private static Connection con;
	
public static Connection getCon()throws Exception {
   try{
		 Class.forName("com.mysql.jdbc.Driver");
		 con = DriverManager.getConnection("jdbc:mysql://localhost/car_rental","root","root");
     
	}catch(Exception e){
		e.printStackTrace();
	}
	return con;
}
public static String register(String[] input)throws Exception{
    String msg="no";
	con = getCon();
	Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select username from customer_register where username='"+input[0]+"'");
    if(rs.next()){
        msg = "Username already exist";
    }else{
		PreparedStatement stat=con.prepareStatement("insert into customer_register values(?,?,?,?,?,?,?)");
		stat.setString(1,input[0]);
		stat.setString(2,input[1]);
		stat.setString(3,input[2]);
		stat.setString(4,input[3]);
		stat.setString(5,input[4]);
		stat.setString(6,input[5]);
		stat.setString(7,"0");
		int i=stat.executeUpdate();
		stat.close();
		if(i > 0)
			msg = "success";
	}
	rs.close();stmt.close();con.close();
    return msg;
}

public static String bookCar(String[] input)throws Exception{
    String msg="no";
	con = getCon();
	Statement stmt=con.createStatement();
	Statement stmt1=con.createStatement();
    ResultSet rs=stmt.executeQuery("select username from book_car where username='"+input[0]+"' and total_rent=0");
/*	ResultSet rs1=stmt1.executeQuery("select * from customer_register where username='"+input[0]+"'");
	  String s=rs1.getString(1);
	  int numofbook=(int)s;
*/
    if(rs.next()){
        msg = "Your booking already done";
    }else{
		java.util.Date d1 = new java.util.Date();
		java.sql.Date d2 = new java.sql.Date(d1.getTime());
		PreparedStatement stat=con.prepareStatement("insert into book_car values(?,?,?,?,?,?,?,?,?,?,?)");
		stat.setString(1,input[0]);
		stat.setString(2,"0");
		stat.setDate(3,d2);
		stat.setString(4,"0");
		stat.setString(5,"0");
		stat.setString(6,"0");
		stat.setString(7,input[1]);
		stat.setString(8,input[2]);
		stat.setString(9,input[3]);
		stat.setString(10,"0");
		stat.setString(11,"0");
		int i=stat.executeUpdate();
		stat.close();
		if(i > 0)
			msg = "success";
	}
	/*PreparedStatement stat1=con.prepareStatement("update customer_register set numofbookings=? where username=?");
	stat1.setInt(1,numofbook);
	stat1.setString(2,input[0]);
	int j=stat1.executeUpdate();
	stat1.close();
	if(j > 0)
		msg = "success";*/
	rs.close();stmt.close();con.close();
    return msg;
}


public static String addCar(String[] input)throws Exception{
    String msg="no";
	String id="";
	con = getCon();
	Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select car_no from addcar where car_no='"+input[1]+"'");
    if(rs.next()){
        msg = "Given car no already exists "+input[1];
    }else{
		java.util.Date d1 = new java.util.Date();
		java.sql.Date d2 = new java.sql.Date(d1.getTime());
		PreparedStatement stat=con.prepareStatement("insert into addcar values(?,?,?,?,?,?,?,?,?,?,?,?)");
		stat.setString(1,input[0]);
		stat.setString(2,input[1]);
		stat.setString(3,input[2]);
		stat.setString(4,input[3]);
		stat.setString(5,input[4]);
		stat.setString(6,input[5]);
		stat.setDouble(7,Double.parseDouble(input[6]));
		stat.setDate(8,d2);
		stat.setDate(9,d2);
		stat.setString(10,"0");
		stat.setString(11,input[7]);
		stat.setString(12,input[8]);
		int i=stat.executeUpdate();
		stat.close();
		if(i > 0)
			msg = "success,"+d2.toString();
	}
	rs.close();stmt.close();con.close();
    return msg;
}


public static String updateCar(String[] input)throws Exception{
    String msg="no";
	String id="";
	con = getCon();
		java.util.Date d1 = new java.util.Date();
		java.sql.Date d2 = new java.sql.Date(d1.getTime());
		PreparedStatement stat=con.prepareStatement("update addcar set owner_name=?,car_manufacturer=?,seating=?,owner_contact_no=?,owner_address=?,rent_per_day=?,car_rent=?,last_paid=?,paid_amount=? where car_no=?");
		stat.setString(1,input[0]);
		//stat.setString(2,input[1]);
		stat.setString(2,input[2]);
		stat.setString(3,input[3]);
		stat.setString(4,input[4]);
		stat.setString(5,input[5]);
		stat.setDouble(6,Double.parseDouble(input[6]));
		stat.setDate(7,d2);
		stat.setDate(8,d2);
		stat.setString(9,"0");
		stat.setString(10,input[1]);
		int i=stat.executeUpdate();
		stat.close();
		if(i > 0)
			msg = "success,"+d2.toString();
	con.close();
    return msg;
}

public static String ownerPayment(String car,String amount)throws Exception{
    String msg="no";
	double cost = 0;;
	con = getCon();
	java.util.Date d1 = new java.util.Date();
	java.sql.Date d2 = new java.sql.Date(d1.getTime());
	PreparedStatement stat=con.prepareStatement("update addcar set car_rent=?,last_paid=?,paid_amount=? where car_no=?");
	stat.setDate(1,d2);
	stat.setDate(2,d2);
	stat.setString(3,amount);
	stat.setString(4,car);
	int i=stat.executeUpdate();
	stat.close();
	if(i > 0){
		msg = "success";
		System.out.println("Payment Done to Owner");
	}
	con.close();
    return msg;
}
public static String collectRent(String input[])throws Exception{
    String msg="no";
	double cost = 0;;
	con = getCon();
	int i=0;
	double dis=0.0;
	java.util.Date d1 = new java.util.Date();
	java.sql.Date d2 = new java.sql.Date(d1.getTime());
	Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select * from book_car where username='"+input[0]+"'");
    while(rs.next()){
		 i++;
    }
	if(i>5){
		dis=500.0;
	}
	double finale=Double.parseDouble(input[5])-dis;
	PreparedStatement stat=con.prepareStatement("update book_car set car_no=?,kilometer_travels=?,total_rent=?,discount=?,final=? where username=? and total_rent=0");
	stat.setString(1,input[4]);
	stat.setString(2,input[3]);
	stat.setString(3,input[5]);
	stat.setDouble(4,dis);
	stat.setDouble(5,finale);
	stat.setString(6,input[0]);
	int j=stat.executeUpdate();
	stat.close();
	if(j > 0)
		msg = "success";
	con.close();
    return msg;
}
public static boolean checkAvailability(int room,String hotel_id)throws Exception{
    boolean flag = false;
	con = getCon();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select room_no from bookroom where hotel_id='"+hotel_id+"' and room_no='"+room+"' and status='booked'");
    if(rs.next()){
	   flag = true;
    }
	rs.close();stmt.close();con.close();
    return flag;
}

public static String login(String input[])throws Exception{
    String msg="invalid login";
	con = getCon();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select username from customer_register where username='"+input[0]+"' and password='"+input[1]+"'");
    if(rs.next()){
	    msg = "valid";
    }
	rs.close();stmt.close();con.close();
    return msg;
}
public static String getContact(String user)throws Exception{
    String msg="invalid login";
	con = getCon();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select contact_no from customer_register where username='"+user+"'");
    if(rs.next()){
	    msg = rs.getString(1);
    }
	rs.close();stmt.close();con.close();
    return msg;
}
}
