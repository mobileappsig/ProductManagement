	<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.util.*,bean.*" errorPage="" %>

<%
	ArrayList list = (ArrayList)session.getAttribute("getclass");
    String path = request.getContextPath();
	if(list ==null){
	    response.sendRedirect(path + "/GetClassForAdd");
	}
	else {
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ͨѶ¼����ϵͳ</title>
</head>

<body>
<form id="form1" name="form1" method="post" action="<%=request.getContextPath() %>/Add"> 
  ������ 
  <label>
  <input type="text" name="name" id="name" />
  </label>
  <p>�绰��
    <label>
    <input type="text" name="mobile" id="mobile" />
    </label>
  </p>
  <p>���
    <label>
    <select name="classes" id="classes">
    <%
	for(int i=0;i<list.size();i++){
	ClassInfo info = (ClassInfo)list.get(i);
 %>
      <option value="<%=info.getClass_id() %>"><%=info.getClass_name() %></option>
      <%} %>
    </select>
    </label>
  </p>
  <p>�ʼ���
    <label>
    <input type="text" name="email" id="email" />
    </label>
  </p>
  <p>
    <label>
    <input type="submit" name="button" id="button" value="�ύ" />
    </label>
  </p>
</form>
</body>
</html>
<%} %>
