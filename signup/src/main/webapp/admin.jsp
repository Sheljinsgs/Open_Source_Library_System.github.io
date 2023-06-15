<%-- <%
if(session.getAttribute("name")==null){
	response.sendRedirect("login.jsp");
} --%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    <!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="Website Icon" type="png" href="logo.png">
    <title>OPEN SOURCE LIBRARY SYSTEM</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family:sans-serif;
        }
        
        section{
            display: grid;
            grid-template-columns: 250px 1fr;
            box-sizing: border-box;
        }

        .navbar{
            display: inline-block;
            width: 250px;
            position: fixed;
            height: 100%;
            overflow-y: scroll;
            transition: all 0.3s;
            background-color:#000080;
            transition: .5s;
        }

        section .navbar.active{
            width:50px
        }

        .navbar::-webkit-scrollbar{
            display: none;
        }

        .center-nav{
            position: relative;
            top: 0;
            left: 0;
            margin-top: 0;
            padding-left: 0;
            width: 100%;
            list-style: none;
            color: #fff;
            line-height: 40px;
        }

        .center-nav li{
            position: relative;
            left: 0;
            padding-top: 5px;
            width: 100%;
            height: 45px;
            overflow: hidden;
            cursor: pointer;
        }

        .center-nav li i{
            padding: 0px 10px;
            font-size: larger;
        }

        .center-nav .anime{
            position: absolute;
            z-index: -1;
            width: 100%;
            height: 50px;
            background: #1a53ff;
            top: 0px;
            transition: all .3s ease 0s;
        }


        /*.center-nav li:hover{
            background:  #1a53ff;
        } */       

        .center-nav li .title{
            margin-left: 10px;
        }


        section .rightmenu{
            position: absolute;
            width: calc(100% - 250px);
            height: 100%;
            left: 250px;
            transition: .5s;
        }

        section .rightmenu.active{
            width: calc(100% - 50px);
            left: 50px;
        }

        .rightmenu .topbar{
            width: 100%;
            background: #fff;
            height: 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        section .rightmenu .topbar .toggle{
            position: relative;
            display: inline-block;
            width: 60px;
            height: 60px;
            cursor: pointer; 
            line-height: 60px;
            font-size: 24px;
            text-align: center;
            color: #003147;
            transition: .5s;
        }

        section .rightmenu .topbar .header{
            position: relative;
            width: 400px;
            margin: 0 10px;
        }

        section .rightmenu .topbar .header label{
            position: relative;
            width: 100%;
        }

        section .rightmenu .topbar .header h2{
            text-align: center;
            font-weight: 600;
            background-image: linear-gradient(45deg , #003147, #03a9f4);
            color: transparent;
            background-clip: text;
            -webkit-background-clip: text;
        }

        section .rightmenu .topbar .header .dep2{
            display: none;
        }

        section .rightmenu .topbar .user{
            position: relative;
            width: 40px;
            height: 50px;
            border-radius:50%;
            margin-right: 5px;
            overflow: hidden;
        }

        section .rightmenu .topbar .user img{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        section .rightmenu .right-bottom-menu iframe{
            position: absolute;
            margin: 0;
            width: 100%;
            height: calc(100% - 60px);
        }

        /* Now Make Responsive for tabs*/

        @media (max-width:768px){

            section .navbar{
                width: 50px;
            }

            section .navbar.active{
                width:250px
            }

            section .rightmenu{
                width: calc(100% - 50px);
                left: 50px;
            }

            section .rightmenu.active{
                width: calc(100% - 250px);
                left: 250px;
            }

        }

        /* Heading when change browser width less tha 480px */
       
        @media (max-width:680px){

            section .rightmenu .topbar .header .dep1{
                display: none;
            }

            section .rightmenu .topbar .header .dep2{
                display: block;
            }
        }

         /* Now Make Responsive for Mobiles */

        @media (max-width:480px){

            section .navbar{
                width: 0px;
                z-index: 10;
            }

            section .navbar.active{
                width: 250px;
            }
            
            section .navbar ul{
                margin-top: 60px;
            }

            section .rightmenu .topbar .toggle.active{
                z-index: 100;
                color: #fff;
            }

            section .rightmenu{
                width: 100%;
                left: 0;
            }

            section .rightmenu.active{
                width: 100%;
                left: 0;
            }
                      
        } 

    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
    <section>

        <!-- left side navigation menu -->

        <div class="navbar" id="navigation">
            <ul class="center-nav">
                <li onclick="page('Dashboard.jsp','0px')" class="list">
                    <i class="fa-solid fa-house"></i>
                    <span class="title">Dashboard</span>
                </li>
                <li onclick="page('issue.jsp','50px')" class="list">
                    <i class="fa-solid fa-arrow-left"></i>
                    <span class="title">Book Issue</span>
                </li>
                <li onclick="page('Return.jsp','100px')" class="list">
                    <i class="fa-solid fa-arrow-right"></i>
                    <span class="title">Boook Return</span>
                </li>
                <li onclick="page('New.jsp','150px')" class="list">
                    <i class="fa-solid fa-plus"></i>
                    <span class="title">New</span>
                </li>
                <li onclick="page('Update.jsp','200px')" class="list">
                    <i class="fa-solid fa-upload"></i>
                    <span class="title">Update</span>
                </li>
                <li onclick="page('GetData.jsp','250px')" class="list">
                    <i class="fa-solid fa-database"></i>
                    <span class="title">Get Data</span>
                </li>
                <li onclick="page('History.jsp','300px')" class="list">
                    <i class="fa-solid fa-history"></i>
                    <span class="title">History</span>
                </li>
                <li onclick="page('Settings.jsp','350px')" class="list">
                    <i class="fa-solid fa-gear"></i>
                    <span class="title">Settings</span>
                </li>
                <li onclick="location.href='signout';" class="list">
                    <i class="fa-solid fa-sign-out"></i>
                    <span class="title">Sign out</span>
                </li>
                <li onclick="page('Dashboard.jsp','0px')" class="list">
                    <span class="title"><%=session.getAttribute("name") %></span>
                </li>
                <div class="anime"></div>
            </ul>
        </div>

        <!-- rignt side main menu -->

        <div class="rightmenu">
            <div class="topbar">
                <div class="toggle" onclick="toggleMenu();"><i class="fa-solid fa-bars"></i></div>
                <div class="header">
                    <h2 class="dep1">OPEN SOURCE LIBRARY SYSTEM</h2>
                    <h2 class="dep2">IT LIBRARY</h2>
                </div>
                <div class="user">
                    <img src="images/logo.png" alt="">
                </div>
            </div>
            <div class="right-bottom-menu">
                <iframe src="Dashboard.jsp" frameborder="0" id="Iframe" allow="fullscreen"></iframe>
            </div>
        </div>
    </section>
</body>
<script>

    // global declarartions

    var browser;
    var navbar = document.querySelector('.navbar');
    var navigation;
    var rightbody = document.querySelector('.rightmenu');
    var toggle = document.querySelector('.toggle');

    // Get Browser width dynamically

    (function (){
        window.onresize = browserWidth;
        window.onload = browserWidth;

        function browserWidth(){
        browser = window.innerWidth;
    };
    }) ();
    
    // menu button onclick event 

    function toggleMenu(){
        navbar.classList.toggle("active");
        toggle.classList.toggle("active");
        rightbody.classList.toggle("active");
    }


    function page(pagename,pos){
        navigation = navbar.offsetWidth;
        var frame = document.querySelector('#Iframe');
        var anime = document.querySelector('.anime');
        frame.setAttribute("src",pagename);
        anime.style.top=pos;

        //  nav bar onclick event for tabs

        if(browser<=768 && browser>=481 && navigation==250){
            toggleMenu();
        }

        // nav bar onclick event for mobiles 

        else if(browser<=480){
            toggleMenu();
        }

        console.log(navigation);
    }
</script>
</html>