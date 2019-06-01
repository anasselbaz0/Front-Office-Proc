<%@page import="api_front_back.metier.Processus"%>
<%@page import="api_front_back.metier.ManagerProcessus"%>
<%@page import="api_front_back.metier.ManagerEmploye"%>
<%@page import="metier.ManagerDemande"%>
<%@page import="org.bson.Document"%>
<%@page import="java.util.*"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Front Office</title>	
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	
	<body>
	
	<%
	ManagerEmploye me = new ManagerEmploye();
	String username = (String) request.getSession().getAttribute("username");
	String proc = me.getProcFromIdEmp(me.getEmploye(username).getId());
	%>
	
		<div class="sidebar">
			<div class="side-zone">
				<h3>Informations :</h3>
				<table>
					<tr>
						<td>Username : </td>
						<td><%= username %></td>
					</tr>
					<tr>
						<td>Processus : </td>
						<td><%= proc %></td>
					</tr>
				</table>
			</div>
			<button class="btn" onclick="nouvelles()">Nouvelles demandes</button>
			<br>
			<button class="btn" onclick="encours()">Demandes en cours</button>
			<br>
			<button class="btn" onclick="archivees()">Demandes archivées</button>
		</div>
		
		<div class="main">
			<header>
				<h1>Chef de division</h1>
			</header>
			<div class="zone">
				<h1>Opération échouée :/</h1>
			</div>
		</div>
	</body>
	
	
	
	
</html>