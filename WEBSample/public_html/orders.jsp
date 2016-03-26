<%@ page language="java" import="cs5530.*" %>
<html>
<head>
    <title>Utrack</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <!-- Custom styles for this template -->
    <link href="orders.css" rel="stylesheet">
    <script LANGUAGE="javascript">
function check_all_fields(form_obj){
	alert(form_obj.searchAttribute.value+"='"+form_obj.attributeValue.value+"'");
	if( form_obj.attributeValue.value == ""){
		alert("Search field should be nonempty");
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
        <div id="navbar" class="navbar-collapse collapse">
            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" placeholder="Email" class="form-control">
                </div>
                <div class="form-group">
                    <input type="password" placeholder="Password" class="form-control">
                </div>
                <button type="submit" class="btn btn-success">Sign in</button>
            </form>
        </div><!--/.navbar-collapse -->
    </div>
</nav>

<div class="container">
    <div class="jumbotron">
        <h1>UTrack</h1>
        <p>Welcome</p>
    </div>


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
    Connector connector = new Connector();
    Order order = new Order();

    %>

    <p><b>Listing orders in JSP: </b><BR><BR>

        The orders for query: <b><%=searchAttribute%>='<%=attributeValue%>'</b> are  as follows:<BR><BR>
        <%=order.getOrders(searchAttribute, attributeValue, connector.stmt)%> <BR><BR>

        <b>Alternate way (servlet method):</b> <BR><BR>
        <%
        out.println("The orders for query: <b>"+searchAttribute+"='"+attributeValue+
            "'</b> are as follows:<BR><BR>");
        out.println(order.getOrders(searchAttribute, attributeValue, connector.stmt));
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
    </div>

</body>
</html>