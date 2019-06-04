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
		<title>Front Office | Citoyen</title>	
		<link rel="stylesheet" type="text/css" href="style.css">
		<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,600,700' rel='stylesheet' type='text/css'>
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
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
			
			<div>
				<ul class="timeline" id="timeline">
					<li class="li complete">
						<div class="timestamp">
							<span>Nom etape 1</span>
						</div>
						<div class="status">
							<h4>1</h4>
						</div>
					</li>
					<li class="li">
						<div class="timestamp">
							<span>Nom etape 2</span>
						</div>
						<div class="status">
							<h4>2</h4>
						</div>
					</li>
					<li class="li">
						<div class="timestamp">
							<span>Nom etape 3</span>
						</div>
						<div class="status">
							<h4>3</h4>
						</div>
					</li>
					<li class="li">
						<div class="timestamp">
							<span>Nom etape 4</span>
						</div>
						<div class="status">
							<h4>4</h4>
						</div>
					</li>
				 </ul>
			</div>
			
			<div class="zone" id="deposer" style="display: block">
				<table>
					<tr>
						<td>Jeton : </td>
						<td><%= request.getParameter("jeton") %></td>
					</tr>
					<tr>
						<td>Processus : </td>
						<td><%= request.getAttribute("processus") %></td>
					</tr>
					<tr>
						<td>Acceptée : </td>
						<td><%= request.getAttribute("isAccepted") %></td>
					</tr>
					<tr>
						<td>Documents : </td>
						<td>
							<table>
								<%
								Document docs = (Document) request.getAttribute("documents");
								ArrayList<Object> v = new ArrayList<>(docs.values());
								for(int i=0; i<v.size(); i++) { %>
									<tr>
										<td><%= v.get(i) %></td>
										<td><a href="/Front/gererdocuments?ordre=<%= i %>&action=supprimer&jeton=<%= request.getParameter("jeton") %>"><button class="btn">Supprimer</button></a></td>
									</tr>
								<% } %>
							</table>
						</td>
						<td><button class="btn1">Ajouter document</button></td>
					</tr>
				</table>
			</div>
			
		</div>
	
	</body>
	
	
	
	
</html>