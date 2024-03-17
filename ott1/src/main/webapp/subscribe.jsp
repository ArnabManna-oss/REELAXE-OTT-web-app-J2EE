<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%String str=(String)session.getAttribute("EMAIL");
    //str=(str==null)?"":str;
    if(str==null)
    {
    	response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: url(https://wallpapers.com/images/featured/pattern-4u7ed6koskqhcez1.jpg);
            background-size: cover;
            font-family: Arial, sans-serif;
            align-content: center;
            flex-direction: column;
            background-color: rgb(0, 1, 1);
        }
        .logo{
            height: 200px;
            position: absolute;
            margin-left: -780px;
            margin-top: -136px;
        }
        img{
            height: 346px;
        }
        .card {
            position: relative;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            padding: 70px 200px 70px 200px;
            margin: 10px;
            margin-left: 600px;

        }
        
        .heading {
            font-size: 46px;
            color: #ffffff;
            margin: 0;
        }
        
        .sub-heading {
            font-size: 18px;
            color: #d3bdff;
            margin: 0;
            margin-bottom: 20px;
        }
        
        .subscribe-button {
            background:#ff3adb;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            transition: background 0.3s;
        }
        
        .subscribe-button:hover {
            background: #9d0080;
        }


        .card:hover {
            box-shadow: 0 0 20px 6px rgba(52, 152, 219, 0.8); /* Glowing effect */
            transform: scale(1.05); /* Zoom in slightly on hover */
        }

        
    </style>
</head>
<body>
    <div class="logo">
        <img src="images/reelaxe.png" alt="reelaxe">
    </div>
    
    <form action="valid" method="post" >
   
    <div class="card">
        <h1 class="heading">Rs 199</h1>
        <h2 class="sub-heading">for 6 months</h2>
        <button class="subscribe-button" name="subs" value="1">Subscribe</button>
    </div>

    <div class="card">
        <h1 class="heading">Rs 299</h1>
        <h2 class="sub-heading">for 12 months</h2>
        <button class="subscribe-button" name="subs" value="2">Subscribe</button>
    </div>
    
    </form>
</body>
</html>
