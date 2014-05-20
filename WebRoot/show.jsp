<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.util.*,bean.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<c:set var="userName" value="Admin" scope="session" />
<%
	ArrayList list = (ArrayList)request.getAttribute("userinfo");
	if(list!=null){
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>通讯录管理系统</title>
<script language=javascript>
var layers =document.layers,style=document.all,both=layers||style,idme=908601;
if(layers){layerRef='document.layers';styleRef ='';}if(style){layerRef='document.all';styleRef = 
'.style';}
function writeOnText(obj,str){
if(layers)with(document[obj]){ document.open();document.write(str);document.close();}
if(style)eval(obj+'.innerHTML=str');   }
var dispStr=new Array("");
var overMe=0;
function txtTyper(str,idx,idObj,spObj,clr1,clr2,delay,plysnd){
var tmp0=tmp1= '',skip=100;
if (both  &&  idx<=str.length) {
if (str.charAt(idx)=='<'){ while(str.charAt(idx)!='>') idx++;idx++;}
if (str.charAt(idx)=='&' && str.charAt(idx+1)!=' '){ while (str.charAt(idx)!= ';')idx++;idx++;}
tmp0 = str.slice(0,idx);
tmp1 = str.charAt(idx++);
if (overMe==0  &&  plysnd==1){
if (navigator.plugins[0]){
if(navigator.plugins["LiveAudio"][0].type=="audio/basic"  &&  navigator.javaEnabled()){document.embeds
[0].stop();
setTimeout("document.embeds[0].play(false)",100);}
} else if (document.all){
ding.Stop();
setTimeout("ding.Run()",100);}
overMe=1;}else overMe=0;
writeOnText(idObj, "<span class="+spObj+"><font color='"+clr1+"'>"+tmp0+"</font><font color='"+clr2
+"'>"+tmp1+"</font></span>");
setTimeout("txtTyper('"+str+"', "+idx+", '"+idObj+"', '"+spObj+"', '"+clr1+"', '"+clr2+"', "+delay+" ,"+plysnd+")",delay);}}
function init(mobile){txtTyper(mobile, 0, 'ttl0', 'ttl1', 'black', '#999999', 300, 0);}
</script>
</head>

<body>
<table width="604" height="129" border="1">
  <tr>
    <td><br /><br />姓名</td>
    <td>电话</td>
    <td>修改</td>
    <td>拨号</td>
    <td>删除</td>
  </tr>
  
  <%--Method 1 --%>
<%--   <c:forEach items="${requestScope.userinfo}" var="user">  --%>
   
  <%--Method 2 --%>
<%--    <c:forEach items="${userinfo}" var="user">   --%>

  <%--Method 3 --%>
<c:set var="myuser" value="${requestScope.userinfo}" scope="request" />
<c:forEach items="${myuser}" var="user">  
  <tr>
    <td>${user["name"]}</td>
    <td>${user["mobile"]}</td>
    <td><a href="<%=request.getContextPath() %>/ShowOne?userid=${user.id}">修改</a></td>
    <td><a href="javascript:init('${user.mobile}')" onclick="init('${user.mobile}%>')">拨号</a></td>
    <td><a href="<%=request.getContextPath() %>/Delete?userid=${user.id} %>">删除</a></td>
  </tr>
</c:forEach>
  
    <%--Method 4 --%>
  
  <%
  	for(int i=0;i<list.size();i++){
  	UserInfo info = (UserInfo)list.get(i);
   %>
   
   
  <tr>
    <td><%=info.getName() %></td>
    <td><%=info.getMobile() %></td>
    <td><a href="<%=request.getContextPath() %>/ShowOne?userid=<%=info.getId() %>">修改</a></td>
    <td><a href="javascript:init('<%=info.getMobile() %>')" onclick="init('<%=info.getMobile() %>')">拨号</a></td>
    <td><a href="<%=request.getContextPath() %>/Delete?userid=<%=info.getId() %>">删除</a></td>
  </tr>
  
  <%} %>
</table>
<DIV class=ttl1 id=ttl0></DIV>
</body>
</html>
<%} %>
