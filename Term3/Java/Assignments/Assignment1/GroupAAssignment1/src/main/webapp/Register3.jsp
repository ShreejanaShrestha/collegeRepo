<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Form</title>
</head>
<script type="text/javascript">
function openPage(pageURL)
{
window.location.href = pageURL;
}
</script>
<body>
	<form action="Login" method="post">
		<table style="with: 50%">
			<tr>
				<td>UserName</td>
				<td><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" /></td>
			</tr>
		</table>
		<input type="submit" value="Login" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</form>
<input type="button" value="Sign Up" onclick="openPage('index.jsp')" />

</body>
</html>