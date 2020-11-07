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
1. Login, Signup
> ![login, singup](https://user-images.githubusercontent.com/48157259/98440432-ff016280-213b-11eb-9db0-61ca820cb9e6.png)
> 회원가입 화면에서는 AJAX를 사용하여 아이디중복체크와 비밀번호일치여부, 비밀번호 자리수제한 등을 구현하였고 다음주소 API를 사용하여 우편번호와 주소를 가져왔습니다. 회원가입을 하면 입력한 이> > 메일로 인증링크를 보내 인증을 한 회원만 로그인을 가능하도록 하였습니다.


2. 아이디, 비밀번호찾기
> ![seekAuth](https://user-images.githubusercontent.com/48157259/98440175-82ba4f80-213a-11eb-86ba-a667854c83df.png)
> 아이디찾기 : 가입할때 입력한 이메일 또는 휴대폰번호 2가지 방법을 라디오박스를 사용하여 사용자가 선택해 아이디를 찾을 수 있도록 구현하였습니다. <br>
> 비밀번호찾기 : 가입할 때 입력한 이메일을 입력하며 일치하면 인증번호를 전송해 입력시키면 비밀번호 변경을 통해 재설정하여 로그인 할 수 있도록 구현하였습니다. 인증번호는 쿠키를 통해 10분간만 유효하도록 설정하였습니다.

#### Administrator


