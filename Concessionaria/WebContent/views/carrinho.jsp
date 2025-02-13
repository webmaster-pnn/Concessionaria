<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
		<%int i = 1;%>
<head>
    <!-- Meta tags Obrigatórias -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="novocarrinho.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="shortcut icon" href="imagens/favicon.png" type="image/x-png" />

    <script src="https://kit.fontawesome.com/c766cb3ea7.js"></script>

    <title>Carrinho | SM</title>

</head>

<body>

    <!--################### NAV BAR ##########################-->


    <nav id="navbar" class="navbar navbar-expand-lg navbar-dark bg-red fixed-top">

        <main class="container">

            <a class="navbar-brand" href="index.html">
                <img id="logo" src="./imagens/logo.png" alt="">
            </a>



            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado"
                aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navega��o">
                <span class="navbar-toggler-icon"></span>
            </button>


            <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
                <ul class="navbar-nav mr-auto">


                    <li class="nav-item">
                        <a class="nav-link" href="index.html"><i class=""></i>HOME</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            VEICULOS
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="chevrolet.html">CHEVROLET</a>
                            <a class="dropdown-item" href="fiat.html">FIAT</a>
                            <a class="dropdown-item" href="ford.html">FORD</a>
                            <a class="dropdown-item" href="honda.html">HONDA</a>
                            <a class="dropdown-item" href="renault.html">RENAULT</a>
                            <a class="dropdown-item" href="volks.html">VOLKSWAGEN</a>
                            <div class="dropdown-divider"></div>
                        </div>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="cadastro.html"><i class=""></i>CADASTRO</span></a>
                    </li>
                </ul>
                <ul class="navbar-nav mr-">
                    <li class="nav-item active" style="float:right">
                        <a class="nav-link" href="login.html" data-toggle=""
                            style="font-size: 1.2em; font-weight: bold;"><span><i class="fas fa-sign-in-alt"></i></span>
                            FAZER LOGIN</a>
                    </li>
                </ul>

                <ul class="navbar-nav mr-">
                    <li class="nav-item active">
                        <a class="nav-link" href="carrinho.html"><i class="fas fa-shopping-cart"></i></span></a>
                    </li>
                </ul>
            </div>

            <div class="dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false" style="font-size: 1.2em; font-weight: bold;">
                    LOGOUT
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="background: black;">
                    <a class="dropdown-item" href="">Nome</a>
                    <a class="dropdown-item" href="perfil.html">Perfil</a>
                    <a class="dropdown-item" href="index.html">Sair</a>
                </div>
            </div>
    </nav>

    <br>
    <br><br><br>
    <br>
    <br>
    <br>
    <!-- Carrinho de Compras -->
    <form action="" method="POST" id="carrinho">
        <div class="container-carrinho">

            <!--Header do carrinho -->
            <div class="header-carrinho">
                <h2>Carrinho de Compras</h2>
            </div>
            <br>
            <!--Fim -->

</table >
		

				<table class="table table-bordered">
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
					
						<form action="/Concessionaria/pedido/remover" method="post" >
						
						<tr>
						<input type="hidden" value="${c.id_item}" name="id_item"/> 
						<td >     <% out.print(i); %>  </td>						
						<td >${c.quantidade}</td>
						<td >${c.veiculo.modeloVeiculo}</td>
						<td >${c.veiculo.valorVeiculo}</td>
						<td >${c.sub_Total}</td>

						<td><input type="submit" class="btn btn-danger" value="remover"/></td>
						</tr>
						
					</form>
									<%i++; %>>
				</c:forEach>
				
					
					<tr>
					<% 
					
					%>
					<form action="/Concessionaria/pedido/comprar" method="post">
					
					<td colspan="6">
					
					<center>
					 <h3 style="color: red;">Valor total R$:${valor}</h3>
					<input type="submit" class="btn btn-primary" value="Finalizar compra"/>
					</form>
					</center>
					</td>
					 </tr>
				
			
				
			</tbody>
			
		</table>
            <!--Fim-->

           
    </form>

    <!--Fim do Carrinho-->



    <script>
        function process(quant) {
            var value = parseInt(document.getElementById("quant").value);
            value += quant;
            if (value < 1) {
                document.getElementById("quant").value = 1;
            } else {
                document.getElementById("quant").value = value;
            }
        }

    </script>

    <!-- ###################### FIM DO CONTEUDO #####################################-->

    <!-- JavaScript (Opcional) -->
    <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
    <!-- ######################FOOTER #####################################-->

    <br><br><br><br><br>

    <!-- Footer -->
    <footer id="rodape" class="page-footer font-small stylish-color-dark pt-4">

        <!-- Footer Links -->
        <div class="container text-center text-md-left">

            <!-- Grid row -->

            <!-- Footer Links -->

            <hr>

            <hr>
            <!-- Social buttons -->
            <ul class="list-unstyled list-inline text-center">
                <li class="list-inline-item">
                    <a class="btn-floating btn-fb mx-1">
                        <i class="fab fa-facebook-f" style="color: white;"> </i>
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="btn-floating btn-tw mx-1">
                        <i class="fab fa-twitter" style="color: white;"> </i>
                    </a>
                </li>
                <li class="list-inline-item">
                    <a class="btn-floating btn-gplus mx-1">
                        <i class="fab fa-google-plus-g" style="color: white;"> </i>
                    </a>
                </li>
            </ul>

            <br><br>
            <!-- Social buttons -->
            <h4 class="text-center alert ">Nossos Parceiros:
            </h4>
            <div class="container text-center">
                <a class="navbar-brand" href="https://www.chevrolet.com/">
                    <img id="logo" src="./imagens/logos/chevrolet.png" alt="">
                </a>

                <a class="navbar-brand"
                    href="https://www.fiat.com.br/?rede=g&campanha=marca&gclid=Cj0KCQjwl8XtBRDAARIsAKfwtxBuz-voj6W2MEXiAgELX1y9_PrgiRvMR2vS5UiuyXQubzDlKG02KsYaAgeTEALw_wcB&gclsrc=aw.ds">
                    <img id="logo" src="./imagens/logos/fiat.png" alt="">
                </a>

                <a class="navbar-brand" href="https://www.ofertasford.com.br/">
                    <img id="logo" src="./imagens/logos/ford.png" alt="">
                </a>

                <a class="navbar-brand" href="https://www.honda.com.br/">
                    <img id="logo" src="./imagens/logos/honda.png" alt="">
                </a>

                <a class="navbar-brand" href="https://www.renault.com.br/">
                    <img id="logo" src="./imagens/logos/renault.png" alt="">
                </a>

                <a class="navbar-brand" href="https://www.vw.com.br/pt.html">
                    <img id="logo" src="./imagens/logos/volks.png" alt="">
                </a>
            </div>

            <!-- Copyright -->
            <div class="footer-copyright text-center py-3">
                <p>Copyright 2019 Senac Motors Company</p>
                <p>Todos os direitos reservados</p>
            </div>
            <!-- Copyright -->

    </footer>
    <!-- Footer -->

</body>

</html>
                        