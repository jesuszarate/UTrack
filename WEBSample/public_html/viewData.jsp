<%@ page language="java" import="cs5530.*, java.util.*"%>



<%!
public ArrayList<String> view(ArrayList<String> vs){

    //String poiname="hi";

    ArrayList<String> result = new ArrayList<String>();
    ArrayList<String> popPOI = vs;
    int size = popPOI.size();

    String[] pois = new String[size];
    for(int i = 0; i < size; i++){
        //String[] str = popPOI.get(i).split("\\n");
        String p = popPOI.get(i);

        p ="word";

        result.add(
        "<section class=\"section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp\">" +
        "<div class=\"mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone\">" +
        "<div class=\"mdl-card__supporting-text\">" +
            "<b>" + popPOI.get(i) + "</b>" +
            "</div>" +
        "<div class=\"mdl-card__actions\">" +

        "</div>" +
        "</div>" +
        "</section>");
    }
            return result;

}
%>
<%
Connector connector = (Connector)session.getAttribute("connector");
User user = (User)session.getAttribute("user");
POI poi = (POI)session.getAttribute("poi");

String view = request.getParameter("view");

if(view != null && view.equals("true")){
    String viewBy = request.getParameter("viewBy");
    String lim = request.getParameter("limit");

    out.println(viewBy);
    int limit = 10;
    try{
        limit = Integer.parseInt(lim);
    }catch(Exception e){}

    ArrayList<String> popPOI = new ArrayList<String>();
    if(viewBy.equals("Most Popular")){
        popPOI = poi.getPopularForEachCategoryArray(limit, connector.stmt, connector._con);
    }
    else if(viewBy.equals("Most Expensive")){
        out.print("I'm fancy again");
        popPOI = poi.getCostliestForEachCategoryArr(limit, connector.stmt, connector._con);
    }
    else{
        out.print("I'm awesome!");
    }

    ArrayList<String> resultArr = view(popPOI);
    for(String s : resultArr){
        out.println(s);
    }


}


%>