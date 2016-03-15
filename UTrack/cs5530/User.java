package cs5530;

import java.sql.*;

public class User {
    public User()
    {}

    public String registerUser(String login, String name,  boolean userType, String password, String address, String phone_num, Connection con, Statement stmt)
    {
	//String sql = "INSERT INTO Users (login, name, userType, password, address, phone_num) VALUES" +
	//    "('%"+ login + "%','%" + name + "%','%" + password + "%','%" + userType  + "%','%" + address  + "%','%" + phone_num + "%')";

	/*
	userType = true;
	String sql = "INSERT INTO Users (login, name, userType, password, address, phone_num) VALUES" +
	    "('chuy8jay','jesus zarate','password',"+userType+",'222 s main','123-456-7890')";
	*/
	//"('%chuy8jay%','%jesus zarate%','%password%','%userType%','%222 s main%','%123-456-7890%')";

	String sql = "INSERT INTO Users (login, name, userType, password, address, phone_num)" +
	    "VALUES (?, ?, ?, ?, ?, ?)";
       
	String output = "";
	ResultSet rs = null;
	System.out.println("executing " + sql);
	try{       
	    PreparedStatement preparedStatement = con.prepareStatement(sql);
	    preparedStatement.setString(1, login);
	    preparedStatement.setString(2, name);
	    preparedStatement.setBoolean(3, userType);
	    preparedStatement.setString(4, password);
	    preparedStatement.setString(5, address);
	    preparedStatement.setString(6, phone_num);
	    preparedStatement.executeUpdate();
	
	}
	catch(Exception e)
	    {
		System.out.println(e.toString());
		System.out.println("Cannot execute the query");
	    }
	finally
	    {
		try{
		    //if (rs != null && !rs.isClosed())
		    //	rs.close();
		}
		catch(Exception e)
		    {
			System.out.println("Cannot close resultset");
		    }
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

    /*
      public String getUser(String uname, String dname, Statement stmt)
      {
      String sql = "select * from course where cname like '%"+uname+"%' and dname like '%"+dname+"%'";
      String output = "";
      ResultSet rs = null;
      System.out.println("executing "+sql);
      try{
      // Execute sql query
      rs = stmt.executeQuery(sql);

      while (rs.next())
      {
      output+=rs.getString("uname")+"   "+rs.getString("dname")+"\n"; 
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
    */
}
