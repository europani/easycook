# easycook
### 개요
+ 음식을 쉽게 요리해 먹을 수 있는 밀키트를 판매하는 쇼핑몰 사이트

### 프로젝트 요약
+ 사이트명 : easycook (이지쿡)
+ 프로젝트 기간 : 2020.10.05 ~ 2020.11.04 (4주)
+ 인원 : 6명
+ 나의 기여도 : 45% (팀장)
+ 구현 담당 기능 : 데이터베이스 설계&구현, 프로젝트 빌드, 인증과정(회원가입&로그인, 아이디&비밀번호 찾기, 이메일인증), 관리자페이지(회원관리, 상품관리, 주문관리, 게시물&쿠폰관리 CRUD), 리뷰작성 및 총괄

### 개발환경
+ 언어 : JAVA 8 (MVC Model 2)
+ 프레임워크 : Spring Framework 4
+ 빌드 : Maven
+ Frond-end : HTML, CSS, JavaScript
+ Back-end : Jsp&Servlet
+ DB : Oracle, Mybatis, JDBC
+ 형상관리 : git, Github

### E-R Diagram
![ERD](https://user-images.githubusercontent.com/48157259/98438808-fefb6580-212f-11eb-9c95-193b086c5f43.jpg)

### 프로젝트 설명
#### Authentication
> Login, Signup
> ![login, singup](https://user-images.githubusercontent.com/48157259/98439968-0a9f5a00-2139-11eb-8b84-ad6818c19621.png)
> 네이버, 카카오 로그인 API를 사용하여 3가지 방식의 회원가입과 로그인을 구현하였습니다. AJAX를 사용하여 아이디중복체크와 비밀번호일치여부, 비밀번호 자리수제한등을 구현하였습니다. 다음주소 API를 > 사용하여 우편번호와 주소를 가져왔습니다. 

#### Administrator

