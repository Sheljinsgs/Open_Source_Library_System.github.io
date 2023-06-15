<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Return Page</title>
    <style>

        body{
            margin: 0;
            padding: 0;
            border: 0;
            font-family: sans-serif;
            font-weight: 500;
        }

        .container{
            position: absolute;
            width: 100%;
            height: 100%;
            display: grid;
            justify-content: center;
            align-items: center;
        }

        .return form{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 14px;
            padding: 3em 1em;
            width: 300px;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, .1);
        } 
        
        h2{
            color: #000;
            font-weight:bolder;
            margin: 10px ;
        }

        .container .return form .input-box{
            position: relative;
            width: 90%;
        }

        .container .return form .input-box input{
            width: 100%;
            height: 30px;
            padding: 5px;
            border: 1px solid #000;
            border-radius: 2px;
            outline: none;
            color: #000;
            background: transparent;
        }

        .container .return form .input-box span{
            position: absolute;
            left: 10px;
            top: 25%;
            color: #000;
            transition: .4s;
            pointer-events: none;
        }

        .container .return form .input-box input:valid~span,
        .container .return form .input-box input:focus~span{
            top: -5px;
            font-size: xx-small;
            transform: translateX(-2px);
            border-radius: 2px;
            padding: 0px 8px;
            background: #fff;
        }

        .container .return form .submit{
            width: 100%;
            height: 40px;
            padding: 5px;
            border: none;
            margin-top: 20px;
            cursor: pointer;
            font-size: large;
            background: #000080;
            color: #fff;
            transition: .2s;
        }

        .container .return form .submit:hover{
            background: none;
            border: 1.5px solid #000080;
            box-shadow: 0px 0px 7px #000080;
            color: #000080;
        }

    </style>
</head>
<body>
<%
	String msg = (String) request.getAttribute("status");
	System.out.println(msg);
%>
    <div class="container">
        <div class="return">
            <form action="ReturnServlet" method="post">
                <h2>Book Return</h2>
                <div class="input-box">
                    <input type="text" class="rollno" name="RollNo" required>
                    <span>Enter RollNo</span>
                </div>
                <div class="input-box">
                    <input type="text" class="bookid" name="BookId" required>
                    <span>Enter BookId</span>
                </div>
                <button class="submit">Return</button>
            </form>
        </div>
    </div>
</body>
<script>
	<% if(msg!=null){%>
	var msg ='<%=msg%>';
	console.log(msg);
	alert(msg);
	<%}%>
</script>
</html>