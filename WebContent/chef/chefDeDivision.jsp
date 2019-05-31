<%@page import="api_front_back.metier.Processus"%>
<%@page import="api_front_back.metier.ManagerProcessus"%>
<%@page import="api_front_back.metier.ManagerEmploye"%>
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
		</div>
		
		<div class="main">
			<header>
				<h1>Chef de division</h1>
			</header>
			<div class="zone">
				<h3>Les demandes :</h3>
				<table class="tab">
					<thead>
						<tr>
							<th>CIN</th>
							<th>Documents</th>
							<th>Jeton</th>
							<th>Acceptée</th>
						</tr>
					</thead>
					<tbody>
						<% 
						ManagerDemande md = new ManagerDemande();
						me = new ManagerEmploye();
						proc = me.getProcFromIdEmp(me.getEmploye(username).getId());
						FindIterable<Document> listDemandes = md.getSomeByProc(proc);
						for(Document doc: listDemandes) { 
							System.out.println(doc);
						%>
						<tr>
							<td><%= doc.getInteger("cin",0) %></td>
							<td>
								<ul>
								<% 
								Document documents = (Document) doc.get("documents");
								for(int j=0; j<documents.size(); j++) { %>
									<li><%= documents.getString("document"+String.valueOf(j+1)) %></li>
								<% } %>
								</ul>
							</td>
							<td><%= doc.getString("jeton") %></td>
							<td><%= doc.getString("isAccepted") %></td>
						</tr>
					<% } %>
					</tbody>
				</table>
			</div>
		</div>
	
	</body>
	
	
	
	
</html>