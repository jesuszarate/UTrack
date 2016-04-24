<!DOCTYPE html>
<%@ page language="java" import="cs5530.*, java.util.*" %>
<html lang="en">
<head>


    <!-- Bootstrap -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <!-- Include Required Prerequisites -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/latest/css/bootstrap.css" />

    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <!-- Bootstrap -->
    <!-- Optional theme -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap-theme.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

    <!--End Bootstrap -->

    <!--Date Picker-->
    <script src="js/jquery-1.7.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>

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

    <script src="jquery-1.12.0.min.js"></script>

    <%
    Connector connector = (Connector)session.getAttribute("connector");
    User user = (User)session.getAttribute("user");
    POI poi = (POI)session.getAttribute("poi");

    %>

    <script language="JavaScript">
    $(function() {
    $('input[name="birthdate"]').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true
    });
    });

    $(function () {
        $('#datetimepicker1').datetimepicker();
    });

    };

    function back(){
        window.location("index.jsp");
        alert("here");
    }
    </script>

</head>

<body>

<div class="container">
    <div class="jumbotron">
        <h1>Utrack</h1>

        <%
        Object isSuccessful = session.getAttribute("isAddPOI");


        if(isSuccessful != null && isSuccessful.toString().equals("true")){
        session.setAttribute("isAddPOI", "false");
        %>
        <h4>POI Successfully added</h4>
        <%}%>
    </div>

    <div class="container">

        <div class="container">

        </div>
        <!--<form class="form-signin" method="post" action="index.jsp">-->
        <form method=post action="browse.jsp">
            <h2 class="form-signin-heading">Feedback</h2>

            <div class="mdl-layout__tab-panel" id="addVisit">

                <% String poiname = (String)session.getAttribute("POIFeedback");%>
                <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">

                    <div class="mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
                        <div class="mdl-card__supporting-text">
                            <h4><%out.println(poiname);%></h4>
                            <%
                            HashMap<String, String> mp = poi.getPOI(poiname, connector.stmt);
                            Iterator it = mp.entrySet().iterator();
                            while (it.hasNext()) {
                                Map.Entry pair = (Map.Entry)it.next();
                                out.println("<div><b>" + pair.getKey() + " : " + pair.getValue() + "</b></div>");
                                it.remove(); // avoids a ConcurrentModificationException
                            }
                            %>
                        </div>
                    </div>
                </section>

                <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">

                    <div class="mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
                        <div class="mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">



                            <div class="mdl-card__supporting-text">

                                <div>
                                    <!--Rating-->
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="rating" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="rating">
                                        <label class="mdl-textfield__label input_label mdl-color-text--red-900" for="rating">Rating (0 = Terrible, 10 Excellent) </label>
                                        <span class="mdl-textfield__error">Input must be a number</span>
                                    </div>
                                </div>
                                <div>
                                    <div class="form-group">
                                        <label class="mdl-color-text--red-900" for="comment">Comment:</label>
                                        <textarea name="comment" class="form-control" rows="5" id="comment"></textarea>
                                    </div>
                                </div>
                                <%
                                String r = request.getParameter("rating");
                                String comment = request.getParameter("comment");

                                int rating = -1;
                                try {
                                rating = Integer.parseInt(r);

                                } catch(Exception e) {

                                } finally {

                                }

                                out.println(r + " " + comment);
                                if(r != null && comment != null && r != "")
                                {
                                String username = (String)session.getAttribute("username");
                                out.println(username + " ");
                                out.println(poiname + " ");
                                out.println(comment + " ");
                                out.println(rating + " ");
                                poi.giveFeedback(poiname, username, comment, rating, connector.stmt, connector._con);
                                }
                                %>

                            </div>
                            <div>
                                <button type="submit" class="btn-sm mdl-button btn-theme btn-primary mdl-js-button
                                                mdl-button--raised mdl-js-ripple-effect mdl-button--accent mdl-color--red-900"
                                >Submit Feedback</button>
                            </div>
                        </div>
                    </div>
                </section>

            </div>
        </form>
        <input value="Done" onclick="window.location = 'index.jsp';" class="btn-sm mdl-button btn-theme btn-primary mdl-js-button
                                                mdl-button--raised mdl-js-ripple-effect mdl-button--accent mdl-color--red-900"/>
    </div> <!-- /container -->
</div>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
