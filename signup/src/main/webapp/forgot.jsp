<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>

        body{
            margin: 0;
            padding: 0;
            height: 100dvh;
            display: grid;
            place-items: center;
            font-family: sans-serif;
            background: #e0e0eb;
        }

        .container{
            display: flex;
            flex-direction: column;
            gap: 20px;
            align-items: center;
        }

        .instruction{
            background: #fff;
            padding: 20px 30px;
            border-radius: 5px;
            width: 100%;
        }

        .instruction h1{
            margin-top: 0;
        }

        ol{
            padding-left: 30px;
            list-style: none;
            counter-reset: li;
            margin-left: -30px;
        }

        li::before {
            content: counter(li); 
            color: #0088cc;
            display: inline-block; 
            width: 1em;
        }

        li {
            counter-increment: li
        }

        form{
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 10px;
            background: #fff;
            padding: 20px 30px;
            border-radius: 5px;
        }

        label{
            font-size: large;
        }

        input{
            padding: 5px;
            border-radius: 4px;
            outline: none;
            border: 1px solid #999;
            width: 100%;
        }

        button{
           padding: 8px 10px;
           border: 1px solid ;
           border-radius: 4px;
           font-size: large;
           background-color: #3333cc;
           color: #fff;
           cursor: pointer;
        }

        p{
            margin: 0;
        }

        .btn{
            display: flex;
            gap: 10px;
        }

        .error{
            color: rgb(242,18,18);
            font-size: 16px;
        }

        .verification{
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            display: none;
            flex-direction: column;
            gap: 10px;
            width:400px;
            
        }

        .verify{
            width: 100px;
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="instruction">
            <h1>Forgot your password?</h1>
            <p>Change your password in three easy steps. This will help you to secure your password!</p>
            <ol>
                <li>Enter your email address below.</li>
                <li>Our system will send you an OTP to your email.</li>
                <li>Enter the OTP on the next page.</li>
            </ol>
        </div>
        <form >
            <label for="email">Enter your email address</label>
            <input type="text" class="email">
            <p>Enter the registered email address.Then we'll email a OTP to this address</p>
            <div class="error"></div>
            <div class="btn"><button onclick="fun()">Send OTP</button>
                <button onclick="fun1()">Cancel</button>
            </div>
        </form>
            <form class="verification" action="ForgotPassword" method="post">
            	<p class="time">Enter the OTP before 90 seconds</p>
	            <input type="text" class="otp">
	            <input type="hidden" name="email" class="email1">
	            <div>
	                <button class="verify" onclick="verifyOTP()">Verify</button>
	            	<button class="resent" onclick="fun()">Resend</button>
	            </div>
            </form>
    </div>
</body>
<script src="https://smtpjs.com/v3/smtp.js"></script>
<script type="text/javascript">
    const errorElement = document.querySelector('.error');
    var mailformat = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    var verifyBlock = document.querySelector('.verification');
    var OTP=""
    var TotTime;
    function fun(){
        event.preventDefault();
        var email = document.querySelector('.email');
        var emailval=email.value;
        OTP=""
        TotTime=90;
        if(emailval===''){
            errorElement.innerHTML='Enter the email';
            return;
        }

        else if(!emailval.match(mailformat)){
            errorElement.innerHTML='Enter the correct email'
            return;
        }

        errorElement.innerHTML=""

        var num = "1234567890"
        for(let i=0;i<6;i++){
            var ran = Math.floor(Math.random()*9);
            OTP+=num.charAt(ran);
        }
        verifyBlock.style.display="flex"
        setInterval(displayTimeOut,1000)
        document.querySelector('.instruction').style.display="none";
        Email.send({
		          Host: "smtp.elasticemail.com",
		          Username: "N.G.P.IT.DepartmentLibrary@gmail.com",
		          Password: "143ED0996F028BF0098A114C3AC6932CCA05",
		          To: emailval,
		          From: "N.G.P.IT.DepartmentLibrary@gmail.com",
		          Subject: "OTP from IT Department Library",
		          Body: OTP,
		        }).then(function (message) {
		          alert("mail sent successfully.Check your spam box");
		});
        console.log(OTP);
    }

    function fun1(){
        event.preventDefault();
        location.href="login.jsp";
    }

    function verifyOTP(){
        var userOTP = document.querySelector('.otp').value;
        console.log(OTP)
        if(userOTP==''){
        	event.preventDefault();
            alert("Enter the OTP");
            return;
        }
        else if(userOTP!=OTP){
        	event.preventDefault();
            alert("Invalid OTP");
            return;
        }
        if(OTP==userOTP){
        	 var email = document.querySelector('.email').value;
        	 document.querySelector('.email1').value=email;
            location.href='confirmPwd.jsp'
        }
    }

    function displayTimeOut(){
     var timeOut = document.querySelector('.time');
     if(TotTime==0){
        location.reload();
     }
     timeOut.innerHTML="Enter the OTP before "+ TotTime--+" seconds"
    }
</script>
</html>