<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="join" class="join.JoinName" scope="page"></jsp:useBean>
<jsp:setProperty name = "join" property = "*" />
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <style>
    body {
      background-color: black;
    }

    .container {
      margin: 0 auto;
      width: 250px;
      height: 360px;
      background-color: #262F40;
      border-radius: 1%;
    }
    p {
      position: relative;
      left: 10px;
      color: white;
      font-weight: bold;
      font-size: 1.1em;
      top:5px;
    }
    .box1 {
      position: relative;  
      left: 10px;
    }

    .box1 label {
      color: #CED4E1;
      font-weight: bold;
      font-size: 1.1em;
    }

    .box1 input {
      position: relative;
      top:5px;
      width: 225px;
      height: 30px;
      background-color: #4C5564;
      border: none;
      outline: none;
      border-radius: 5px;
      color: #9DA7B3;
      font-weight: bold;
      font-size: 1.1em;
    }
    .box2 {
      position: relative; 
      left: 10px;
      top:10px;
    }
    .box2 label {
      color: #CED4E1;
      font-weight: bold;
      font-size: 1.1em;
    }
    .btn { 
      position: relative;
      right: 5px;
      outline: none;
      border: none;
      border-radius: 5px;
      width: 35px;
      height: 20px;
    } 
    .btn:active {
      border: 2px solid white;
    }
    .box3 {
      position: relative;
      top:10px;
      left: 10px;
    }

    .box3 label {
      color: #CED4E1;
      font-weight: bold;
      font-size: 1.1em;
    }

    .box3 input {
      position: relative;
      top:5px;
      width: 225px;
      height: 30px;
      background-color: #4C5564;
      border: none;
      outline: none;
      border-radius: 5px;
      color: #9DA7B3;
      font-weight: bold;
      font-size: 1.0em;
    }
    .box4 {
      position: relative;
      top:15px;
      left: 10px;
    }

    .box4 label {
      color: #CED4E1;
      font-weight: bold;
      font-size: 1.1em;
    }

    .box4 input {
      position: relative;
      top:5px;
      width: 225px;
      height: 30px;
      background-color: #4C5564;
      border: none;
      outline: none;
      border-radius: 5px;
      color: #9DA7B3;
      font-weight: bold;
      font-size: 1.1em;
    }
  </style>
</head>

<body>
  <div class="container">
    <p>Personal</p>
    <div class="box1">
      <label for="name">Full Name</label><br>
      <input type="text" name="name" id="name" placeholder="e.g.John Doe" value = "<%=join.getName() %>"><br>
    </div>
    <div class="box2">
      <label for="color">What is your favorite color?</label><br>
      <div class="btnbox">
        <button class="btn" style="background-color: #31C48D;"></button>
        <button class="btn" style="background-color: #FBCA13;"></button>
        <button class="btn" style="background-color: #3E84F7;"></button>
        <button class="btn" style="background-color: #E74694;"></button>
        <button class="btn" style="background-color: #8E60F7;"></button>
        <button class="btn" style="background-color: #F05252;"></button>
      </div>
    </div>
    <p>Account</p>
    <div class="box3">
      <label for="email">Email</label><br>
      <input type="text" name="email" id="email" placeholder="e.g.johndoe@gmail.com"><br>
    </div>
    <div class="box4">
      <label for="pass">Password</label><br>
      <input type="password" name="password" id="password"  placeholder="************"><br>
    </div>
  </div>
</body>

</html>