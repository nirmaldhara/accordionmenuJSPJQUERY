<%@ page import="com.codewale.example.DynamicMenu" %>
<%@ page import="java.util.Map,java.util.Set,java.util.List;" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript" src="./js/jquery-1.2.6.min.js"></script>
<script language="javascript">
function initMenu() {
  $('#menu ul').hide();
  $('#menu ul:first').show();
  $('#menu li a').click(
    function() {
      var checkElement = $(this).next();
      if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
        return false;
        }
      if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
        $('#menu ul:visible').slideUp('normal');
        checkElement.slideDown('normal');
        return false;
        }
      }
    );
  }
$(document).ready(function() {initMenu();});
</script>
<style type="text/css">
div.menu
{
background-color:#ffffff;
margin-bottom:5px;
border:1px solid #9EE3FF;
}
ul#menu, ul#menu ul {
  list-style-type:none;
  margin: 0;
  padding: 0;

}

ul#menu a {
  display: block;
  text-decoration: none;
}

ul#menu li {
  margin-top: 1px;
  border-top:1px dotted #D9F2FC;
}

ul#menu li a {
  background: #D3EFFB;
  color: #03597D;
  padding: 0.5em;

}
ul#menu li a:hover {
  background: #C8EBFA;
}

ul#menu li ul li a {
  background: #FFFFFF;
  color: #03597D;

}

ul#menu li ul li a:hover {
  background: #F7FCFE;
  border-left: 5px #03597D solid;

}
</style>
</head>
<body>
<table width="20%">
<tr><td>
<%
try{
DynamicMenu dm= new DynamicMenu();
Map menuMap=dm.getMenuItems();

Set<String> keys = menuMap.keySet();
out.print("<ul id=\"menu\">");/////////////start of menu
for(String key: keys){
   
	out.print("<li>");
	out.print("<a href=\"#\">"+key+"</a>");
	out.print("<ul>");
    List itemList=(List)menuMap.get(key);
    
    for(int i=0;i<itemList.size();i++)
    {
    	Map columnMap=(Map)itemList.get(i);
    	String menu_item=columnMap.get("menu_item").toString();
    	String link_page=columnMap.get("link_page").toString();
    	String tool_tip=columnMap.get("tool_tip").toString();
    	out.print("<li><a href=\""+link_page+"\" title=\""+tool_tip+"\">"+menu_item+"</a></li>");
    }
    out.print("</ul></li>");
}
out.print("</ul>"); ///////////end of menu
}
catch(Exception e)
{
	out.print(e);
}

%>
</td></tr>
</table>
</body>
</html>