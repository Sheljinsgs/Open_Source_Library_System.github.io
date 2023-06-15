<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="DashboardServlet" method="post" id="form">
	</form>
</body>
<script type="text/javascript">

function formAutoSubmit () {

var frm = document.getElementById("form");

frm.submit();

}

window.onload = formAutoSubmit;

</script>
</html>