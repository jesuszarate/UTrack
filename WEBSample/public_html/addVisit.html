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


        ArrayList<visit> visits = (ArrayList<visit>)session.getAttribute("visits");
        if(visits == null){
            visits = new ArrayList<visit>();
            session.setAttribute("visits", visits);
        }

    %>

        <!--poi : form.poi.value,-->
        <!--cost : form.cost.value,-->
        <!--partyCount : form.partyCount.value,-->
        <!--date : form.date.value-->

        <script type="text/javascript">
        function submitVisit(){
            alert("submitting");
            $.get('visitData.jsp', {submit : "true"
                                    },
                           function (output)
                           {
                                $('#addResults').html(output).show();
                           });
            window.location="index.jsp";
        }

        function addVisit(){

            var p = document.getElementById('poi-id').value;
            var c = document.getElementById('cost').value;
            var pc = document.getElementById('partyCount').value;
            var d = document.getElementById('date').value;

            if(p != "" && c != "" && pc != "" && d != ""){
                var query = "";
                $.get('visitData.jsp', {add : "true",
                                        pname : form.poi.value,
                                        cost : form.cost.value,
                                        partyCount : form.partyCount.value,
                                        date : form.date.value},
                           function (output)
                           {
                                $('#addResults').html(output).show();
                           });
                document.getElementById("error").innerHTML = "";
                document.getElementById('poi-id').innerHTML = "";
                document.getElementById('cost').innerHTML = "";
                document.getElementById('partyCount').innerHTML = "";
                document.getElementById('date').innerHTML = "";
            }
            else{
                 document.getElementById("error").innerHTML = "* Must fill in all fields";
            }
        }

        function add(){
        alert("here");
              <!--var query = "";-->
            $.get('visitData.jsp', {add : "true",
                                    poi : form.poi.value,
                                    cost : form.cost.value,
                                    partyCount : form.partyCount.value,
                                    date : form.date.value},
                       function (output)
                       {
                            $('#addResults').html(output).show();
                       });
    }

    </script>

        <style>
            .demo-card-wide.mdl-card {
            width: 512px;
            }
            .demo-card-wide > .mdl-card__title {
            color: #fff;
            height: 176px;
            background: url('../assets/demos/welcome_card.jpg') center / cover;
            }
            .demo-card-wide > .mdl-card__menu {
            color: #fff;
            }
        </style>


        </head>

<body>

<div class="container">
    <div class="jumbotron">
        <h1>Utrack</h1>
    </div>

        <!--<form class="form-signin" method="post" action="index.jsp">-->
            <form name="form">
                <h2 class="form-signin-heading">New visit</h2>

                <div class="mdl-layout__tab-panel" id="addVisit">

                    <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">

                        <div class="mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
                            <div class="mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">

                                <div class="mdl-card__supporting-text">

                                    <!--POI Selection-->
                                    <div class="mdl-textfield">
                                        <div>
                                            <div>
                                                <label id="error" class="mdl-color-text--blue"></label>
                                            </div>
                                            <label class="input_label mdl-color-text--red-900">Select POI</label>
                                        </div>
                                        <input list="pois" name="poi" id="poi-id">
                                        <datalist id="pois">
                                            <%
                                            for(String s : poi.getPOIList(connector.stmt)){
                                            out.println("<option value=\"" + s + "\">");
                                            }
                                            %>
                                        </datalist>
                                    </div>

                                    <div>
                                    <!--Cost-->
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input name="cost" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="cost">
                                            <label class="mdl-textfield__label input_label mdl-color-text--red-900" for="cost">Cost</label>
                                            <span class="mdl-textfield__error">Input must be a number</span>
                                        </div>
                                    </div>

                                    <div>
                                    <!--Party Count-->
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="partyCount" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="partyCount">
                                        <label class="mdl-textfield__label input_label mdl-color-text--red-900" for="partyCount">Number of people</label>
                                        <span class="mdl-textfield__error">Input must be a number</span>
                                    </div>
                                    </div>
                                    <div>
                                    <!--Date-->
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input id="date" class="mdl-textfield__input" type="text" name="date"/>
                                    </div>
                                    </div>
                                        <%
                                        String p = request.getParameter("poi");
                                        String cost = request.getParameter("cost-in");
                                        String partyCount = request.getParameter("partyCount-in");
                                        String date = request.getParameter("date-in");

                                        try {
                                            int c = Integer.parseInt(cost);
                                            int pc = Integer.parseInt(partyCount);

                                            if(p != null && cost != null && partyCount != null && date != null)
                                            {
                                                int pid = user.addVisit(p, c, pc, date, connector.stmt, connector._con);
                                            }
                                        } catch(Exception e) {

                                        } finally {

                                        }
                                    %>
                                    <input type="button" onclick="addVisit()" class="btn-sm mdl-button btn-theme btn-primary mdl-js-button
                                                mdl-button--raised mdl-js-ripple-effect mdl-button--accent mdl-color--red-900"
                                           value="Add"/>
                                    <input type="button" onclick="submitVisit()" class="btn-sm mdl-button btn-theme btn-primary mdl-js-button
                                                mdl-button--raised mdl-js-ripple-effect mdl-button--accent mdl-color--red-900"
                                           value="Submit Visits"/>
                                </div>


                            </div>


                        </div>
                    </section>
                    <div id="addResults">
                    <%
                    visits = (ArrayList<visit>)session.getAttribute("visits");
                    int size = visits.size();
                    for(int i = 0; i < size; i++){
                    visit v = visits.get(i);
                    out.println(

                    "<div class=\"mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone\">" +
                        "<div class=\"mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone\">" +
                            "<div class=\"mdl-card__supporting-text\">" +

                                "<section class=\"section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp\">" +
                                "<div class=\"mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone\">" +
                                "<div class=\"mdl-card__supporting-text\">" +
                                    "<div><p><b>" + v.pname + "</b></p></div>" +
                                    "<div><p><b>Cost</b>\t" + v.cost + "</p></div>" +
                                    "<div><p><b>Number of People</b>\t" + v.numOfPeople + "</p></div>" +
                                    "<div><p><b>Date</b>\t" + v.date + "</p></div>" +
                                "</div>" +

                                "</div>" +
                                "</section>" +

                            "</div>" +
                        "</div>" +
                    "</div>");
                    }
                    %>
                    </div>
                </div>
            </form>

    </div> <!-- /container -->
</div>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
