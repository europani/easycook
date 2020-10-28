<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>easycook 관리자 페이지</title>

  <!-- Bootstrap core CSS -->
  <link href="/easycook/resources/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/easycook/resources/admin/css/simple-sidebar.css" rel="stylesheet">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  
  <style>
  	th {
  		text-align: center;
  	}
  </style>

</head>

<body>

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading">관리자페이지</div>
      <div class="list-group list-group-flush">
        <a href="/easycook/admin/member" class="list-group-item list-group-item-action bg-light">회원관리</a>
        <a href="/easycook/admin/product" class="list-group-item list-group-item-action bg-light">상품관리</a>
        <a href="/easycook/admin/orders" class="list-group-item list-group-item-action bg-light">주문관리</a>
        <a href="/easycook/admin/notice" class="list-group-item list-group-item-action bg-light">공지사항</a>
        <a href="/easycook/admin/event" class="list-group-item list-group-item-action bg-light">이벤트</a>
      </div>
    </div>
    <!-- /#sidebar-wrapper -->

