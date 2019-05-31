<%@page import="api_front_back.metier.Processus"%>
<%@page import="api_front_back.metier.ManagerProcessus"%>
<%@page import="metier.ManagerDemande"%>
<%@page import="org.bson.Document"%>
<%@page import="java.util.*"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
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
			<br><button class="btn" onclick="suivre()">suivre mes demandes</button>
		</div>
		
		
		<div class="main">
		
			<header>
				<h1>Citoyen</h1>
			</header>
			
			<div class="zone" id="deposer" style="display: block">
				<h3>Déposer une demande :</h3>
				<form action="deposerdemande">
					<table>
						<%
						int nbrDocuments = Integer.parseInt(request.getParameter("nbrDocuments"));
						for(int i=1; i<=nbrDocuments; i++) { %>
							<tr>
								<td>Document <%= i %> :</td>
								<td>
									<input type="file" name="document<%= i %>">
								</td>
							</tr>
						<% } %>
					</table>
					<input name="nbrDocuments" type="hidden" value="<%= request.getParameter("nbrDocuments") %>"/>
					<input name="processus" type="hidden" value="<%= request.getParameter("processus") %>"/>
					
					<input class="btn" value="Deposer" name="submit_deposer_finale" type="submit"/>
				
				</form>
			</div>
			
			
		</div>
	
	</body>
	
	
	
	
</html>