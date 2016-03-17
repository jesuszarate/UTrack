package cs5530;

import java.sql.*;
import java.util.HashMap;

public class POI {

    String pid;
    String name;    
    
    public POI()
    {}

    public String addPOI(String _name, String _category, String _address, String _URL, 
			 String _tel_num, int _yr_est, String _hours, int _price, 
			 Connection con, Statement stmt){

	String sql = 
	    "INSERT INTO POI (name, category, address, URL, tel_num, yr_est, hours, price)" +
	    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
       
	String output = "";
	ResultSet rs = null;
	System.out.println("executing " + sql);
	try{       
	    PreparedStatement preparedStatement = con.prepareStatement(sql);

	    preparedStatement.setString(1, _name);
	    preparedStatement.setString(2, _category);
	    preparedStatement.setString(3, _address);
	    preparedStatement.setString(4, _URL);
	    preparedStatement.setString(5, _tel_num);
	    preparedStatement.setInt(6, _yr_est);
	    preparedStatement.setString(7, _hours);
	    preparedStatement.setInt(8, _price);

	    preparedStatement.executeUpdate();
	}
	catch(Exception e){	    
	    System.out.println(e.toString());
	    System.out.println("Cannot execute the query");
	}

	return output;
    }

    public String updatePOI(String poiName,
			    String setQuery,
			    Connection con, Statement stmt){

	String sql = 
	    "UPDATE POI" +
	    " SET " + setQuery + 
	    " WHERE name = '" + poiName + "'";
       
	String output = "";
	ResultSet rs = null;
	System.out.println("executing " + sql);
	try{       
	    PreparedStatement preparedStatement = con.prepareStatement(sql);
	    preparedStatement.executeUpdate();
	}
	catch(Exception e){	    
	    System.out.println(e.toString());
	    System.out.println("Cannot execute the query");
	}

	return output;
    }


    public String getPOIs(Statement stmt){
    
	String sql = "SELECT * " +
	    "FROM POI ";

	String output = "";
	ResultSet rs = null;
	System.out.println("Executing: " + sql);
	try{
	    // Execute sql query
	    rs = stmt.executeQuery(sql);

	    String p;
	    while (rs.next()){
		pid = rs.getString("pid");
		name = rs.getString("name");

		output += 
		    "pid: " + pid +  " -> " + 
		    "name: " + name  + "\n";
	    }			     
	    rs.close();
	}
	catch(Exception e){
	    System.out.println(e.toString());
	    System.out.println("Cannot execute the query");
	}
	finally{	 
	    try{
		if (rs!=null && !rs.isClosed())
		    rs.close();
	    }
	    catch(Exception e){
		System.out.println("Cannot close resultset");
	    }
	}
	return output;
    }
    
    public int getPid(String pname, Statement stmt){
	String sql = "SELECT pid " +
	    "FROM POI " +
	    "WHERE name = '" + pname + "'";

	String output = "";
	ResultSet rs = null;
	System.out.println("Executing: " + sql);
	try{
	    rs = stmt.executeQuery(sql);

	    String p;
	    if (rs.next()){
		pid = rs.getString("pid");
	    }	    	    
	    rs.close();
	    
	    return Integer.parseInt(pid);
	}
	catch(Exception e){
	    System.out.println(e.toString());
	    System.out.println("Cannot execute the query");
	}
	finally{	 
	    try{
		if (rs!=null && !rs.isClosed())
		    rs.close();
	    }
	    catch(Exception e){
		System.out.println("Cannot close resultset");
	    }
	}
	return -1;
    }

    public String setFavoritePOI(String pname, String login,
				 Statement stmt, Connection con){		
	int pid = getPid(pname, stmt);
	System.out.println(pid);
	String date;
	String sql = "INSERT INTO Favorites (pid, login, fvdate)" + 
	    "VALUES (?, ?, ?)";
       
	String output = "";
	ResultSet rs = null;
	System.out.println("executing " + sql);
	try{       
	    PreparedStatement preparedStatement = con.prepareStatement(sql);
	    preparedStatement.setInt(1, pid);
	    preparedStatement.setString(2, login);
	    preparedStatement.setDate(3, java.sql.Date.valueOf(java.time.LocalDate.now()));

	    preparedStatement.executeUpdate();
	}
	catch(Exception e){	    
	    System.out.println(e.toString());
	    System.out.println("Cannot execute the query");
	}

	return output;
    }


    public int getFid(int pid, String login, Statement stmt){
	String sql = "SELECT fid " +
	    "FROM Feedback " +
	    "WHERE login = '" + login + "' " + 
	    "AND pid = '" + pid  + "'";

	String fid = "";
	String output = "";
	ResultSet rs = null;
	System.out.println("Executing: " + sql);
	try{
	    rs = stmt.executeQuery(sql);

	    String p;
	    if (rs.next()){
		fid = rs.getString("fid");
	    }	    	    
	    rs.close();
	    
	    return Integer.parseInt(fid);
	}
	catch(Exception e){
	    System.out.println(e.toString());
	    System.out.println("Cannot execute the query");
	}
	finally{	 
	    try{
		if (rs!=null && !rs.isClosed())
		    rs.close();
	    }
	    catch(Exception e){
		System.out.println("Cannot close resultset");
	    }
	}
	return -1;
    }
    public String giveFeedback(String pname, String login, String text, int score,
			       Statement stmt, Connection con){
	int pid = getPid(pname, stmt);
	System.out.println(pid);
	String date;
	String sql = "INSERT INTO Feedback (pid, login, text, fbdate, score)" + 
	    "VALUES (?, ?, ?, ?, ?)";
       
	String output = "";
	ResultSet rs = null;
	System.out.println("executing " + sql);
	try{       
	    PreparedStatement preparedStatement = con.prepareStatement(sql);
	    preparedStatement.setInt(1, pid);
	    preparedStatement.setString(2, login);
	    preparedStatement.setString(3, text);
	    preparedStatement.setDate(4, java.sql.Date.valueOf(java.time.LocalDate.now()));
	    preparedStatement.setInt(5, score);

	    preparedStatement.executeUpdate();
	}
	catch(Exception e){	    
	    System.out.println(e.toString());
	    System.out.println("Cannot execute the query");
	}

	return output;
    }

    public String getFeedbackRecords(Statement stmt, Connection con){
	String sql = "SELECT * " +
	    "FROM Feedback F, POI P " + 
	    "WHERE F.pid = P.pid";

	String output = "";
	ResultSet rs = null;
	System.out.println("Executing: " + sql);
	try{
	    // Execute sql query
	    rs = stmt.executeQuery(sql);

	    String p;
	    while (rs.next()){
		output += 
		    "Username:  " + rs.getString("login") +  ",\t " + 
		    "POI: " + rs.getString("name") + ",\t" +
		    "Text: " + rs.getString("text") + ",\t" +
		    //		    "Date: " + rs.getString("fbdate") + ", " + 
		    "Score: " + rs.getString("score") + "\n";
	    }			     
	    rs.close();
	}
	catch(Exception e){
	    System.out.println(e.toString());
	    System.out.println("Cannot execute the query");
	}
	finally{	 
	    try{
		if (rs!=null && !rs.isClosed())
		    rs.close();
	    }
	    catch(Exception e){
		System.out.println("Cannot close resultset");
	    }
	}
	return output;
    }

    public String addUsefulnessRating(String login, String uname, String pname, String rating,
				      Statement stmt, Connection con){
	
	int pid = getPid(pname, stmt);
	int fid = getFid(pid, login, stmt);

	System.out.println(pid);
	String date;
	String sql = "INSERT INTO Rates (login, fid, rating)" + 
	    "VALUES (?, ?, ?)";
       
	String output = "";
	ResultSet rs = null;
	System.out.println("executing " + sql);
	try{       
	    PreparedStatement preparedStatement = con.prepareStatement(sql);
	    preparedStatement.setString(1, login);
	    preparedStatement.setInt(2, fid);
	    preparedStatement.setString(3, rating);

	    preparedStatement.executeUpdate();
	}
	catch(Exception e){	    
	    System.out.println(e.toString());
	    System.out.println("Cannot execute the query");
	}

	return output;
    }
}
