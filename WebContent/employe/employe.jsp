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

	<%
	ManagerEmploye me = new ManagerEmploye();
	String username = (String) request.getSession().getAttribute("username");
	String proc = me.getProcFromIdEmpNormale(me.getEmploye(username).getId());
	int numerpEtape = me.getNumeroEtape(me.getEmploye(username).getId());
	
	ManagerDemande md = new ManagerDemande();
	FindIterable<Document> listDemandes = md.getSomeByProc(proc);
	%>
	
	<head>
		<title>Front Office | Employé [ <%= proc %> - <%= numerpEtape %> ]</title>	
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	
	<body>
	
	
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
					<tr>
						<td>Etape : </td>
						<td><%= numerpEtape %></td>
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
						<td><h1>Employé</h1></td>
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
				<h3>Demandes non traitées :</h3>
				<table class="tab">
					<thead>
						<tr>
							<th>CIN</th>
							<th>Documents</th>
							<th>Jeton</th>
							<th>Traiter</th>
						</tr>
					</thead>
					<tbody>
						<% 
						for(Document doc: listDemandes) { 
							ArrayList<Object> demande = new ArrayList<>(doc.values());
							if( ((String)demande.get(2)).equals(proc) && (int)demande.get(5)==numerpEtape && (boolean)demande.get(6)==true) { 
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
										<form action="employe">
											<input type="hidden" name="jeton" value="<%= demande.get(4) %>">
											<input type="hidden" name="action" value="traiter">
											<input type="submit" name="accept" class="btn1" value="Traiter">
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
		</div>
	</body>
	
	
	
	
</html>