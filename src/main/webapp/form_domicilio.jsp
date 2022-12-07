<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>

<html lang="en">
    <head>
   		<c:set var="context" value="${pageContext.request.contextPath}" />	
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${context}/styles/style.css">
        <link rel="stylesheet" href="${context}/styles/form.css">
        <link rel="stylesheet" href="${context}/styles/cadastro_usuario.css">
    	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
    	<link rel="icon" href="res/logo_app.png">
        
        <style>
			.erro {
				margin-top: 10px;
				width: 58%;
				height: 50px;
				background-color: #fc2b2b;
				display: flex;
				align-items: center;
				justify-content: center;
				color: white;
			}
			form {
				min-height: 500px;
			}
			#third {
				min-height: 500px;
			}
		</style>
        
        <title>cadastro | EcoHouse</title>
    </head>
    <body>
        <!--<div id="mensagem">mas primeiro, alguns dados seus...</div> -->

        <form action="${context}/home/domicilio/cadastrar" method="POST">
            
            <div id="third" class="section">
                <div class="form-header"> 
                    <a href="${context}/home"><img id="logo" src="${context}/res/logo_app.png" alt=""></a>                   
                    <h2>informações domiciliares</h2>
                </div>
                
                 <div class="erro" style="display: none">
	        		<i style="margin-right: 10px" class="fas fa-exclamation-triangle"></i>  
	            </div>
                
                <div class="fields">
                    <div>
                        <label for="cep">Número do CEP</label>
                        <input type="text" name="cep" placeholder="cep" id="cep" required />
                    </div>
                    <div>
                        <label for="cidade">Cidade</label>
                        <input type="text" id="cidade" name="cidade" placeholder="cidade" required />
                    </div>
                    <div>
                        <label for="bairro">Bairro</label>
                        <input type="text" id="bairro" name="bairro" placeholder="bairro" required />
                    </div>

                    <div>
                        <label for="rua">Rua e Número</label>
                        <div class="linha-rua">
                            <input type="text" name="rua" placeholder="rua" id="rua" required />
                            <input type="text" name="numero" placeholder="nº" id="numero" required />
                        </div>
                    </div>

                </div>
                <div class="button-row">
                    <input type="submit" value="cadastrar"/>
               </div> 
            </div>
   		 </form>

        <script src="${context}/scripts/defs.js"></script>
      	<script src="${context}/scripts/form.js"></script>
        <script src="${context}/scripts/cadastro_domicilio.js"></script>
        <script>
        	const sub = document.querySelector('input[type="submit"]');
        	
        	sub.onclick = async ev => {
        		ev.preventDefault();
	        	const rua = document.querySelector('#rua').value;
	        	const numero = document.querySelector('#numero').value;
	        	const cidade = document.querySelector('#cidade').value;
	        	const bairro = document.querySelector('#bairro').value;


				try {
					const res = await fetch('https://maps.googleapis.com/maps/api/geocode/json?address=' + cidade + ', ' + rua + ' '+ bairro +' ' + numero +'&key=AIzaSyBztUreFEKS1hDJfYxqRr4eh3Te_zEUfmo');
					const data = await res.json(); 
					console.log(data);
					if (data.results.length == 0) {
						const error = document.querySelector('.erro');
						error.style.display = 'flex';
						error.innerHTML += 'Domicílio não encontrado';
						document.querySelector('form').style.borderTopColor = 'red';
						return;
					} 
				sub.parentElement.parentElement.parentElement.submit();
					
				} catch (e) {
					console.log(e);
					
				}
				
        		
        	}
        
        </script>
        
    </body>
</html>