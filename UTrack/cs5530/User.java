package cs5530;

import java.sql.*;

public class User {

    private String login;
    private String name;
    private boolean isAdmin = false;
    
    public User()
    {}
    
    public String getLogin(){
	return this.login;
    }
    public void setLogin(String login){
	this.login = login;
    }

    public boolean isAdmin(){
	return this.isAdmin;
    }
    
    
    public String registerUser(String _login, String _name,  boolean _userType, String _password, 
			       String _address, String _phone_num, Connection con, Statement stmt){
	login = _login;
	name = _name;	

	String sql = "INSERT INTO Users (login, name, userType, password, address, phone_num, isAdmin)" +
	    "VALUES (?, ?, ?, ?, ?, ?, ?)";
       
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
	    preparedStatement.setBoolean(7, false);
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


    public boolean loginUser(String _login, String password, Statement stmt){
	this.login = _login;
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

		if(password.equals(p)){
		    isAdmin = rs.getBoolean("isAdmin");
		    return true;
		}
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
    
    public int addVisit(String _pname, int _cost, int _numberOfPeople, String _date,
			   Statement stmt, Connection con){
	int pid = -1;
	
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

	    String[] d = _date.split("-");
	    _date = d[2] +"-"+d[0]+"-"+d[1];

	    preparedStatement = con.prepareStatement(sql);
	    preparedStatement.setString(1, this.login);
	    preparedStatement.setInt(2, pid);
	    preparedStatement.setInt(3, vid);
	    preparedStatement.setDate(4, Date.valueOf(_date));

	    preparedStatement.executeUpdate();
	    System.out.println(this.login + ": Successfully added your visit to " + _pname);
	}
	catch(Exception e){	    
	    System.out.println(e.toString());
	    System.out.println("\n\n*****Unable to add "+ _pname +" to Vistis *****\n\n");
	}
	
	return pid;

    }
    
    public String setTrustOrUntrust(String other_login, boolean isTrusted, 
				    Statement stmt, Connection con){
		
	if (hasTrust(other_login, stmt, con)){
	    return updateTrustOrUntrust(other_login, isTrusted, stmt, con);
	}

	String sql = "INSERT INTO Trust (login1, login2, isTrusted)" +
	    "VALUES (?, ?, ?)";
	
	String output = "";
	ResultSet rs = null;
	System.out.println("executing " + sql);
	try{       
	    PreparedStatement preparedStatement = con.prepareStatement(sql);
	    preparedStatement.setString(1, this.login);
	    preparedStatement.setString(2, other_login);
	    preparedStatement.setBoolean(3, isTrusted);

	    preparedStatement.executeUpdate();
	}
	catch(Exception e){	    
	    System.out.println(e.toString());
	    System.out.println("Cannot execute the query");
	}

	if (isTrusted)
	    System.out.println(other_login + " is now Trusted by you now");
	else
	    System.out.println(other_login + " not Trusted by you now");
	return output;
    }

    public String updateTrustOrUntrust(String other_login, boolean isTrusted, 
				    Statement stmt, Connection con){		
		    
	String sql = 
	    "UPDATE Trust" +
	    " SET isTrusted = ?" +
	    " WHERE login1 = ?" + 
	    " AND login2 = ?";

       
	String output = "";
	ResultSet rs = null;
	System.out.println("executing " + sql);
	try{  
	    
	    PreparedStatement preparedStatement = con.prepareStatement(sql);
	    preparedStatement.setBoolean(1, isTrusted);
	    preparedStatement.setString(2, this.login);
	    preparedStatement.setString(3, other_login);


	    preparedStatement.executeUpdate();
	}
	catch(Exception e){	    
	    System.out.println(e.toString());
	    System.out.println("Cannot execute the query");
	}

	if (isTrusted)
	    System.out.println(other_login + " is now Trusted by you now");
	else
	    System.out.println(other_login + " not Trusted by you now");
	return output;
    }
    

    public boolean hasTrust(String other_login, Statement stmt, Connection con){
	
	String sql = "SELECT EXISTS(SELECT 1 FROM Trust WHERE login1 ='" + this.login  + "' " +
	    " AND login2 = '"+ other_login +"')";
	
	String output = "";
	ResultSet rs = null;
	System.out.println("Executing: " + sql);
	try{
	    // Execute sql query
	    rs = stmt.executeQuery(sql);

	    String p;	    
	    while (rs.next()){
		int i = rs.getInt(1);

		return i == 1 ? true : false;
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
	return false;
    }

    public int degreesOfSeperation(String login1, String login2, Statement stmt){
	int res = 0;
	if(isOneDegreeOfSeperation(login1, login2, stmt)){
	    res = 1;
	}
	else if(isTwoDegreesOfSeperation(login1, login2, stmt)){
	    res = 2;
	}
	return res;

    }

    
    
    public boolean isOneDegreeOfSeperation(String login1, String login2, Statement stmt){
	String sql = "select count(*) from" +
	    " (select distinct * " +
	    " from Favorites " +
	    " where login='"+login1+"') R1," +
	    " (select distinct * " +
	    " from Favorites " +
	    " where login='"+login2+"') R2 " +
	    " where R1.pid = R2.pid;";
	    
	String output = "";
	ResultSet rs = null;
	//System.out.println("Executing: " + sql);
	try{
	    // Execute sql query
	    rs = stmt.executeQuery(sql);

	    String p;	    
	    while (rs.next()){
		int i = rs.getInt(1);

		return i > 0 ? true : false;
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
	return false;	   
    }
    public boolean isTwoDegreesOfSeperation(String login1, String login2, Statement stmt){

	String sql = "select count(*)" +
	    " from" +
	    " (select R2.pid, R2.login, R2.fvdate" +
	    " from" +
	    " (select distinct F1.pid, F1.login, F1.fvdate" +
	    " from Favorites F1 where login='"+login1+"') R1," +
	    " Favorites R2" +
	    " where" +
	    " R1.pid = R2.pid" +
	    " and R2.login <> '"+login1+"') P1," +
	    " (select R2.pid, R2.login, R2.fvdate" +
	    " from" +
	    " (select distinct F1.pid, F1.login, F1.fvdate" + 
	    " from Favorites F1 where login='"+login2+"') R1," +
	    " Favorites R2" +
	    " where" +
	    " R1.pid = R2.pid" +
	    " and R2.login <> '"+login2+"') P2" +
	    " WHERE P1.login = P2.login";
	    
	String output = "";
	ResultSet rs = null;
	System.out.println("Executing: " + sql);
	try{
	    // Execute sql query
	    rs = stmt.executeQuery(sql);

	    String p;	    
	    while (rs.next()){
		int i = rs.getInt(1);

		return i > 0 ? true : false;
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
	return false;	   
    }

}
