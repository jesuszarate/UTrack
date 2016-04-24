<%@ page language="java" import="cs5530.*, java.util.*"%>

<%

String name = request.getParameter("name");
String min = request.getParameter("min");
String max = request.getParameter("max");
String cat = request.getParameter("Category");
String add = request.getParameter("Address");
String keys = request.getParameter("keywords");
String sortby = request.getParameter("sortby");

Connector connector = (Connector)session.getAttribute("connector");
User user = (User)session.getAttribute("user");
POI poi = (POI)session.getAttribute("poi");

// Variables for setting favorite poi
String setFav = request.getParameter("setFav");
String pname = request.getParameter("pname");

// Variable for editing poi
String editPoi = request.getParameter("editPoi");

// Variable for giving feedback
String feedback = request.getParameter("feedback");

// Variable for rating feedback
String rateFeedback = request.getParameter("rateFeedback");

// Variable for setting the trust
String setTrust = request.getParameter("setTrust");

// Variable for getting useful feedback
String usefulFeedback = request.getParameter("usefulFeedback");


if(usefulFeedback != null && usefulFeedback.equals("true")){

    String lim = request.getParameter("limit");

    int limit = 10;
    try{
        String poiname = pname;
        limit = Integer.parseInt(lim);
        ArrayList<String> popPOI = poi.getTopFeedbackArr(pname, limit, connector.stmt, connector._con);


    int size = popPOI.size();

    String[] pois = new String[size];
    for(int i = 0; i < size; i++){
    String[] str = popPOI.get(i).split("\\n");
    String p = popPOI.get(i);

    p ="word";

    out.println(
    "<section class=\"section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp\">" +
    "<div class=\"mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone\">" +
    "<div class=\"mdl-card__supporting-text\">" +
        "<b>" + popPOI.get(i) + "</b>" +
        "</div>" +
    "<div class=\"mdl-card__actions\">" +

        "<div id=\"uresults" + i +"\">" +
        "<select id=\"rating\">\n" +
            "<option value=\"useless\">Useless</option>" +
            "<option value=\"useful\">Useful</option>" +
            "<option value=\"veryUseful\">Very Useful</option>" +
            "</select>" +

        "<input type=\"button\" onclick=\"rateFeedback('hey:hello " + str[0] +"', '" + poiname + "', 'uresults"+ i +"')\"" +
        "class=\"btn-sm mdl-button btn-theme mdl-js-button\n" +
        "mdl-button--raised mdl-js-ripple-effect mdl-button--accent mdl-color--red-900 \"" +
        "value=\"Rate\"/>" +
        "</div>" +

    "<div id=\"tresults" + i +"\">" +
    "<select id=\"trust\">\n" +
        "<option value=\"Trusted\">Trusted</option>" +
        "<option value=\"NotUntrusted\">Not Trusted</option>" +
        "</select>" +

    "<input type=\"button\" onclick=\"userTrust('hey:hello " + str[0] +"', '" + poiname + "', 'tresults"+ i +"')\"" +
    "class=\"btn-sm mdl-button btn-theme mdl-js-button\n" +
    "mdl-button--raised mdl-js-ripple-effect mdl-button--accent mdl-color--red-900 \"" +
    "value=\"Set\"/>" +
    "</div>" +


    "</div>" +
    "</div>" +
    "</section>");
    }

    }catch(Exception e){}
}

else if(setTrust != null && setTrust.equals("true")){

    String theirUname = request.getParameter("theirUname");
    String trust = request.getParameter("trust");

    boolean isTrusted = false;

    if(theirUname != null && theirUname != "" &&
        trust != null && trust != "")
    {
        String uname = (String)session.getAttribute("username");

        isTrusted = trust.equals("Trusted") ? true : false;

        user.setTrust(uname, theirUname, isTrusted, connector.stmt, connector._con);

        out.println("You have set " + theirUname + " as " + trust );

    }
}

else if(rateFeedback != null && rateFeedback.equals("true")){

    String theirUname = request.getParameter("theirUname");

    String p = request.getParameter("pname");

    String rating = request.getParameter("rating");

    if(theirUname != null && theirUname != "" &&
        p != null && p != "" &&
        rating != null && rating != ""){

        String uname = (String)session.getAttribute("username");

        int r = 2;
        if(rating.equals("Useless")){
            r = 0;
        }
        else if(rating.equals("Useful")){
            r = 1;
        }

        poi.addUsefulnessRating(uname, theirUname, p, r, connector.stmt, connector._con);
        out.print("You have rated this Feedback as " + rating);

    }

}
else if(feedback != null && feedback.equals("true")){
    session.setAttribute("POIFeedback", request.getParameter("pname"));
}
else if(editPoi != null && editPoi.equals("true")){
    EditPOI ep = new EditPOI();

    HashMap<String, String> mp =
    poi.getPOI(pname, connector.stmt);

    int price = 0;
    int year = 0;
    try{
        price = Integer.parseInt(mp.get("price"));
        year = Integer.parseInt(mp.get("yr_est"));
    }catch(Exception e){

    }

    ep.name = mp.get("name");
    ep.category = mp.get("category");
    ep.address = mp.get("address");
    ep.URL = mp.get("URL");
    ep.tel_num = mp.get("tel_num");
    ep.yr_est = price;
    ep.hours = mp.get("hours");
    ep.price = year;

    session.setAttribute("EditPOI", ep);
}
else if(setFav != null && setFav.equals("true")){

    String username = (String)session.getAttribute("username");
    out.println("_" +pname+"_");
    out.println(username);
    out.println(poi.setFavoritePOI(pname, username, connector.stmt, connector._con));
    //request.setParameter("", fa);
}else{
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

int limit = 10;

    ArrayList<String> popPOI = poi.poiBrowsingArr(query, "", sortby, connector.stmt, connector._con);

    int size = popPOI.size();

    String[] pois = new String[size];
    for(int i = 0; i < size; i++){

    String[] str = popPOI.get(i).split("\\n");
    String p = popPOI.get(i);

    p ="word";

    out.println(
    "<section class=\"section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp\">" +
    "<div class=\"mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone\">" +
    "<div class=\"mdl-card__supporting-text\">" +
        "<b>" + popPOI.get(i) + "</b>" +
        "</div>" +
    "<div class=\"mdl-card__actions\">" +
        //"<a onclick=\"setFavorite(\'"+ str[0] +"\')\" class=\"mdl-button\">Set as favorite</a>" +
        "<a onclick=\"setFavorite('hey:hello " + str[0] +"')\" class=\"mdl-button\">Set as favorite</a>" +
        "<a onclick=\"editPOI('hey:hello " + str[0] +"')\" class=\"mdl-button\">Edit POI</a>" +
        "<a onclick=\"giveFeedback('hey:hello " + str[0] +"')\" class=\"mdl-button\">Give Feedback</a>" +
        "<a onclick=\"rateFeedback('hey:hello " + str[0] +"')\" class=\"mdl-button\">Rate Feedback</a>" +
        "</div>" +
    "</div>" +
    "</section>");


    }
    }
%>