<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<jsp:include page="common/header.jsp" />
<!DOCTYPE html>

   
<link href="../resources/css/login.css" rel="stylesheet" type="text/css">

  
  
    <form action="index.html" method="post" class="loginForm">
      <h2>로그인창</h2>
      <div class="idForm">
        <input type="text" class="id" placeholder="ID" name="id">
      </div>
      <div class="passForm">
        <input type="password" class="pw" placeholder="PW" name="">
      </div>
      <button type="button" class="btn" onclick="button()">
        LOG IN
      </button>
      <script>
      	let button = () => {
        	alert('login Button !')	
        }
      </script>
      <div class="bottomText">
        Don't you have ID? <a href="signup">sign up</a>
      </div>
    </form>

 


 <jsp:include page="common/footer.jsp" />