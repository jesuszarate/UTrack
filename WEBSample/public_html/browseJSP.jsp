<%@ page language="java" import="cs5530.*, java.util.*"%>

<%

String name = request.getParameter("name");
String min = request.getParameter("min");
String max = request.getParameter("max");
String cat = request.getParameter("Category");
String add = request.getParameter("Address");
String keys = request.getParameter("keywords");
String sortby = "";

Connector connector = (Connector)session.getAttribute("connector");
User user = (User)session.getAttribute("user");
POI poi = (POI)session.getAttribute("poi");


String query = "";


if(min != null && max != null &&
    min != "" && max != ""){
    int minRange = 1;
    int maxRange = 1000000;

    try{
        minRange = Integer.parseInt(min);
        maxRange = Integer.parseInt(max);

        out.print(minRange + " " + maxRange);

    }
    catch(Exception e){
        System.out.println("Ranges should be a number: ");
    }
    query += poi.createRangeQuery(minRange, maxRange);
}



out.println(add);
if(add != null && add != ""){
    query += poi.createQuery(query, "address", add);
}
if(cat != null && cat != ""){
    query += poi.createQuery(query, "category", cat);
}
if(name != null && name != ""){
    query += poi.createQuery(query, "name", name);
}
if(keys != null){

}

out.println(query + " " + sortby + " yup ");

//Results
//out.println("Results " + poi.poiBrowsing(query, "", sortby, connector.stmt, connector._con));


out.println("aloha4");

int limit = 10;

    ArrayList<String> popPOI = poi.poiBrowsingArr(query, "", sortby, connector.stmt, connector._con);

    int size = popPOI.size();

    String[] pois = new String[size];
    for(int i = 0; i < size; i++){

    out.println(
    "<section class=\"section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp\">" +
    "<div class=\"mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone\">" +
    "<div class=\"mdl-card__supporting-text\">" +
        "<b>" + popPOI.get(i) + "</b>" +
        "</div>" +
    "<div class=\"mdl-card__actions\">" +
        "<a href=\"#\" class=\"mdl-button\">Read more</a>" +
        "</div>" +
    "</div>" +
    "</section>");


    }
/**/
%>