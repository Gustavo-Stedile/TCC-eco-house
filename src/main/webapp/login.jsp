<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>

<html lang="pt-br">
    <head>
    	<c:set var="context" value="${pageContext.request.contextPath}" />
    	
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${context}/styles/style.css">
        <link rel="stylesheet" href="${context}/styles/form.css">
        <link rel="stylesheet" href="${context}/styles/login.css">
        
        <link rel="icon" href="res/logo_app.png">
        
        
   		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
        

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
				padding: 50px !important;
				height: 80;
				min-height: 500px;
				justify-content: space-between;
			}
		</style>

        <title>login | EcoHouse</title>
    </head>
    <body>
       <form action="${context}/login" style="border-top-color: ${requestScope.errorMessage != null ? "red" : "rgb(20, 251, 20)"}" method="POST">
            <div id="form-head">
                <a href="${context}/"><img id="logo" src="${context}/res/logo_app.png" /></a>
                <h1>login</h1>
            </div>
            
	        <c:if test="${requestScope.errorMessage != null}">
	            <div class="erro">
	        		<i style="margin-right: 10px" class="fas fa-exclamation-triangle"></i> 
	        		${requestScope.errorMessage}    
	            </div>
	        </c:if>
            
            <div class="fields">
                <div> 
                    <label for="email">Endereço de Email:</label>   
                    <input placeholder="email" id="email" name="email" type="text" />
                </div>
                <div>
                    <label for="senha">Senha:</label>
                    <input placeholder="senha" name="senha" type="password" />
                </div>
                <input type="submit" value="entrar" />
            </div>
            <p id="cadastre-se">não possui conta?<br/><b><a href="${context}/signin">cadastre-se!</a></b></p>
        </form>
    </body>
</html>