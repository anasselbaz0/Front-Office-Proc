<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Front Office</title>
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
			
			<button class="btn" onclick="deposer()">Déposer un demande</button>
			<button class="btn" onclick="suivre()">suivre mes demandes</button>
			
		</div>
		
		<div class="main">
			<header>
				<h1>Citoyen</h1>
			</header>
			
			<div class="zone">
				<h1>Operation échouée :/</h1>
			</div>
			
		</div>
	
	</body>
</html>