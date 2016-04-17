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

    <script language="JavaScript">

    </script>

</head>

<body>

<div class="container">
    <div class="jumbotron">
        <h1>Add Visit</h1>
    </div>

    <div class="container">

        <!--<form class="form-signin" method="post" action="index.jsp">-->
        <form class="form-signin" method=post action="signin.jsp">
            <h2 class="form-signin-heading">Please sign in</h2>

            <form method=post action="index.jsp#addVisit">
                <div class="mdl-layout__tab-panel" id="addVisit">
                    <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">

                        <div class="mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
                            <div class="mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
                                <div>
                                    <h4>New Visit</h4>
                                </div>
                                <div class="mdl-card__supporting-text">

                                    <!--POI Selection-->
                                    <div class="mdl-textfield">
                                        <label class="input_label mdl-color-text--red-900">Select POI</label>
                                        <input list="pois" name="poi">
                                        <datalist id="pois">
                                            <%
                                            for(String s : poi.getPOIList(connector.stmt)){
                                            out.println("<option value=\"" + s + "\">");
                                            }
                                            %>
                                        </datalist>
                                    </div>

                                    <div class="dropdown">
                                        <!--<button list="browsers1"class="mdl-button mdl-js-button dropdown-toggle mdl-color-text&#45;&#45;red-900" type="button" data-toggle="dropdown">-->
                                        <!--<div class="marg">-->
                                        <!--<strong>-->
                                        <!--<h7>-->
                                        <!--Choose POI-->
                                        <!--<span class="caret"></span>-->
                                        <!--</h7>-->
                                        <!--</strong>-->
                                        <!--</div>-->
                                        <!--</button>-->
                                        <!--<ul class="dropdown-menu mdl-color-text&#45;&#45;red-900">-->
                                        <!--<%-->
                                        <!--for(String s : poi.getPOIList(connector.stmt)){-->
                                        <!--out.println("<li><a>" + s + "</a></li>");-->
                                        <!--}-->
                                        <!--%>-->
                                        <!--</ul>-->
                                    </div>

                                    <!--Cost-->
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="cost-in" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="cost">
                                        <label class="mdl-textfield__label input_label mdl-color-text--red-900" for="cost">Cost</label>
                                        <span class="mdl-textfield__error">Input must be a number</span>
                                    </div>

                                    <!--Party Count-->
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="partyCount-in" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="partyCount">
                                        <label class="mdl-textfield__label input_label mdl-color-text--red-900" for="partyCount">Number of people</label>
                                        <span class="mdl-textfield__error">Input must be a number</span>
                                    </div>

                                    <!--Date-->
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" name="birthdate"/>
                                    </div>

                                    <div>
                                        <div>
                                            <button type="button" data-toggle="modal" data-target="#myModal"
                                                    class="btn-sm mdl-button btn-theme btn-primary mdl-js-button
                                                mdl-button--raised mdl-js-ripple-effect mdl-button--accent mdl-color--red-900">
                                                Add Visit
                                            </button>
                                            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>
                                            <!-- Modal -->
                                            <div class="modal fade" id="myModal" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Modal Header</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Some text in the modal.</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>


                                        <%
                                        String p = request.getParameter("poi");
                                        String cost = request.getParameter("cost-in");
                                        String partyCount = request.getParameter("partyCount-in");
                                        String date = request.getParameter("date-in");

                                        if(poi != null && cost != null && partyCount != null && date != null)
                                        {
                                        //int pid = user.addVisit(p, cost, partyCount, date, connector.stmt, connector._con);
                                        out.println("It worked!!!!");
                                        out.println(date);
                                        }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </form>
        </form>

        <%
        String username = request.getParameter("username-input");
        String password = request.getParameter("pwd-input");

        if(username != null && password != null){
            if (user.loginUser(username, password, connector.stmt)){
                session.setAttribute("username", username);
                session.setAttribute("signedIn", "true");
        %>
                <script>window.location.href='index.jsp';</script>
        <%
            } else {%>
            <div class="form-signin">
                Incorrect username or password, please try again!
            </div>
        <%}}%>

    </div> <!-- /container -->
</div>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
