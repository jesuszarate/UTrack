package cs5530;

import java.lang.*;
import java.sql.*;
import java.io.*;

public class utrack {

    static String name;
    static String login = null;
    static String password;
    static String address;
    static String phone_num;
    static Connector con = null;
    static String choice;
    static String sql = null;
    static int c = 0;
    static User user;
    static boolean logedIn = false;

    /**
     * @param args
     */
    public static void displayMenu()
    {
	System.out.println("        Welcome to the UTrack System     ");
	if(!logedIn){
	    System.out.println("1. Login: ");
	    System.out.println("2. Register user:");
	}
	System.out.println("3. Add Visit to POI:");
	System.out.println("4. enter your own query:");
	System.out.println("5. exit:");
	System.out.println("please enter your choice:");
    }
	
    public static void main(String[] args) {
	user = new User();

	System.out.println("Example for cs5530");

	try{	    
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
		    }catch (Exception e){	            		 
			continue;
		    }
		    
		    if (c == 0){
			user.login = "jay8chuy";
			user.addVisit("Jack Mormon", 20, 2, "12345", con.stmt, con._con);
		    }
		    
		    if (c<1 | c>5)
			continue;

		    switch (c){
		    case 1: // Login
			login(in);
			break;
		    case 2: // Register
			registerUser(in);
			break;
		    case 3: // Add visit
			if(logedIn)
			    addVisit(in);
			else
			    System.out.println(
					       "You are not logged in. Log in and try again.");
			break;
		    case 4:
			break;
		    default:
			System.out.println("Remeber to pay us!");
			con.stmt.close(); 				    
			break;
		    }
		}
	}
	catch (Exception e){
	    e.printStackTrace();
	    System.err.println ("Either connection error or query execution error!");
	}
	finally{
	    if (con != null){
		try{
		    con.closeConnection();
		    System.out.println ("Database connection terminated");
		}
			 
		catch (Exception e) { /* ignore close errors */ }
	    }	 
	}
    }

    public static void registerUser(BufferedReader in) throws IOException {
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
				           
	System.out.println(
			   user.registerUser(login, name, true, password, address, 
					     phone_num, con._con, con.stmt));
    }

    public static void login(BufferedReader in) throws IOException {

	System.out.println("Enter your user login:");
	while ((login = in.readLine()) == null && login.length() == 0);
	
	System.out.println("Enter your password:");
	while ((password = in.readLine()) == null && password.length() == 0);

	if (user.loginUser(login, password, con.stmt)){
	    logedIn = true;
	    System.out.println("Login Successfull!");	    
	}
	else{
	    login = null;
	    password = null;
	    System.out.println("Invalid password or username");
	}
    }

    public static void addVisit(BufferedReader in) throws IOException{
	POI poi = new POI();
	String pname;
	String date;
	String answer;
	String scost;
	String snumOfPeople;

	System.out.println("\n" + poi.getPOIs(con.stmt));
	
	System.out.println("Which POI did you visit:");
	while ((pname = in.readLine()) == null && pname.length() == 0);	

	System.out.println("What was the cost of the visit: ");
	while ((scost = in.readLine()) == null && scost.length() == 0);	

	System.out.println("How many people attended: ");
	while ((snumOfPeople = in.readLine()) == null && snumOfPeople.length() == 0);

	System.out.println("What was the date of the visit\n"+
			   "add in this format (YYYYDDMM):");
	while ((date = in.readLine()) == null && date.length() == 0);	

	System.out.println("You visited " + pname + " on " + date + 
			   "\nAre you sure you want to add this to your visits?" + 
			   "\nType yes/no");
	while ((answer = in.readLine()) == null && answer.length() == 0);	

	int cost;
	int numOfPeople;
	try{
	    cost = Integer.parseInt(scost);
	    numOfPeople = Integer.parseInt(snumOfPeople);
	}
	catch(Exception e){
	    System.out.println("Make sure the cost and the number of people is a number");
	    return;
	}
	answer = answer.toLowerCase();
	if (answer.equals("yes")){
	    user.addVisit(pname, cost, numOfPeople, date, con.stmt, con._con);
	}
    }
}
