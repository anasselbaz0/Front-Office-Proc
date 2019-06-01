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
		<script>
			function nouvelles() {
				document.getElementById("nouvelles").style.display = "block";
				document.getElementById("encours").style.display = "none";
				document.getElementById("archivees").style.display = "none";
			}
			function encours() {
				document.getElementById("nouvelles").style.display = "none";
				document.getElementById("encours").style.display = "block";
				document.getElementById("archivees").style.display = "none";
			}
			function archivees() {
				document.getElementById("nouvelles").style.display = "none";
				document.getElementById("encours").style.display = "none";
				document.getElementById("archivees").style.display = "block";
			}
		</script>
	</head>
	
	<body>
	
	<%
	ManagerEmploye me = new ManagerEmploye();
	String username = (String) request.getSession().getAttribute("username");
	String proc = me.getProcFromIdEmp(me.getEmploye(username).getId());
	
	ManagerDemande md = new ManagerDemande();
	FindIterable<Document> listDemandes = md.getSomeByProc(proc);
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
			<div class="zone" id="nouvelles" style="display: block">
				<h3>Nouvelles demandes :</h3>
				<table class="tab">
					<thead>
						<tr>
							<th>CIN</th>
							<th>Documents</th>
							<th>Jeton</th>
							<th>Accepter</th>
						</tr>
					</thead>
					<tbody>
						<% 
						for(Document doc: listDemandes) { 
							ArrayList<Object> demande = new ArrayList<>(doc.values());
							if((boolean) demande.get(6) == false) { 
						%>
								<tr>
									<td><%= demande.get(1) %></td>
									<td>
										<ul>
										<% 
										Document documents = (Document) demande.get(3);
										for(int j=0; j<documents.size(); j++) { %>
											<li><%= documents.getString("document"+String.valueOf(j+1)) %></li>
										<% } %>
										</ul>
									</td>
									<td><%= demande.get(4) %></td>
									<td>
										<form action="chef">
											<input type="hidden" name="jeton" value="<%= demande.get(4) %>">
											<input type="hidden" name="action" value="accepter">
											<input type="submit" name="accept" class="btn1" value="Accepter">
										</form>
									</td>
								</tr>
						<%
							}
						}
						%>
					</tbody>
				</table>
			</div>
			<div class="zone" id="encours" style="display: none">
				<h3>Demandes en cours de traitement :</h3>
				<table class="tab">
					<thead>
						<tr>
							<th>CIN</th>
							<th>Documents</th>
							<th>Jeton</th>
							<th>Etat</th>
							<th>Archiver</th>
						</tr>
					</thead>
					<tbody>
						<% for(Document doc: listDemandes) { 
							ArrayList<Object> demande = new ArrayList<>(doc.values());
							if((boolean)demande.get(6)==true && (boolean)demande.get(7)==false) { 
						%>
							<tr>
								<td><%= demande.get(1) %></td>
								<td>
									<ul>
									<% 
									Document documents = (Document) demande.get(3);
									for(int j=0; j<documents.size(); j++) { %>
										<li><%= documents.getString("document"+String.valueOf(j+1)) %></li>
									<% } %>
									</ul>
								</td>
								<td><%= demande.get(4) %></td>
								<td><%= demande.get(5) %></td>
								<td>
									<form action="chef">
										<input type="hidden" name="jeton" value="<%= demande.get(4) %>">
										<input type="hidden" name="action" value="archiver">
										<input type="submit" name="accept" class="btn1" value="Archiver">
									</form>
								</td>
							</tr>
						<%
							}
						}
						%>
					</tbody>
				</table>
			</div>
			<div class="zone" id="archivees" style="display: none">
				<h3>Demandes archivées :</h3>
				<table class="tab">
					<thead>
						<tr>
							<th>CIN</th>
							<th>Documents</th>
							<th>Jeton</th>
						</tr>
					</thead>
					<tbody>
						<% for(Document doc: listDemandes) { 
							ArrayList<Object> demande = new ArrayList<>(doc.values());
							if((boolean) demande.get(7) == true) { 
						%>
							<tr>
								<td><%= demande.get(1) %></td>
								<td>
									<ul>
									<% 
									Document documents = (Document) demande.get(3);
									for(int j=0; j<documents.size(); j++) { %>
										<li><%= documents.getString("document"+String.valueOf(j+1)) %></li>
									<% } %>
									</ul>
								</td>
								<td><%= demande.get(4) %></td>
							</tr>
						<%
							}
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	
	</body>
	
	
	
	
</html>