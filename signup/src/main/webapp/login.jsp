<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Staff Login</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
.form-submit{
	 padding: 8px 10px;
           border: 1px solid ;
           border-radius: 4px;
           color: #fff;
           text-align:center;
           width:50%;
           cursor: pointer;
}

</style>
</head>
<body>

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
					<h2 class="form-title">Open Source Library System</h2>
						<div class="form-group form-button">
                <input type="submit" class="form-submit" value="Admin" onclick="location.href='admin_login.jsp'" id="AdminBtn">
            </div>
            <div class="form-group form-button">
                <input type="submit" class="form-submit" value="Staff" onclick="location.href='Stafflogin.jsp';" id="StaffBtn">
            </div>
            <div class="form-group form-button">
                <input type="submit" class="form-submit" value="Student" onclick="location.href='Studentlogin.jsp';" id="StudentBtn">
            </div>
					</div>
				</div>
			</div>
		</section>

	</div>
</body>
</html>