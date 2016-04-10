<!DOCTYPE html>
<%@ page language="java" import="cs5530.*" %>
<html lang="en">
<head>
    <!-- Bootstrap -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <!-- MDL -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <%
    Connector connector = (Connector)session.getAttribute("connector");
    User user = (User)session.getAttribute("user");

    %>


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

<div class="container">
    <div class="jumbotron">
        <h1>UTrack</h1>
    </div>

    <div class="container">
        <form class="form-signin" onsubmit="return check_all_fields(this)" method=post action="register.jsp">

            <h2 class="form-signin-heading">Register</h2>

            <!-- Theme labels -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input name="username-input" class="mdl-textfield__input" type="text" id="username">
                <label class="mdl-textfield__label input_label" for="username">Username</label>
            </div>

            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input name="name" type="text" class="mdl-textfield__input" type="text" id="name">
                <label class="mdl-textfield__label input_label" for="name">Full Name</label>
            </div>

            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input name="pwd-input" type="password" class="mdl-textfield__input" type="text" id="password">
                <label class="mdl-textfield__label input_label" for="password">Password</label>
            </div>

            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input name="address" type="text" class="mdl-textfield__input" type="text" id="address">
                <label class="mdl-textfield__label input_label" for="address">Address</label>
            </div>

            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input name="phoneNum" type="text" class="mdl-textfield__input" type="text" id="phoneNum">
                <label class="mdl-textfield__label input_label" for="phoneNum">Phone Number</label>
            </div>

            <input type="submit" value="Register" class="btn-lg mdl-button btn-theme btn-block btn-primary mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
        </form>

        <%
        String username = request.getParameter("username-input");
        String name = request.getParameter("name");
        String password = request.getParameter("pwd-input");
        String address = request.getParameter("address");
        String phoneNum = request.getParameter("phoneNum");

        if(username != null && password != null && name != null &&
            address != null && phoneNum != null &&
            username != "" && password != "" && name != "" &&
            address != "" && phoneNum != ""){

            boolean registered = false;
            try{
                registered = user.registerUser(username, name, password, address, phoneNum, connector._con, connector.stmt);
            }catch(Exception e){%>
                <div class="form-signin">
                    Fields must be non-empty
                </div>
            <%}
            if (registered){
                session.setAttribute("username", username);
                session.setAttribute("signedIn", "true");
        %>
                <script>window.location.href='index.jsp';</script>
        <%
            } else {%>
                <div class="form-signin">
                    Username is already taken.
                </div>
        <%}}
        else if(username != null && password != null && name != null &&
                address != null && phoneNum != null){%>
        <div class="form-signin">
                All fields must be non-empty
        </div>
        <%}%>

    </div> <!-- /container -->
</div>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
