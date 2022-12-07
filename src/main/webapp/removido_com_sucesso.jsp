<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>

<html>
    <head>
  	   	<c:set var="context" value="${pageContext.request.contextPath}" />

        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    		
  	    <link rel="icon" href="res/logo_app.png">
    	
        <link rel="stylesheet" href="${context}/styles/style.css" />
        <link rel="stylesheet" href="${context}/styles/status/status.css" />
        <link rel="stylesheet" href="${context}/styles/status/erro.css" />
        
     	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
        
        <title>status</title>
    </head>
    <body>
        <div id="status">
            
       		<h1><span class="tristinho"><i class="fas fa-times-circle"></i></span></span>REMOVIDO</h1>
       		<p>${requestScope.message}</p>
       		<a class="btn-dashed erro" href="${requestScope.where}">VOLTAR</a>
        </div>       
    </body>
</html>