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
        <title>cadastro | EcoHouse</title>
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
			#first {
				min-height: 550px;
			}
			#second {
				min-height: 350px;	
			}
		</style>
        
        
    </head>
    <body>
        <c:if test="${requestScope.errorMessage == null}">
        	<div id="mensagem">mas primeiro, alguns dados seus...</div>
        </c:if>

        <form action="${context}/signin" enctype="multipart/form-data" method="POST" style="border-top-color: ${requestScope.errorMessage == null ? "rgb(20, 251, 20)" : "red"}">
            <div class="section" id="first">
                <div class="form-header"> 
                    <a href="${context}/"><img id="logo" src="${context}/res/logo_app.png" alt=""></a>                   
                    <h2>informações pessoais</h2>
                </div>
                <div class="erro" style="display: ${requestScope.errorMessage == null ? "none" : "flex"}">
	        		<i style="margin-right: 10px" class="fas fa-exclamation-triangle"></i> 
	        		<p class="message">${requestScope.errorMessage}</p>
	            </div>
                
                <div class="fields" style="height: 100%">
                    <div>
                        <label for="email">Endereço de Email:</label>
                        <input type="text" name="email" id="email" placeholder="example@gmail.com" required/>
                    </div>
                    <div>
                        <label for="nome">Nome de Usuário:</label>
                        <input type="text" id="nome" name="nome" placeholder="nome" required />
                    </div>
                    <div>
                        <label for="telefone">Número de Telefone:</label>
                        <input type="text" id="telefone" name="telefone" placeholder="telefone" required />
                    </div>
                    <div>
                        <label for="senha">Senha:</label>
                        <input type="password" name="senha" id="senha" placeholder="senha" required/>
                    </div>

                    <div>
                        <label for="confirmar-senha">Confirmar Senha:</label>
                        <input type="password" id="confirmar-senha" name="confirmar-senha" placeholder="senha" required/>
                    </div>
                </div>
                <div class="button-row">
                    <div class="next"><i class="fas fa-arrow-right"></i></div>
                </div>
            </div>
            <div class="section" id="second" style="display: none;">
                <div class="form-header"> 
                    <a href="${context}/"><img id="logo" src="${context}/res/logo_app.png" alt=""></a>                   
                    <h2>foto de perfil</h2>
                </div>
                <div class="fields">
                    <label class="pp-preview hover" for="foto-perfil"></label>
                    <input type="file" id="foto-perfil" name="foto-perfil" />
                    <p>selecione a imagem</p>
                </div>
                <div class="button-row">
                    <div class="previous"><i class="fas fa-arrow-left"></i></div>
                    <input type="submit" value="cadastrar"/>
                </div>
            </div>
        </form>

        <script src="${context}/scripts/defs.js"></script>
        <script src="${context}/scripts/form.js"></script>
        <script src="${context}/scripts/cadastro_usuario.js"></script>
    </body>
</html>