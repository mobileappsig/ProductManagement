<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.util.*,bean.*" errorPage="" %>
<%
	ArrayList list = (ArrayList)session.getAttribute("getclass");
    String path = request.getContextPath();
	if(list ==null){
	    response.sendRedirect(path + "/GetClassForAdd");
	}
	else {
	UserInfo uinfo = (UserInfo)request.getAttribute("showone");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>通讯录管理系统</title>
<script type="text/javascript">
	function selectValue(sId,value){
        var s = document.getElementById(sId);
        var ops = s.options;

        for(var i=0;i<ops.length; i++){
         var tempValue = ops[i].value;
            if(tempValue == value)
            {
            ops[i].selected = true;
            }
        }
   }
</script>
</head>

<body onload="selectValue('classes','<%=uinfo.getClasses()%>')">
<form id="form1" name="form1" method="post" action="<%=request.getContextPath() %>/Modify?userid=<%=uinfo.getId() %>">  
  姓名：  
  <label>
  <input type="text" name="name" id="name" value="<%=uinfo.getName() %>"/>
  </label>
  <p>电话：
    <label>
    <input type="text" name="mobile" id="mobile" value="<%=uinfo.getMobile() %>"/>
    </label>
  </p>
  <p>类别：
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
  <p>邮件：
    <label>
    <input type="text" name="email" id="email" value="<%=uinfo.getEmail() %>"/>
    </label>
  </p>
  <p>
    <label>
    <input type="submit" name="button" id="button" value="提交" />
    </label>
  </p>
</form>
</body>
</html>
<%} %>
