<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Front Office</title>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>
		<header>
			<h1>Login</h1>
		</header>

		<div style="margin: 5%">
			<div class="zone" style="width:45%; float: left; height: 300px">
				<h2>Employé / Chef de division</h2>
				<form action="login" method="get">
					<table>
						<tr>
							<td class="lab">Username : </td>
							<td><input class="in" name="username" type="text" style="padding: 5px"></td>
						</tr>
						<tr>
							<td class="lab">Password : </td>
							<td><input class="in" name="password" type="password" style="padding: 5px"></td>
						</tr>
					</table>
					<input class='btn' name='submit_employe' type='submit' value='Login'>
				</form>
			</div>
			<div class="zone" style="width:45%; float: right; height: 300px">
				<h2>Citoyen</h2>
				<form action="login" method="get">
					<table>
						<tr>
							<td class="lab">CIN : </td>
							<td><input class="in" name="cin" type="text" style="padding: 5px"></td>
						</tr>
						<tr>
							<td class="lab"> </td>
							<td></td>
						</tr>
					</table>
					<input class='btn' name='submit_citoyen' type='submit' value='Login'>
				</form>
			</div>
		</div>

	</body>
</html>