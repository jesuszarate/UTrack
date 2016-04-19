<%@ page language="java" import="cs5530.*, java.util.*"%>

<%

String name = request.getParameter("name");
String min = request.getParameter("min");
String max = request.getParameter("max");
String cat = request.getParameter("Category");
String add = request.getParameter("Address");
String keys = request.getParameter("keywords");
String sortby = "a";

out.println("<p>hi world!!!  7 " + name + min + max + cat + add + keys + "</p>");



Connector connector = (Connector)session.getAttribute("connector");
User user = (User)session.getAttribute("user");
POI poi = (POI)session.getAttribute("poi");


String query = "";

if(min != null && max != null){

    int minRange = 1;
    int maxRange = 100;
    try{
        minRange = Integer.parseInt(min);
        maxRange = Integer.parseInt(max);
    }
    catch(Exception e){
        System.out.println("Ranges should be a number: ");
    }
    query += poi.createRangeQuery(minRange, maxRange);

}
if(add != null){
    query += poi.createQuery(query, "address", add);
}
if(cat != null){
    query += poi.createQuery(query, "category", cat);
}
if(name != null){
    query += poi.createQuery(query, "name", name);
}
if(keys != null){

}

out.println(query);

//Results
out.println("Results " + poi.poiBrowsing(query, "", sortby, connector.stmt, connector._con));

out.println("aloha");

int limit = 10;
ArrayList<String> popPOI = poi.getPopularForEachCategoryArray(limit, connector.stmt, connector._con);
    int size = popPOI.size();

    String[] pois = new String[size];
    for(int i = 0; i < size; i++){

    out.println(
    "<section class=\"section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp\">" +
    "<div class=\"mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone\">" +
    "<div class=\"mdl-card__supporting-text\">" +
        "<h4>Features</h4>" +
        "<b>" + popPOI.get(i) + "</b>" +
        "</div>" +
    "<div class=\"mdl-card__actions\">" +
        "<a href=\"#\" class=\"mdl-button\">Read our features</a>" +
        "</div>" +
    "</div>" +
    "</section>";



    }
%>