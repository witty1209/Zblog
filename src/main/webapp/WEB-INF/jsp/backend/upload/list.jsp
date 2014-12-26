<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE Html>
<html>
 <head>
  <%@include file="../../common/bootstrap.html" %>
 </head>
 <body style="margin-top: 50px;">
  <%@include file="../common/navbar.html" %>
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-3 col-md-2" id="sidebar" style="padding: 0;">
         <%@include file="../common/sidebar.html" %>
      </div>
      <div class="col-sm-9 col-md-10">
        <ol class="breadcrumb header">
          <li><span class="icon glyphicon glyphicon-home"></span>主菜单</li>
          <li class="active">多媒体</li>
        </ol>
        <div class="panel panel-default">
          <div class="panel-heading"><span class="icon glyphicon glyphicon-list"></span>媒体库</div>
          <div class="panel-body">
           <table id="post-table" class="table table-striped list-table">
               <thead><tr>
                 <th style="width: 80px;">文件</th>
                 <th style="width: 30%"></th>
                 <th>作者</th>
                 <th>上传至</th>
                 <th>日期</th>
                 <th class="center">操作</th>
               </tr></thead>
              <tbody>
               <c:forEach items="${page.content}" var="upload">
                 <tr><td><img src="${upload.path}" width="80" /></td><td>${upload.name}</td>
                      <td>${upload.creator}</td><td>${upload.title}</td><td><fmt:formatDate value="${upload.createTime}" pattern="yyyy-MM-dd"/></td>
                     <td class="center"><span class="icon glyphicon glyphicon-pencil"></span>
                       <span class="glyphicon glyphicon-trash"></span></td></tr>
               </c:forEach>
              </tbody>
            </table>
            <div class="row-fulid">
              <div class="col-sm-6 col-md-6">
                <div class="page-info">显示第 ${page.pageIndex} 至  ${page.totalPage}项记录，共 ${page.totalCount} 项</div>
              </div>
              <div class="col-sm-6 col-md-6">
                <div id="pager">
                   <ul class="pagination">
                     <li><a href="#"><span aria-hidden="true">&laquo;</span></a></li>
                     <li><a href="#">1</a></li>
                     <li><a href="#">2</a></li>
                     <li><a href="#">3</a></li>
                     <li><a href="#">4</a></li>
                     <li><a href="#">5</a></li>
                     <li><a href="#"><span aria-hidden="true">&raquo;</span></a></li>
                   </ul>
              </div>
            </div>
          </div>
         </div>
       </div>

      </div>
    </div>
  </div>
 </body>
</html>