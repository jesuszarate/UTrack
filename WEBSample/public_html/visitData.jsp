<%@ page language="java" import="cs5530.*, java.util.*"%>

<%

out.println("here");

String submit = request.getParameter("submit");
String add = request.getParameter("add");
String pname = request.getParameter("pname");
String cost = request.getParameter("cost");
String people = request.getParameter("partyCount");
String date = request.getParameter("date");


Connector connector = (Connector)session.getAttribute("connector");
User user = (User)session.getAttribute("user");
POI poi = (POI)session.getAttribute("poi");
ArrayList<visit> visits = (ArrayList<visit>)session.getAttribute("visits");


if(submit != null && submit.equals("true")){
    out.println("lo isimos");

    visits = (ArrayList<visit>)session.getAttribute("visits");

    if(visits != null && user != null){

        for(int i = 0; i < visits.size(); i++){

            visit vst = visits.get(i);
            out.println(vst.pname);
            out.println(vst.cost);
            out.println(vst.numOfPeople);
            out.println(vst.date);
            out.println(user);
            out.println(user);


            out.println("hereee");
            //user.addVisit(vst.pname, vst.cost, vst.numOfPeople, vst.date, connector.stmt, connector._con);
            //user.setLogin("user2");
            out.println("<p>" + user.getLogin() + "</p>");

            //int pid = user.addVisit(vst.pname, 1000000, 300000, "03-03-1990", connector.stmt, connector._con);

            int pid = -1;

            try{
                int cst = Integer.parseInt(vst.cost);
                int np = Integer.parseInt(vst.numOfPeople);
                pid = user.addVisit(vst.pname, cst, np, vst.date, connector.stmt, connector._con);
            }catch(Exception e){
                  out.println(e.toString());
            }




            out.println("pid " + pid);
            //out.println(poi.getRecomendedPOIs("user2", 320, connector.stmt));



        }

        session.setAttribute("visits", null);

    }

}

if(add != null && add.equals("true")){

    visit v = new visit();

    v.pname = pname;
    v.cost = cost;
    v.numOfPeople = people;
    v.date = date;

    visits.add(v);
    session.setAttribute("visits", visits);
out.println("Working! begin");

visits = (ArrayList<visit>)session.getAttribute("visits");

                    int size = visits.size();

                    for(int i = 0; i < size; i++){

                    visit vis = visits.get(i);
                    out.println(
                    "<div class=\"mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone\">" +
                        "<div class=\"mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone\">" +
                            "<div class=\"mdl-card__supporting-text\">" +
                                "<section class=\"section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp\">" +
                                "<div class=\"mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone\">" +
                                "<div class=\"mdl-card__supporting-text\">" +
                                    "<div><p><b>" + vis.pname + "</b></p></div>" +
                                    "<div><p><b>Cost</b>\t" + vis.cost + "</p></div>" +
                                    "<div><p><b>Number of People</b>\t" + vis.numOfPeople + "</p></div>" +
                                    "<div><p><b>Date</b>\t" + vis.date + "</p></div>" +
                                "</div>" +

                                "</div>" +
                                "</section>" +

                            "</div>" +
                        "</div>" +
                    "</div>");

                    }


    out.println("Working! end");
}

//session.setAttribute("visits", null);


%>