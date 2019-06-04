<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Front Office | Citoyen</title>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>
		
		<div class="sidebar">
			<div class="side-zone">
				<h3>Informations :</h3>
				<table>
					<tr>
						<td>CIN : </td>
						<td><%= request.getSession().getAttribute("cin") %></td>
					</tr>
				</table>
			</div>
			
			<a href="/Front/citoyen"><button class="btn">Back</button></a>
			
		</div>
		
		<div class="main">
			<header>
				<table>
					<tr>
						<td></td>
						<td></td>
						<td><h1>Citoyen</h1></td>
						<td></td>
						<td></td>
						<td>
							<form action="login">
								<input name="logout" class="btn" type="submit" value="Logout" style="float:right"/>
							</form>
						</td>
					</tr>
				</table>
			</header>
			
			<div class="zone">
				<h1>Operation faite avec succés ^_^</h1>
				<hr>
				<h2>Jeton</h2>
				<h4 style="color: red"><%= request.getSession().getAttribute("jeton") %></h4>
			</div>
			
		</div>
	
	</body>
</html>