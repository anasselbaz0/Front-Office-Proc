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
		<script>
			function deposer() {
				document.getElementById("deposer").style.display = "block";
				document.getElementById("suivre").style.display = "none";
				document.getElementById("suivre1").style.display = "none";
			}
			function suivre() {
				document.getElementById("suivre").style.display = "block";
				document.getElementById("suivre1").style.display = "block";
				document.getElementById("deposer").style.display = "none";
			}
		</script>
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
			<div class="zone" id="deposer" style="display: block">
				<h3>Déposer une demande :</h3>
				<form action="deposerdemande">
						<table>
						<tr>
							<td>Choisir un processus :</td>
							<td>
								<select class="in" name="processus">
									<% 
									ManagerProcessus mp = new ManagerProcessus();
									ArrayList<Processus> list = mp.getAll();
									for(int i=0; i<list.size(); i++) { 
									%>
										<option><%= list.get(i).getNom() %></option>	
									<% 
									} 
									%>
								</select>
							</td>
						</tr>
						<tr>
							<td>Nombre de documents :</td>
							<td><input class="in" name="nbrDocuments" type="number"/></td>
						</tr>
					</table>
					<input class="btn" value="Deposer" name="submit_deposer" type="submit"/>
				</form>
			</div>
			
			<div class="zone" id="suivre" style="display: none">
				<h3>Suivre une demande :</h3>
				<form action="suividemande">
					Jeton :
					<input name="jeton" type="text" style="margin: 5px;"/>
					<input class="btn" value="Rechercher" name="submit_recherche_jeton" type="submit"/>
				</form>
			</div>
			
			<div class="zone" id="suivre1" style="display: none">
				<h3>Mes demandes :</h3>
				<table class="tab">
					<thead>
						<tr>
							<th>Processus</th>
							<th>Document</th>
							<th>Jeton</th>
							<th>Acceptée</th>
						</tr>
					</thead>
					<tbody>
					<% 
					ManagerDemande md = new ManagerDemande();
					String cin = (String) request.getSession().getAttribute("cin");
					FindIterable<Document> listDemandes = md.getSomeByCIN(cin);
					for(Document doc: listDemandes) { 
						ArrayList<Object> vals = new ArrayList<>(doc.values());
					%>
						<tr>
							<td><%= vals.get(2) %></td>
							<td>
								<ul>
								<% 
								Document doc1 = (Document) vals.get(3);
								ArrayList<Object> vals1 = new ArrayList<>(doc1.values());
								for(int j=0; j<vals1.size(); j++) { %>
									<li><%= vals1.get(j) %></li>
								<% } %>
								</ul>
							</td>
							<td><%= vals.get(4) %></td>
							<td><%= vals.get(6) %></td>
						</tr>
					<% } %>
					</tbody>
				</table>
			</div>
		</div>
	
	</body>
	
	
	
	
</html>