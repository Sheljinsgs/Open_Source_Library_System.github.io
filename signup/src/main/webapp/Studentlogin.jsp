<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Student Login</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/collagelogo.png" alt="sing up image">
						</figure>
						<h3 class="signup-image-link" style="color:#0047b3">Department Of<br> Information Technology</h3>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Student login</h2>
						<form method="post" action="StudentloginServlet" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="rollno"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="rollno" id="rollno"
									placeholder="Your rollno" required/>
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pswd" id="pswd"
									placeholder="Password" required/>
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
							<div>
							<a href="forgot.jsp">forgot password?</a>
							</div><br><br>
							<div>
							<a href="Studentsignup.jsp" class="signup-image-link">Create an
							account</a>
							</div>
						</form>
						<!--  <div class="social-login">
							<span class="social-label">Or login with</span>
							<ul class="socials">
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-facebook"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-twitter"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-google"></i></a></li>
							</ul>
						</div> -->
					</div>
				</div>
			</div>
		</section>

	</div>

   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status == "failed"){
	swal("sorry","Wrong Username or Password","error");
	}
	else if(status == "invalidrollno"){
		swal("sorry","please Enter the Rollno","error");
		}
	else if(status == "invalidpswd"){
		swal("sorry","please Enter the Password","error");
		}
	</script>
</body>
</html>