<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp"></c:import>
    <!-- ###################### INICIO DO CONTEUDO #####################################-->

	
    <br>
    <br>
    <br>
    <br>
    
    <div class="container">
      <div class="title">
        <h1 class="titulo">Ficha Técnica</h1>
      </div>
    </div>
   
            <!--compra-->

          <br>

    <div class="container">
    <div class="card-deck">
    <div class="card">
        <h5 class="titulo" id="title">KA</h5>
        <p class="desc">S 1.0 MT</p>
              <img class="card-img-top" src="http://localhost/imagens/carros/ka.png" alt="Imagem de capa do card" style="width: 80%;">
            <div class="descricao">
                <ul>
                    <li class="ano">Ano
                        <h6>2020</h6>
                    </li>
                    <li class="km">Km
                        <h6>0 km</h6>
                    </li>
                    <li class="cor">cor
                        <h6>Cinza</h6>
                    </li>
                    <li class="cambio">Câmbio
                        <h6>Manual</h6>
                    </li>
                    <li class="portas">Portas
                        <h6>5 Portas</h6>
                    </li>
                </ul>
            </div>
            


            <div class="card-body">
                <p class="desc3">* Entrada de R$26.471,27 e saldo em 48x de R$449,00 com Taxa 0,89% a.m</p>
                
            </div>

            <hr>

                <div class="#">
                    <ul>
                    <li class="flex"> 
                        <p class="compra"><img src="http://localhost/imagens/icones/flex.png" style="width: 5%;">  Flex</p>                                    
                    </li>
                    <li class="#">
                        <p class="compra"><img src="http://localhost/imagens/icones/cinto.png" style="width: 5%;">  Airbag Duplo</p>
                    </li>
                    <li class="#">
                        
                    <p class="compra"><img src="http://localhost/imagens/icones/volante.png" style="width: 5%;"> Ar-condicionado, direção e travas elétricas</p>
                    </li>
                    <li class="#">
                            
                        <p class="compra"><img src="http://localhost/imagens/icones/porta.png" style="width: 5%;">  Vidros elétricos dianteiros</p>
                    </li>                         
                    </ul>
                </div>
            </div>
                  
                <div class="card-footer" style="background-color: white;">
                        <hr>
                        <p class="preco">R$ 42.490,00</p>
                        <hr>
                    <div>
                        <h5>
                            Formas de pagamento:
                            <br>
                            <br>
                            <img src="http://localhost/imagens/pagamentos/pagamento-juntos.png" style="width:300px;">
                        </h5>
                        <br>
                        <br>
                                
                    </div>
                    <form action="/Concessionaria/pedido/adicionar" method="post" >
				<input type="hidden"  name="id" value="19"/>
                    <center>
                      <input type="submit" class="btn btn-secondary" onclick="mostraDialogo('Item adicionado no carrinho')"  value="ADICIONAR AO CARRINHO"/>
                    </center>
                   </form>
                </div>
            </div>
          </div>
        </div>


<c:import url="footer.jsp"></c:import>
        