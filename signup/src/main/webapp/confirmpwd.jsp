<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <style>
        body{
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            height: 100dvh;
            display: grid;
            place-items: center;
            background:  #d1d1e0;
        }

        form{
            width: 250px;
            display: flex;
            flex-direction: column;
            /* border: 1px solid black; */
            padding: 40px;
            border-radius: 5px;
            box-shadow: 10px 10px 20px rgba(0,0,0,0.1);
            background: #fff;
        }

        form input{
            margin-top: 5px;
            width: 100%;
            height: 25px;
            border-radius: 5px;
            border: .1px solid #999;
            padding:3px 8px;
            outline:none;
        }

        label{
            margin-top: 15px;
        }

        .btn{
            width: 80px;
            padding: 5px 0px;
            text-align: center;
            margin-top: 10px;
            background: #0073e6;
            color: #fff;
            border-radius: 4px;
            border: 0;
            font-size: large;
            cursor:pointer;
        }
        
        .email{
        	border:0;
        	outline:0;
        	cursor: inherit;
        	
        }


    </style>
</head>
<body>
<%
	String email = (String) request.getAttribute("email");
%>
    <div class="conatiner">
        <form method="post" action="changepswd">
        	<input type="text" class="email" readonly>
            <label for="pwd">Enter Password</label>
            <input type="password" class="pwd" name="pwd">
            <label for="cpwd">Confirm Password</label>
            <input type="password" class="cpwd" name="cpwd">
            <button class="btn" onclick="fun()">Submit</button>
        </form>
    </div>
</body>
<script>
	var email = '<%=email%>'
	document.querySelector('.email').value=email;
	
	function fun(){
		var pwd = document.querySelector('.pwd').value;
		var cpwd = document.querySelector('.cpwd').value;
		if(pwd=='' || cpwd==''){
			event.preventDefault();
			alert("Please enter the password");
		}
		else if(pwd.length()<8){
			event.preventDefault();
			alert("Please enter atleast 8 digit password");
		}
		else if(!pwd.match(/[a-z]/g)){
			event.preventDefault();
			alert("Enter atleast one small character");
        }
        else if(!passwordVal.match(/[A-Z]/g)){
        	event.preventDefault();
            alert('Enter atleast one uppercase character')
        }
        else if(!passwordVal.match(/[0-9]/g)){
        	event.preventDefault();
            alert('Enter atleast one digit number')
        }
		else if(pwd!=cpwd){
			event.preventDefault();
			alert("Check your confirm password");
		}
	}
</script>

</html>