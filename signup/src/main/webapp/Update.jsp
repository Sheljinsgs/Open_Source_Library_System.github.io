<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Book</title>
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

        .issue form{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 14px;
            padding: 3em 1em;
            width: 300px;
            border-radius: 8px;
            box-shadow: 0px 0px 30px rgba(0, 0, 0, .1);
        } 
        
        h2{
            color: #000;
            font-weight:bolder;
            margin: 10px ;
        }

        .container .issue form .input-box{
            position: relative;
            width: 90%;
        }

        .container .issue form .input-box input{
            width: 100%;
            height: 30px;
            padding: 5px;
            border: 1px solid #000;
            border-radius: 2px;
            outline: none;
            color: #000;
            background: transparent;
        }

        .container .issue form .input-box span{
            position: absolute;
            left: 10px;
            top: 25%;
            color: #000;
            pointer-events: none;
            transition: .4s;
        }

        .container .issue form .input-box input:valid~span,
        .container .issue form .input-box input:focus~span{
            top: -5px;
            font-size: xx-small;
            transform: translateX(-2px);
            border-radius: 2px;
            padding: 0px 8px;
            background: #fff;
        }

        .container .issue form .submit{
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

        .container .issue form .submit:hover{
            background: none;
            border: 1.5px solid #000080;
            box-shadow: 0px 0px 25px #000080;
            color: #000080;
        }

    </style>
</head>
<body>
<%
	String msg = (String) request.getAttribute("status");
%>
    <div class="container">
        <div class="issue">
            <form action="UpdateServlet" method="post">
                <h2>UPDATE BOOK</h2>
                <div class="input-box">
                    <input type="text" class="rollno" name="col1" required>
                    <span>Correct Accession Number</span>
                </div>
                <b>Enter Changes</b>
                <div class="input-box">
                    <input type="text" class="rollno" name="col2" required>
                    <span>Author</span>
                </div>
                <div class="input-box">
                    <input type="text" class="bookid" name="col3" required>
                    <span>Title</span>
                </div>
                <div class="input-box">
                    <input type="text" class="rollno" name="col4" required>
                    <span>Publisher</span>
                </div>
                <div class="input-box">
                    <input type="text" class="bookid" name="col5" required>
                    <span>Price</span>
                </div>
                <div class="input-box">
                    <input type="text" class="rollno" name="col6" required>
                    <span>Edition</span>
                </div>
                <div class="input-box">
                    <input type="text" class="bookid" name="col7" required>
                    <span>Year</span>
                </div>
                <div class="input-box">
                    <input type="text" class="rollno" name="col8" required>
                    <span>Call No</span>
                </div>
                <button class="submit">Issue</button>
            </form>
        </div>
    </div>
</body>
<script>
	<% if(msg!=null){%>
	var msg ='<%=msg%>';
	alert(msg);
	<%}%>
</script>
</html>