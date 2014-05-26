<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.util.*,bean.*" errorPage="" %>
<%
	ArrayList list = (ArrayList)session.getAttribute("getclass");
	if(list ==null){
	    response.sendRedirect("/ProductManagement/GetClassForIndex");
	}
	else {
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>通讯录管理系统</title>
</head>

<body>
<%
	for(int i=0;i<list.size();i++){
	ClassInfo info = (ClassInfo)list.get(i);
 %>
<p><a href="<%=request.getContextPath() %>/GetUserById?classid=<%=info.getClass_id() %>"><%=info.getClass_name() %></a></p>
<%} %>
</body>
</html>
<% }%>
