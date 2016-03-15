package cs5530;

import java.sql.*;

public class User {
    public User()
    {}
		
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
}
