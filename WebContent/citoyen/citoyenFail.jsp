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
				<h1>Operation échouée :/</h1>
			</div>
			
		</div>
	
	</body>
</html>