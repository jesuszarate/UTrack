package cs5530;

import java.sql.*;

public class User {

    String login;
    String name;
    
    public User()
    {}
    
    public String registerUser(String _login, String _name,  boolean _userType, String _password, 
			       String _address, String _phone_num, Connection con, Statement stmt){
	login = _login;
	name = _name;	

	String sql = "INSERT INTO Users (login, name, userType, password, address, phone_num)" +
	    "VALUES (?, ?, ?, ?, ?, ?)";
       
	String output = "";
	ResultSet rs = null;
	System.out.println("executing " + sql);
	try{       
	    PreparedStatement preparedStatement = con.prepareStatement(sql);
	    preparedStatement.setString(1, _login);
	    preparedStatement.setString(2, _name);
	    preparedStatement.setBoolean(3, _userType);
	    preparedStatement.setString(4, _password);
	    preparedStatement.setString(5, _address);
	    preparedStatement.setString(6, _phone_num);
	    preparedStatement.executeUpdate();
	}
	catch(Exception e){	    
	    System.out.println(e.toString());
	    System.out.println("Cannot execute the query");
	}

	return output;
    }

    public String getUsers(Statement stmt){
	
	String sql = "select * from Users";
	String output = "";
	ResultSet rs = null;
	System.out.println("executing "+sql);
	try{
	    // Execute sql query
	    rs = stmt.executeQuery(sql);

	    while (rs.next())
		{
		    output+=rs.getString("login")+"   "+rs.getString("name")+"\n"; 
		}
			     
	    rs.close();
	}
	catch(Exception e)
	    {
		System.out.println("Cannot execute the query");
	    }
	finally
	    {
		try{
		    if (rs!=null && !rs.isClosed())
			rs.close();
		}
		catch(Exception e)
		    {
			System.out.println("Cannot close resultset");
		    }
	    }
	return output;
    }


    public boolean loginUser(String login, String password, Statement stmt){
    
	String sql = "SELECT * " +
	    "FROM Users " +
	    "WHERE login = '" + login + "'";

	String output = "";
	ResultSet rs = null;
	System.out.println("Executing: " + sql);
	try{
	    // Execute sql query
	    rs = stmt.executeQuery(sql);

	    String p;
	    while (rs.next()){
		login = rs.getString("login");
		name = rs.getString("name");
		p = rs.getString("password");
		output += 
		    "Username: " + login +  "\n" + 
		    "Password: " + p + "\n";

		if(password.equals(p))
		    return true;
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
	login = null;
	password = null;
	return false;
    }
    
    public String addVisit(String _pname, int _cost, int _numberOfPeople, String _date,
			   Statement stmt, Connection con){
	int pid = -1;
	//int vid = 301; // Auto increment this number

	
	String sql = "SELECT pid FROM POI WHERE name LIKE '%" + _pname +"%'";
	ResultSet rs = null;
	try{       
	    rs = stmt.executeQuery(sql);

	    while (rs.next())
		pid = rs.getInt("pid");
	    
	    rs.close();
	}
	catch(Exception e){	    
	    System.out.println(e.toString());
	    System.out.println("Cannot execute the query");
	}
	finally{
	    try{
		if (rs != null && !rs.isClosed())
		    rs.close();
	    }
	    catch(Exception e){
		System.out.println("cannot close resultset");
	    }
	}

	String output = "";
	try{       
	    sql = "INSERT INTO VisEvent (cost, numberofheads)" +
	    "VALUES (?, ?)";

	    PreparedStatement preparedStatement = 
		con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

	    preparedStatement.setInt(1, _cost);
	    preparedStatement.setInt(2, _numberOfPeople);

	    preparedStatement.executeUpdate();

	    rs = preparedStatement.getGeneratedKeys();
	    	
	    int vid = 0;
	    if (rs.next()){
		vid = rs.getInt(1);
	    }

	    sql = "INSERT INTO Visit (login, pid, vid, visitdate)" +
	    "VALUES (?, ?, ?, ?)";

	    preparedStatement = con.prepareStatement(sql);
	    preparedStatement.setString(1, login);
	    preparedStatement.setInt(2, pid);
	    preparedStatement.setInt(3, vid);
	    // Todo: Change this to _date
	    preparedStatement.setDate(4, java.sql.Date.valueOf("2013-09-04"));

	    preparedStatement.executeUpdate();
	    System.out.println("Successfully added your visit to " + _pname);
	}
	catch(Exception e){	    
	    System.out.println(e.toString());
	    System.out.println("Cannot execute the query 2");
	}
	
	return output;

    }
    

}
