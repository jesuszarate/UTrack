<!DOCTYPE html>
<%@ page language="java" import="cs5530.*" %>
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
    </script>

</head>

<body>

<div class="container">
    <div class="jumbotron">
        <h1>Utrack</h1>
    </div>

    <div class="container">

        <div class="container">

        </div>
        <!--<form class="form-signin" method="post" action="index.jsp">-->
            <!--<form method=post action="index.jsp#addVisit">-->
                <h2 class="form-signin-heading">New POI</h2>

                <div class="mdl-layout__tab-panel" id="addVisit">

                    <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">

                        <div class="mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
                            <div class="mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">

                                <div class="mdl-card__supporting-text">

                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="username-input" class="mdl-textfield__input" type="text" id="Name">
                                        <label class="mdl-textfield__label input_label" for="Name">Name</label>
                                    </div>

                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="username-input" class="mdl-textfield__input" type="text" id="Category">
                                        <label class="mdl-textfield__label input_label" for="Category">Category</label>
                                    </div>

                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="username-input" class="mdl-textfield__input" type="text" id="Address">
                                        <label class="mdl-textfield__label input_label" for="Address">Address</label>
                                    </div>

                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="username-input" class="mdl-textfield__input" type="text" id="URL">
                                        <label class="mdl-textfield__label input_label" for="URL">URL</label>
                                    </div>

                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="username-input" class="mdl-textfield__input" type="text" id="phoneNumber">
                                        <label class="mdl-textfield__label input_label" for="phoneNumber">Phone Number</label>
                                    </div>
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="username-input" class="mdl-textfield__input" type="text" id="year">
                                        <label class="mdl-textfield__label input_label" for="year">Year of Establishment</label>
                                    </div>
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="username-input" class="mdl-textfield__input" type="text" id="hours">
                                        <label class="mdl-textfield__label input_label" for="hours">hours</label>
                                    </div>
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="username-input" class="mdl-textfield__input" type="text" id="price">
                                        <label class="mdl-textfield__label input_label" for="price">Price Per Person</label>
                                    </div>
                                    <!--Party Count-->
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="partyCount-in" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="partyCount">
                                        <label class="mdl-textfield__label input_label mdl-color-text--red-900" for="partyCount">Hours</label>
                                        <span class="mdl-textfield__error">Input must be a number</span>
                                    </div>

                                    <!--Cost-->
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="cost-in" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="cost">
                                        <label class="mdl-textfield__label input_label mdl-color-text--red-900" for="cost">Price Per Person</label>
                                        <span class="mdl-textfield__error">Input must be a number</span>
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

                                </div>
                            <div>
                                <button type="button" class="btn-sm mdl-button btn-theme btn-primary mdl-js-button
                                                mdl-button--raised mdl-js-ripple-effect mdl-button--accent mdl-color--red-900"
                                        data-toggle="modal" data-target="#myModal">Add POI</button>
                            </div>
                            </div>

                        </div>



                        <!-- Modal -->
                        <div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Added Visits</h4>
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
                    </section>

                </div>
            <!--</form>-->

    </div> <!-- /container -->
</div>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
