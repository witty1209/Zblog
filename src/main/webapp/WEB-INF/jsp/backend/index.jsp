<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE Html>
<html>
 <head>
  <jsp:include page="common/bootstrap.jsp" flush="false" />
 </head>
 <body style="margin-top: 50px;">
  <jsp:include page="common/navbar.jsp" flush="false" />
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-3 col-md-2" id="sidebar" style="padding: 0;">
        <jsp:include page="common/sidebar.jsp" flush="false" />
      </div>
      <div class="col-sm-9 col-md-10">
        <h3 class="page-header header">主菜单<small>Welcome to Zblog</small></h3>
        <div class="row">
          <div class="col-sm-3 col-md-3">
            <div class="databox">
              <div class="sybomol sybomol_terques"><i class="glyphicon glyphicon-user"></i></div>
              <div class="value">2<p>用户</p></div>
            </div>
           </div>
           <div class="col-sm-3 col-md-3">
             <div class="databox">
               <div class="sybomol sybomol_red"><i class="glyphicon glyphicon-pencil"></i></div>
               <div class="value">23<p>文章</p></div>
              </div>
           </div>
           <div class="col-sm-3 col-md-3">
             <div class="databox">
               <div class="sybomol sybomol_yellow"><i class="glyphicon glyphicon-comment"></i></div>
               <div class="value">14<p>评论</p></div>
             </div>
           </div>
           <div class="col-sm-3 col-md-3">
             <div class="databox">
               <div class="sybomol sybomol_blue"><i class="glyphicon glyphicon-download-alt"></i></div>
               <div class="value">0<p>附件</p></div>
             </div>
           </div>
        </div>
        <div class="row" style="padding-top: 15px; ">
          <div class="col-sm-6 col-md-6">
            <div class="panel panel-default">
              <div class="panel-heading"><span class="icon glyphicon glyphicon-certificate"></span>系统信息</div>
              <div class="panel-body">
                <ul class="list-unstyled ul-group">
                  <li>操作系统: ${osname}</li>
                  <li>Java环境: Java ${javaVersion}</li>
                  <li>系统内存: ${memory}M</li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-md-6">
            <div class="panel panel-default">
              <div class="panel-heading"><span class="icon glyphicon glyphicon-filter"></span>最近发表</div>
                <div class="list-group">
                  <c:forEach items="${posts}" var="post">
                    <a class="list-group-item" href="../posts/${post.id}" target="_blank">
                       <span class="badge">${post.rcount}</span>
                       <h4 class="list-group-item-heading">${post.title}</h4>
                       <p><fmt:formatDate value="${post.createTime}" pattern="YYYY-MM-dd" /></p>
                    </a>
                  </c:forEach>
                </div>
              </div>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6 col-md-6">
            <div class="panel panel-default">
              <div class="panel-heading"><span class="icon glyphicon glyphicon-comment"></span>近期留言</div>
                <div class="list-group">
                <c:forEach items="${comments}" var="comment">
                  <a class="list-group-item">${comment.content}</a>
                </c:forEach>
                </div>
              </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 </body>
</html>
