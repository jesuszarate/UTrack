<%@ page language="java"
import="cs5530.*"
%>
<html>
<head>
<title>Register Utrack</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <!-- Custom styles for this template -->
    <link href="orders.css" rel="stylesheet">
    <script LANGUAGE="javascript">

function check_all_fields(form_obj){
	 alert(form_obj.searchAttribute.value + " = '" + form_obj.attributeValue.value + "'");
	 if( form_obj.attributeValue.value == ""){
	     alert("Search field should be nonempty");
	     		   return false;
			   }
			       return true;
			       }


function check_login_fields(form_obj){
	 alert(form_obj.email.value + " = '" + form_obj.password.value + "'");
	 if( form_obj.password.value == ""){
	     alert("Password should not be empty");
	     		     return false;
			     }
			         return true;
    }

</script> 
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Utrack</a>
        </div>
        <div>
        </div>

      </div>
    </nav>

<div class="container">
  <div class="jumbotron">
    <h1>UTrack</h1>
    <p>Welcome</p> 
  </div>
</dib>

    <%
    Connector connector = new Connector();
    User user = new User();
    String login = request.getParameter("email");
    String pwd = request.getParameter("password");
    if(user.loginUser(login, pwd, connector.stmt)){
    %>
    <p>User <b><%=login%></b> was successfully logged in!</p>

    <%
    }else{
    %>
    <p> Incorrect username and/or password </p>
    <%
    }
    %>
<%
String searchAttribute = request.getParameter("searchAttribute");
if( searchAttribute == null ){
%>

	Form1: Search orders on user name:
	<form name="user_search" method=get onsubmit="return check_all_fields(this)" action="orders.jsp">
	      <input type=hidden name="searchAttribute" value="login">
	      	     <input type=text name="attributeValue" length=10>
		     	    <input type=submit>
			    </form>
			    <BR><BR>
			    Form2: Search orders on director name:
			    <form name="director_search" method=get onsubmit="return check_all_fields(this)" action="orders.jsp">
			    	  <input type=hidden name="searchAttribute" value="director">
				  	 <input type=text name="attributeValue" length=10>
					 	<input type=submit>
						</form>

<%

} else {

  String attributeValue = request.getParameter("attributeValue");
  //Order order = new Order();
  
%>


<%
 connector.closeStatement();
 connector.closeConnection();
}  // We are ending the braces for else here
%>

<BR><a href="orders.jsp"> New query </a></p>

<p>Schema for Order table: <font face="Geneva, Arial, Helvetica, sans-serif">( 
  title varchar(100), quantity integer, login varchar(8), director varchar(10) 
  )</font></p>

</body>
