package cs5530;


import java.lang.*;
import java.sql.*;
import java.io.*;

public class testdriver2 {

	/**
	 * @param args
	 */
	public static void displayMenu()
	{
	    System.out.println("        Welcome to the UTrack System     ");
	    System.out.println("1. search a course by cname and dname:");
	    System.out.println("2. Add a user:");
	    System.out.println("3. Get Users:");
	    System.out.println("4. enter your own query:");
	    System.out.println("5. exit:");
	    System.out.println("pleasse enter your choice:");
	}
	
	public static void main(String[] args) {
	    // TODO Auto-generated method stub
	    System.out.println("Example for cs5530");
	    Connector con = null;
	    String choice;
	    String cname;
	    String dname;
	    String sql = null;
	    int c = 0;
	    try
		{
		    //remember to replace the password
		    con = new Connector();
		    System.out.println ("Database connection established");
		    
		    BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
	            
		    while(true)
			{
			    displayMenu();
			    while ((choice = in.readLine()) == null && choice.length() == 0);
			    try{
				c = Integer.parseInt(choice);
			    }catch (Exception e)
				{
	            		 
				    continue;
				}
			    if (c<1 | c>5)
				continue;
			    if (c == 2)
				{
				    String name;
				    String login;
				    String password;
				    String address;
				    String phone_num;

				    System.out.println("Enter your user login:");
				    while ((login = in.readLine()) == null && login.length() == 0);
				    
				    System.out.println("Enter your full name:");
				    while ((name = in.readLine()) == null && name.length() == 0);

				    System.out.println("Enter your password:");
				    while ((password = in.readLine()) == null && password.length() == 0);

				    System.out.println("Enter your address:");
				    while ((address = in.readLine()) == null && address.length() == 0);

				    System.out.println("Enter your phone number:");
				    while ((phone_num = in.readLine()) == null && phone_num.length() == 0);
				    
				    User user = new User();
				    System.out.println(user.registerUser(login, name, true, password, address, phone_num, con._con, con.stmt));
				}
			    if (c==1)
				{
				    System.out.println("please enter a cname:");
				    while ((cname = in.readLine()) == null && cname.length() == 0);
				    System.out.println("please enter a dname:");
				    while ((dname = in.readLine()) == null && dname.length() == 0);
				    Course course=new Course();
				    System.out.println(course.getCourse(cname, dname, con.stmt));
				}
			    if (c==3)
				{
				    
				    User user = new User();
				    System.out.println(user.registerUser("", "", true,"", "", "", con._con, con.stmt));

				    //User user = new User();
				    //System.out.println(user.getUsers(con.stmt));
				}
			    else if (c == 4)
				{	 
				    System.out.println("please enter your query below:");
				    while ((sql = in.readLine()) == null && sql.length() == 0)
					System.out.println(sql);
				    ResultSet rs=con.stmt.executeQuery(sql);
				    ResultSetMetaData rsmd = rs.getMetaData();
				    int numCols = rsmd.getColumnCount();
				    while (rs.next())
					{
					    //System.out.print("cname:");
					    for (int i=1; i<=numCols;i++)
						System.out.print(rs.getString(i)+"  ");
					    System.out.println("");
					}
				    System.out.println(" ");
				    rs.close();
				}
			    else
				{   
				    System.out.println("Remeber to pay us!");
				    con.stmt.close(); 
				    
				    break;
				}
			}
		}
	    catch (Exception e)
		{
		    e.printStackTrace();
		    System.err.println ("Either connection error or query execution error!");
		}
	    finally
		{
		    if (con != null)
			{
			    try
				{
				    con.closeConnection();
				    System.out.println ("Database connection terminated");
				}
			 
			    catch (Exception e) { /* ignore close errors */ }
			}	 
		}
	}
}
