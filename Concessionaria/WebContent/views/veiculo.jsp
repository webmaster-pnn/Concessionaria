<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html
xmlns="http://www.w3.org/1998/xhtml"
xmlns="http://xmlns.jsp.org/jsf/html"
xmlns="http://primefaces.org/ui"
>
	
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Veiculos</title>

</head>
<body >
	
	
	
	<nav class="navbar navbar-dark bg-dark" style="padding-right: 100px;">
		<a  style="color: white;" class="navbar-toggler"><span class="navbar-toggler-icon"></span> Home </a>
		<% if(session.getAttribute("id") != null){ %>
		<div class="dropdown">
			
			<a style="color: white" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" >Logout</a>
			<div class="dropdown-menu text-center">
				<a>${nome}</a>
				<a class="dropdown-item">Perfil</a>
				<a  class="dropdown-item" href="/Concessionaria/usuario/listar"> Usuarios</a>
				<a class="dropdown-item" href="/Concessionaria/veiculo/listar">Veiculos</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" style="cursor: pointer;">sair</a>

			
			
			</div>
			<%}  else { %>
				<ul class="nav justify-content-center">
				  <li class="nav-item">
				    <a style="color: white;" class="nav-link active" href="login">Login</a>
				  </li>
					<li class="nav-item">
				    <a style="color: white;" class="nav-link active" href="cadastro">cadastrar</a>
				  </li>
				</ul>
			<%} %>
		</div>
	</nav>
	
    <div class="container">
		<table class="table table-striped">
			<caption>Lista de Veiculos </caption>
			<thead>
				<tr>
					
					<th>modelo</th>
					<th>ano</th>					
					<th>chassi</th>
					<th>valor unitario</th>
					<th>quantidade</th>
					<th colspan="2">Selecionar</th>
				</tr>
			</thead>
			<tbody>
		
				<!-- Tag responsavel por fazer repetições no HTML c:foreach -->
				<c:forEach items="${veiculo}" var="v">
				<!-- EL - Expression Language -->
					<tr>
						<form action="/Concessionaria/pedido/adicionar" method="post" >
					
						<input type="hidden" value="${v.id_Veiculo}" name="id"/> 
						<td >${v.modeloVeiculo}</td>
						<td >${v.anoVeiculo}</td>
						
						<td>${v.chassiVeiculo}</td>
						<td>${v.valorVeiculo}</td>
						<td><input type="number" value="1" min="1" name="quantidade"/></td>	
						<td><input type="submit" value="selecionar"/></td>
					
					</form>
									</tr>
				</c:forEach>
				
				
				
			</tbody>
			<% int i = 1; %>
		</table>
		
		
				<table class="table table-striped">
			<caption>Carrinho de compra </caption>
			<thead>
				<tr>
					<th>item</th>
					<th>quantidade</th>
					<th>veiculo</th>					
					<th>valor(R$)</th>
					<th>valor total</th>
					<th colspan="2">retirar</th>
				</tr>
			</thead>	
			<tbody>
			
				<!-- Tag responsavel por fazer repetições no HTML c:foreach -->
				<c:forEach items="${carrinho}" var="c">
				<!-- EL - Expression Language -->
					<tr>
						<form action="/Concessionaria/pedido/remover" method="post" >
					
						<input type="hidden" value="${c.id_item}" name="id_item"/> 
						<td>  <% out.print(i); %>  </td>
						<td >${c.quantidade}</td>
						<td >${c.veiculo.modeloVeiculo}</td>
						<td >${c.veiculo.valorVeiculo}</td>
						<td >${c.sub_Total}</td>

						<td><input class="btn btn-danger" type="submit" value="retirar"/></td>
					
					</form>
									</tr> <% i++; %>
				</c:forEach>
				
					<tr>
				
						<td colspan="6">
							<center>
					<h3 style="color:red;" >Valor Total R$:${valor}</h3>
					
				
					<input class="btn btn-primary" type="submit" value="Finalizar compra" />	</center>
					
					
					</td>
					</tr>			
			</tbody>
		</table>
	</div>
	
	
	
	


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>