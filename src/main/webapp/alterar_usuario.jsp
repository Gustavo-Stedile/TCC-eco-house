<%@page import="jakarta.servlet.http.HttpSession"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>
	<head>
   		<c:set var="context" value="${pageContext.request.contextPath}" />	
		<link rel="stylesheet" href="${context}/styles/style.css" />
		<link rel="stylesheet" href="${context}/styles/home.css" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
		
		<style>
			a:visited {
				color: black;
			}
			main {
				
				width: 100vw; height: auto;
				display: flex; 
				flex-direction: column;
				align-items: center;
			}
			body {
				overflow: hidden;
				box-sizing: border-box;
			}
			#map {
				width:100%; height: 80vh;
			}
			#user-info {
				min-height: 250px;
				max-height: 250px;				
			}
			.mais {
				text-align: center;
			}
			nav {
				min-height: 80px;
			}
			.mais span {
				font-size: 18px;
				margin-top: -10px;
			}	
			#info {
				height: 70vh; width: 100vw;
				display: flex;
				position: relative;
				align-items: center;
				justify-content: space-evenly;
				background-size: cover;
				background-position: center;
			}
			
			@media only screen and (max-width: 1000px) {
				#info {
					flex-direction: column-reverse;
					align-items: center;
					justify-content: space-around;
					height: 130vh;
				}
				#lixos {
					width: 60%;
					height: 50vh;
				}
				#dom {
					height: 53vh;
				}			
				.left-nav {
					
					max-width: none !important;
					top: 94%;
					height: 6% !important;
					position: fixed !important;
					align-items: center;
					flex-direction: row !important;
					min-width: 100vw !important;
					justify-content: space-around !important;
					z-index: 10;
					background-color: white;
				}
				#map-div {
					align-items: center;
				}
				.list {
					bottom: 100% !important;
					align-items: center;
					left: 0 !important;
					height: 250px !important;
					width: auto !important;
					width: 70px;
					flex-direction: column-reverse;
				}
				#lixos-lista form {
					align-items: center;
					justify-content: center;
					height: 40px;
				}
				#lixos-lista {
					width: 100%;
					height: 100%;
				}
			}
			#nome {
				border-radius: none;
			}
				.left-nav {
				background-color: white;
				z-index: 3;
				display: flex;
				position: absolute;
				left: 0;
				background-color: white;
				justify-content: space-around;
				flex-wrap: nowrap;	
				align-items: center;
				width: 70px !important;
				height: 100%;
				box-shadow: 1px 0px 2px 0px gray;	
				flex-direction: column;
			}
			.left-nav i, .list i {
				font-size: 30px
			}
			
			#map-div {
				position: relative;
				display: flex;
				align-items: center;
				justify-content: center;
				z-index: 1;
			}
			#map-div:hover .list {
				display: flex;
			}
			.list {
				position: absolute;
				display: flex;
				width: 250px;
				height: 50px;	
				left: 100%;
				background-color: white;
				margin-left: none;
				box-shadow: .5px .5px 1px 1px gray;
				z-index: -100;
				display: none;
				align-items: center;			
				justify-content: space-around;
			}
			
			
		</style>
	</head>

	<body>
		<c:set var="usuario" value="${requestScope.usuario}"/>
		
		<nav>
           <a id="sair" href="${context}/home/sair"><i style="font-size: 30px;" class="fas fa-sign-out-alt"></i></a>
        </nav>
		
		<div id="wrapper">		
			<div id="user-info">
				<img class="pp" src="${usuario.image}" />
				<div class="user-data">
					<h2>${usuario.nome}</h2>
					<h3>${usuario.email}</h3>
				</div>
			</div>
			
			
			<main>
				<div id="info">		
					<div class="left-nav">
						<a style="font-size: 33px;"><i class="fas fa-user"></i></a>
						<a href="${context}/home"><i class="fas fa-angle-double-left"></i></a>
					</div>
				</div>
			
				<div>
					 
				</div>
			</main>
		</div>
	</body>
</html>