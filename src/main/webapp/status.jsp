<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>

<html lang="en">
    <head>
  	   	<c:set var="context" value="${pageContext.request.contextPath}" />

        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
        <link rel="stylesheet" href="${context}/styles/style.css" />
        <link rel="stylesheet" href="${context}/styles/status/status.css" />
        
        <link rel="icon" href="res/logo_app.png">
        
        <title>status</title>
        
        <c:choose>
           	<c:when test="${requestScope.isError}">
           		<link rel="stylesheet" href="${context}/styles/status/erro.css" />
           	</c:when>
           	<c:otherwise>
           		<link rel="stylesheet" href="${context}/styles/status/acerto.css" />
           	</c:otherwise>
        </c:choose>
    </head>
    <body>
        <div id="status">
            <c:choose>
            	<c:when test="${requestScope.isError}">
            		<h1><span class="tristinho">:(</span>ERRO</h1>
            		<p>${requestScope.message}</p>
            		<a class="btn-dashed erro" href="${requestScope.where}">ERRO</a>
            	</c:when>
            	<c:otherwise>
            		<h1><span class="sorriso">:)</span>PARABÉNS!</h1>
            		<p>${requestScope.message}</p>
            		<a class="btn-dashed acerto" href="${requestScope.where}">SUCESSO</a>
            	</c:otherwise>
            </c:choose>
        </div>       
    </body>
</html>