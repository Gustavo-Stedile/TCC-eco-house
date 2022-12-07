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
		
		<link rel="icon" href="res/logo_app.png">
		
		
		<c:set var="usuario" value="${requestScope.usuario}"/>
		
		
		<title>home | ${usuario.nome}</title>
		
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
		
		<style>
			main {
				width: 100vw; height: auto;
				display: flex; 
				flex-direction: column;
				align-items: center;
			}
			a {
				color: black;
			}
			a:active {
				color: black;
			}
			a:visited {
				color: black;		
			}
			i {
				cursor: pointer;
			}
			body {
				overflow: scroll;
				overflow-x: hidden;
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
				margin-top: 30px;
				font-size: 70px;
				text-align: center;
				transition: 1s;
				padding: 20px;
			}
			.mais:hover {
				box-shadow: 1px 1px 1px 1px gray;
				
			}
			.mais i:hover {
				transform: rotate(360deg);
				
			}
			nav {
				min-height: 80px;
			}
			.mais span {
				font-size: 22px;
				margin-top: -10px;
				font-weight: bold;
			}	
			#info {
				height: 70vh; width: 100vw;
				display: flex;
				position: relative;
				align-items: center;
				justify-content: space-evenly;
				background-image: url(${context}/res/wave-haikei.svg);
				background-size: cover;
				background-position: center;
				min-height: 650px;
			}
			#dom {
				height: 75%;
				display: flex; align-items: center;
				justify-content: center;
			}
			#dom-info {
				position: relative;
				background-color: rgba(255, 255, 255, .9);
				
				min-width: 400px;
				box-shadow: 1px 1px 2px 2px gray;
				border-radius: 0 0 10px 10px;
				border-top: 10px solid rgb(20, 251, 20);
				transition: 300ms linear;
			}
			#logo-div {
				margin-bottom: 10px;
				font-size: 20px;
				width: 100%;
				display: flex;
				align-items: center;
				justify-content: center;	
			}
			#logo-div img {
				height: 100%; width: auto;
			}
			#dom-info h3 {
				text-align: center;
			}
			.xis {
				position: absolute;
				top: 2%;
				left: 93%;
			}
			.xis button {
				cursor: pointer;
				border: none;
				z-index: -1;
				font-size: 22px;
				transition: 500ms;
				color: black;
				background-color: transparent;
				outline: none;
			}
			.xis button:hover {
				color: red;
			}
			#lixos {
				display: flex;
				flex-direction: column;
				border-top: 10px solid rgb(20, 251, 20);
				border-radius: 0 0 10px 10px;
				height: 90%;
				width: 43% !important;
				min-height: 600px;
			}
			#lixos-lista {
				width: 100%;
				height: 100%; 
				display: flex;
				align-items: center;
				jusfity-content: center;
				flex-direction: column;
			}
			input[type="date"] {
				min-width: 120px;
			}
			#lixos-lista form {
				justify-content: center;
				height: 40px;
				width: 100%;
				max-width: 90%;
				display: flex;					
			}
			#adicionar-form {
				margin-top: 10px;
			
			}
			#lixos-lista form input, option, select {
				font-family: 'Montserrat';
				border-collapse: collapse;
				border-radius: 0;
			}
		
			#lixos {
				width: 30%;
				min-width: 550px;
				background-color: rgba(255, 255, 255, .9);	
				box-shadow: 1px 1px 2px 2px gray;																							
				margin: 10px;
				
			}
			#lixos h3 {
				text-align: center;
				margin: 10px;
				font-size: 22px;
				font-weight: bold;
				margin-bottom: 1px;
			}
			input, select {
				font-weight: bold;
				padding: 5px;
				border: 1.5px solid gray;
				height: 40px;
				outline: none;
			}
			@media only screen and (max-width: 1200px) {
				.left-nav {
					max-width: none !important;
					top: 93%;
					padding: 20px 0;	
					height: 7% !important;
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
			}
			
				
			@media only screen and (max-width: 1000px) {
				#info {
					flex-direction: column-reverse;
					align-items: center;
					justify-content: space-around;
					min-height: 1300px !important;
				}
				#lixos {
					width: 80% !important;
					height: 60vh;
				}
				#dom {
					max-height: 500px;
					min-height: 100px !important;
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
			#procurar-button {
				height: 30px;
				background-image: none;
				font-size: 18px;
				border: none;
				outline: none;
				background-color: white;
				font-weight: 600;
				display: flex;
				align-items: center;
				color: rgb(29, 29, 29);
				justify-content: center;
				transition: 500ms;
				cursor: pointer;
			}
			input[type="submit"] {
				cursor: pointer;
			}
			#procurar-button i {
				width: 25px;
			}
			#procurar-button:hover {
				text-decoration: underline;
				
			}
			#cadastrar-lixo {
				background-color: transparent;	
				border: 2px dashed rgb(20, 251, 20);
				min-width: 80px;
				transition: 200ms;
			}
			#cadastrar-lixo:hover {
				background-color: rgb(20, 251, 20);
				
			}
			tr {
				border-bottom: 1px solid black;
			}
			td {
				text-align: center;
			}
			tbody {
				width: 100%; height: 10px;
			}
			#lixos-lista {
				overflow-y: scroll;
				overflow-x: hidden;
				display: flex;
				align-items: center;
			}
			::-webkit-scrollbar-thumb {
			  background: green;
			}
			.lixeira {
				color: gray;
				background: none;
				border: none;
				outline: none;
				width: 10px;
				cursor: pointer;
			}
			.lixeira:hover {
				color: black;
			}
			#add-lixo {
				margin-top: 20px;
			}
			table {
				margin-top: 20px;
			}
			thead tr {
				margin-top: 20px;
			}
			thead tr th {
				font-size: 17px;
			}
			th, td {
				width: 120px;
				text-align: left;
			}	
			td.td-remover, .th-remover {
				width: 50px;
			}
			.popup {
				position: fixed;
				display: flex;
				align-items: center;
				font-size: 18px;
				flex-direction: column;
				justify-content: space-evenly;
				top: 50%; left: 50%;
				transform: translate(-50%, -50%);
				width: 300px; height: 200px;
				background-color: rgba(255, 255, 255, .95);
				border-top: 10px solid red;
				box-shadow: 3px 3px 3px 1px gray;				
			}
			.popup .confirmar:hover {
				background-color: white;
				color: white;
			}
			.popup .confirmar {
				transition: .2s;
			}
			.popup i {
				font-size: 30px;
			}
			.home {
				font-size: 45px;
			}
			.recusar {
				font-family: 'montserrat';
				width: 80%;
				font-weight: bold;
				height: 40px;
				background-color: red;
				border-radius: 5px;
				border: none;
				font-size: 18px;				
				cursor: pointer;
			}
			.confirmar {
				font-family: 'montserrat';
				font-weight: bold;			
				background-color: white;
				width: 80%;
				height: 40px;
				border: 2px dashed black;
				border-radius: 5px;						
				cursor: pointer;
				font-size: 18px;
					
			}
			.confirmar:hover {
				boder: 2px solid black;
			}
			.exclamation {
				font-size: 30px;
			}
			#sair {
			}		
			.bola {
				width: 8px; height: 8px;
				border-radius: 100%;
			}
			.th-bola, .td-bola {
				width: 2px;
			}
			.alterar-button {
				font-size: 20px;
				position: absolute;
				top: 2%; left: 1.5%;
			}
			.collapsed {
				width: 50%; height: 40%;
			}
			.expanded {
				height: 105%;
			}
			.expanded-info {
				height: 100%;
				display: flex;
				flex-direction: column;
				align-items: center;
				margin-top: 10%;
			}
			.collapsed-info {
				width: 100%; height: 100%;
				display: flex;
				flex-direction: row;				
				align-items: center;
				justify-content: center;
				flex-direction: column;
				
			}
			.dom-input {
				border: 1.5px solid gray;
				border-radius: 5px;
				text-align: center;
				width: 100%;
				font-size: 15px;
				font-family: 'Montserrat';
				outline: none;
			}
			.row {
				width: 80%;
				margin-bottom: 5px;
				display: flex;
				flex-direction: column;
				justify-content: center;
			}
			.row label {
				font-weight: bold;
			}
			.alterar-title {
				margin-bottom: 10px;
				font-size: 25px;
				font-weight: bold;
			}
			#logo-div i {
				font-size: 40px;
			}
			.rua-numero {
				display: flex;
			}
			#rua {
				width: 80%;
			}
			#numero {
				width: 20%;
			}
			#alterar-form {
				width: 100%;
				height: 60%;
				display: flex;
				flex-direction: column;
				align-items: center;
				justify-content: space-evenly;
			}
			#alterar-sub {
				width: 100%;
				background: none;
				background-color: transparent;
				border-radius: 2px;
				border: 2px dashed black;
				font-weight: bold;
				font-family: "Montserrat";
				font-size: 18px;
				transition: 300ms;
			}
			#alterar-sub:hover {
				background-color: black;
				color: white;
			}
			.input-row {
				width: 80%;
				display: flex;
				margin-top: 10px;
			}
			#undo {
				width: 20%;
				background-color: transparent;
				border: none;
				font-size: 25px;
				cursor: pointer;
			}
			.erro {
				margin-top: -10px;
				margin-bottom: 5px;
				width: 80%;
				height: 30px;
				background-color: #fc2b2b;
				display: flex;
				align-items: center;
				justify-content: center;
				color: white;
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
				box-shadow: .5px 0px 1px 0px gray;	
				flex-direction: column;
			}
			.left-nav i, .list i {
				display: block;
				font-size: 30px;
				transition: .2s;
			}
			.list i:hover {
				color: rgb(20, 251, 20);
			}
			
			#map-div {
				position: relative;
				display: flex;
				align-items: center;
				justify-content: space-around;
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
				display: none;
				align-items: center;			
				z-index: -100 !important;
				justify-content: space-around;
			}
			.remover-dom {
				margin-right: 10px !important;
				font-size: 20px !important;
			}
			#dicas {
				position: relative;
				margin-top: 30px;		
				width: 80%; height: 10%;
				background-color: #f0f0f0;
				border-radius: 10px;
				box-shadow: 1px 1px 1px 1px #e6e6e6;
				display: flex;
				align-items: center;
				min-height: 100px;
			}
		
			#dicas i {
				padding: 15px;
				font-size: 25px;
				color: black;
			}
			#dicas p {
				font-weight: bold;
			}
			body {
				overflow-x: hidden !important;
			}
			#qtd {
				min-width: 50px !important;
			}
			td {
				line-height: 50px !important;
			}
			tbody tr {
				margin-top: 10px;
				border-radius: 10px;
				box-shadow: 1px 1px 1px 1px #e6e6e6;
			}
			
			td {
				padding: 10px 0;
				line-height: 20px !important; 
			}
			.add-info {
				font-weight: bolder;
				font-size: 25px;
				text-align: center;
				margin-top: 100px !important;
				box-shadow: 1px 1px 1px 1px #e6e6e6;
				height: 200px !important;
				display: block;
				display: flex;
				align-items: center;
				jusitify-content: center;
				border-radius: 10px;
				padding: 20px;
			}
			a:visited {
				color: black;
			}
		</style>
	</head>

	<body style="${usuario.domicilio == null ? "overflow: hidden" : "overflow: scroll"}">		
		<nav>
           <a id="sair" href="${context}/home/sair"><i style="font-size: 30px;" class="fas fa-sign-out-alt"></i></a>
        </nav>
		
		<div id="wrapper">		
			<div id="user-info">
				<c:if test="${usuario.image == null}">
					<img class="pp" src="${context}/res/default-user-image.png" />
				</c:if>
				<c:if test="${usuario.image != null}">
					<img class="pp" src="${usuario.image}" />
				</c:if>
				<div class="user-data">
					<h2>${usuario.nome}</h2>
					<h3>${usuario.email}</h3>
				</div>
			</div>
			
			<c:choose>
				<c:when test="${usuario.domicilio == null}">
					<main style="height: 50%; min-heigth: none; position: relative;">
						<a class="mais" href="${context}/home/domicilio/cadastrar"><i class="fas fa-plus"></i><br/><span>adicionar domicílio</span></a>
						<div class="left-nav">
							<a><i class="fas fa-user"></i></a>
							<a href="${context}/home/domicilio/cadastrar"><i class="fas fa-house-user"></i></a>
						</div>
					</main>
				</c:when>
				<c:otherwise>
					<main>
						<div id="info">		
							<div class="left-nav">
								<a href="${context}/home/settings"><i class="fas fa-user"></i></a>
								<div id="map-div">
									<i class="fas fa-map-marker-alt"></i>								
								
									<div class="list">
										<i id="BICYCLING" class="fas fa-bicycle procurar-button"></i>
										<i id="DRIVING" class="fas fa-car procurar-button"></i>
										<i id="WALKING" class="fas fa-walking procurar-button"></i>
									</div>
								</div>
							</div>
							<div id="dom">
								<div id="dom-info" class="collapsed">
									<i class="fas fa-cog alterar-button"></i>
									<form action="${context}/home/domicilio/remover" method="POST" class="xis">
										<button class='remover-dom' type="submit"><i class="fas fa-house-damage"></i></button>
									</form>
									
									<div class="collapsed-info">
										<div id="logo-div"><i class="fas fa-home home"></i></div>
										<h3>${usuario.domicilio.rua}</h3>
									</div>
									
									<div class="expanded-info" style="display: none">
										<div id="logo-div"><i class="fas fa-home home"></i></div>
										<h3 class="alterar-title">Alterar Domicílio</h3>
										
										<div class="erro" style="display: none">
							        		<i style="margin-right: 10px" class="fas fa-exclamation-triangle"></i> 
							        		<p id="message">domicílio inválido</p> 
	            						</div>
										
										<form id="alterar-form" action="${context}/home/domicilio/alterar" method="POST">
											<div class="row">
												<label for="cep">Número do CEP</label>
												<input class="dom-input" id="cep" name="cep" type="text" value="${usuario.domicilio.cep}">
											</div>
											<div class="row">
												<label for="cidade">Cidade</label>
												<input class="dom-input" id="cidade" name="cidade" type="text" value="${usuario.domicilio.cidade}">
											</div>
											<div class="row">
												<label>Bairro</label>
												<input class="dom-input" id="bairro" name="bairro" type="text" value="${usuario.domicilio.bairro}">									
											</div>
											<div class="row">
												<label for="rua">Rua e Número</label>
												
												<div class="rua-numero">
													<input class="dom-input" type="text" id="rua" name="rua" value="${usuario.domicilio.rua }" />
													<input class="dom-input" type="text" id="numero" name="numero" value="${usuario.domicilio.numero}">									
												</div>
											</div>
											
											<div class="input-row">
												<input id="alterar-sub" type="submit" value="alterar"/>
											</div>
										</form>
									</div>
									
								</div>
							</div>
							<div id="lixos">
								<h3>LIXOS</h3>
								<div id="lixos-lista">
									<form id="adicionar-form" action="${context}/home/rejeitos/adicionar">
										<input type="text" placeholder="nome" id="nome" name="nome" required />
										<input type="number" placeholder="qtd" min="1" id="qtd" name="qtd" required />
										
										<select id="tipo" name="tipo" required>
											<option>papel</option>
											<option>metal</option>
											<option>plástico</option>
											<option>orgânico</option>	
											<option>vidro</option>											
																					
										</select>
										<input type="date" id="data-producao" name="data-producao" required />
										<input type="submit" id="cadastrar-lixo" value="cadastrar" required />
									</form>
									<table>
										<thead>
											<tr>
												<th class="th-remover"></th>
												<th class="data-td">data</th>
												<th class="nome-td">nome</th>
												<th class="qtd-td">qtd</th>												
												<th>tipo</th>
												<th class="th-bola"></th>
											</tr>
										</thead>
									
									
										<tbody>
											<c:forEach var="lixo" items="${usuario.domicilio.lixos}">
												<tr>
													<td class="td-remover">
														<form class="remover-form" action="${context}/home/rejeitos/remover" method="POST">
															<input type="hidden" name="id" value="${lixo.id}" />
															<button class="lixeira" type="submit">
																<i class="fas fa-trash"></i>
															</button>	
														</form>		
													</td>
													
													<fmt:parseDate value="${lixo.dataCadastro}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
													<fmt:formatDate value="${parsedDate}" var="formatedDate" type="date" pattern="dd/MM" />
													
													<c:if test="${lixo.dias <= 2}">
														<td title="ok!" class="data-td"><span style="border-bottom: 3px dashed green">${formatedDate}</span></td>
													</c:if>
													<c:if test="${lixo.dias > 2 && lixo.dias <= 6}">
														<td title="cuidado!" class="data-td"><span style="border-bottom: 3px dashed orange">${formatedDate}</span></td>
													</c:if>
													<c:if test="${lixo.dias > 6}">
														<td title="descarte já!" class="data-td"><span style="border-bottom: 3px dashed red; width: auto">${formatedDate}</span></td>
													</c:if>
													
													<td id="nome">${lixo.nome}</td>
													<td class="qtd-td" style="width: 80px">${lixo.qtd}</td>
													
													<c:if test="${lixo.tipo.equals('papel')}">
														<td><span style="border-bottom: 3px solid #5193fc">${lixo.tipo}</span></td>
													</c:if>
													<c:if test="${lixo.tipo.equals('metal')}">
														<td><span style="border-bottom: 3px solid orange">${lixo.tipo}</span></td>
													</c:if>
													<c:if test="${lixo.tipo.equals('orgânico')}">
														<td><span style="border-bottom: 3px solid #613e3e">${lixo.tipo}</span></td>
													</c:if>
													<c:if test="${lixo.tipo.equals('plástico')}">
														<td><span style="border-bottom: 3px solid red">${lixo.tipo}</span></td>
													</c:if>
													<c:if test="${lixo.tipo.equals('vidro')}">
														<td><span style="border-bottom: 3px solid green">${lixo.tipo}</span></td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
										
									</table>
									<div id="dicas">
										<i class="fas fa-exclamation-circle"></i> 
										<c:if test="${usuario.domicilio.lixos.isEmpty()}">
											<p>adicione um lixo acima!</p>
										</c:if>
										<c:if test="${!usuario.domicilio.lixos.isEmpty()}">
											<p id="dica">dica</p>
										</c:if>
										
									</div>
								</div>
							</div>
						</div>
						
						<div id="map"></div>
					</main>
				</c:otherwise>
			</c:choose>
		</div>

		<script src="https://maps.googleapis.com/maps/api/js?key=API_KEY&callback=initMap&v=weekly"defer></script>			
		<script>		
			const dicas = ['Separe seu lixo por categoria: metal, plástico, papel e lixo orgânico', 'Para o descarte correto do óleo de cozinha coloque-o em uma garrafa PET e leve a um Ponto de Entrega Voluntária (PEV).', 'Utilize sacolas biodegradável para o descarte dos lixos.', 'Se possível, reutilize as embalagens de vidro.', 'Busque locais especializados para o descarte de lixo eletrônico.']
			const dicaAleatoria = dicas[Math.floor(Math.random() * dicas.length)];
			
			const fetchCEP = async cep => {
			    const res = await fetch('https://viacep.com.br/ws/'+cep+'/json/')
			    const data = await res.text();
			    return JSON.parse(data);
			}

			const cepButton = document.querySelector('#cep');
			cepButton.onblur = async () => {
			    const data = await fetchCEP(cepButton.value);
			    document.querySelector('input[name="cidade"]').value = data.localidade;      
			    document.querySelector('input[name="bairro"]').value = data.bairro;  
			    document.querySelector('input[name="rua"]').value = data.logradouro;                
			}
			
			const dicaElement = document.querySelector('#dica');
			if (dicaElement) dicaElement.textContent = dicaAleatoria;
		
			const domInfo = document.querySelector('#dom-info');
			const alterar = document.querySelector('.alterar-button');
			
			const qtd = document.querySelector('#qtd');
			qtd.onkeyup = ev => {
				if (parseInt(qtd.value) < 1) qtd.value = '';
				
			}
			
			HTMLElement.prototype.setVisible = function(bool) {
				this.style.display = bool ? 'flex' : 'none';
				return true;	
			}
			
			let cep, cidade, bairro, rua, numero;
			
			alterar.onclick = ev => {
				document.querySelector('#dom-info').style.borderTopColor = 'rgb(20, 251, 20)';
				document.querySelector('.erro').style.display = 'none';
				
				const collapsedInfo = document.querySelector('.collapsed-info')
				const expandedInfo = document.querySelector('.expanded-info')
				alterar.classList.replace('fa-cog', 'fa-window-minimize') && 
					(domInfo.classList.replace('collapsed', 'expanded') && collapsedInfo.setVisible(false)
					&& expandedInfo.setVisible(true))
					
				|| alterar.classList.replace('fa-window-minimize', 'fa-cog') && 
					(domInfo.classList.replace('expanded', 'collapsed') && collapsedInfo.setVisible(true) 
					&& expandedInfo.setVisible(false));	
				
				if (alterar.classList.contains('fa-cog')) {
					document.querySelector('#cep').value = cep;
					document.querySelector('#cidade').value = cidade;
					document.querySelector('#bairro').value = bairro;
					document.querySelector('#rua').value = rua;
					document.querySelector('#numero').value = numero;

					return;
				}
				
				cep = document.querySelector('#cep').value;
				cidade = document.querySelector('#cidade').value;
				bairro = document.querySelector('#bairro').value;
				rua = document.querySelector('#rua').value;
				numero = document.querySelector('#numero').value;

				
				
				
				
			}
			
		
			const lixeiras = Array.from(document.querySelectorAll('.lixeira'));
			lixeiras.push(document.querySelector('.remover-dom'));
			
			const createPopup = (element, message, color, font, action) => {
				if (document.querySelector('.popup') != null) document.querySelector('.popup').remove();
				
				const popup = document.createElement('div');
				popup.className = 'popup';
				popup.style.borderTopColor = color;
				document.body.appendChild(popup);
				
				popup.innerHTML += '<i class="fas fa-question"></i>';
				popup.innerHTML += '<h3>'+message+'</h3>';
				
				popup.querySelector('i').style.color = color;
				
				const aceitar = document.createElement('button');
				aceitar.textContent = "confirmar";
				aceitar.onclick = action;
				aceitar.className = 'confirmar'
				aceitar.style.borderColor = color;
				aceitar.onmouseover = ev => aceitar.style.backgroundColor = color;
				aceitar.onmouseleave = ev => aceitar.style.backgroundColor = 'transparent';
				
				const recusar = document.createElement('button');
				recusar.textContent = "recusar";
				recusar.className = 'recusar';
				recusar.style.backgroundColor = color;
				
				recusar.style.color = font;
				
				popup.appendChild(aceitar);
				popup.appendChild(recusar);
				
				document.body.onclick = ev => {
					if (element.contains(ev.target) || popup.contains(ev.target)) return;
					popup.remove();
				}
				recusar.onclick = ev => popup.remove();
				
			}
			
			const alterarSub = document.querySelector('#alterar-sub');
			alterarSub.onclick = async ev => {
				ev.preventDefault();
				
				const rua = document.querySelector('#rua').value;
	        	const numero = document.querySelector('#numero').value;
	        	const bairro = document.querySelector('#bairro').value;
	        	const cidade = document.querySelector('#cidade').value;

				
	        	const res = await fetch('https://maps.googleapis.com/maps/api/geocode/json?address=' + cidade + ', ' + bairro + ' ' + rua + ' ' + numero +'&key=API_KEY');
				const data = await res.json();
				
				if (data.results.length == 0) {
					const error = document.querySelector('.erro');
					error.style.display = 'flex';
					document.querySelector('#message').textContent = "domicílio não encontrado";
					document.querySelector('#dom-info').style.borderTopColor = 'red';
					return;
				}
			
				
				createPopup(alterarSub, 'deseja realmente alterar?', 'black', 'white', ev => alterarSub.parentElement.parentElement.submit())
				
			}
			
			lixeiras.forEach(lixeira => {
				lixeira.onclick = ev => {
					ev.preventDefault()
					createPopup(lixeira, 'deseja realmente remover?', '#fc2b2b', 'white', ev => lixeira.parentElement.submit())
				}
			});
			
			async function getCoordinates(adress) {
				const res = await fetch('https://maps.googleapis.com/maps/api/geocode/json?address='+adress+'&key=API_KEY');
				const obj = await res.json();				
				return obj.results[0].geometry.location;
			}
		
			const encontrarEcoponto = document.querySelectorAll('.procurar-button');
			
			async function getEcopontos() {
				const res = await fetch(document.URL + '/../ecopontos');
				return await res.json();
			}
			
			async function getUserDom() {
				const res = await fetch(document.URL + '/domicilio');
				return await res.json();
			}

			async function initMap() {
				console.log(await getEcopontos())
				
				const dom = await getUserDom();
				const coord = await getCoordinates(dom.cidade+'+'+dom.rua+'+'+dom.numero);
				
				const map = new google.maps.Map(
					document.getElementById('map'),
					{
						zoom: 18,
						center: coord
					}
				);
				const marker = new google.maps.Marker({
					position: coord,
					map: map
				});

				const directionsService = new google.maps.DirectionsService;
				const directionsRenderer = new google.maps.DirectionsRenderer({
					map: map
				})

				encontrarEcoponto.forEach(encontrar => encontrar.onclick = async ev => {
					const ecopontos = await getEcopontos();
					console.log(ecopontos);
					const ecopontosCoordinates = [];
					for (const ecoponto of ecopontos) {
						const coordinate = await getCoordinates(ecoponto.rua + ", " + ecoponto.numero);

						ecopontosCoordinates.push({coord: coordinate, distance: google.maps.geometry.spherical.computeDistanceBetween(coord, coordinate)});
					}

					ecopontosCoordinates.forEach(val => console.log(val));
					let closest = {coord: undefined, distance: 100000000000000000000000};
					ecopontosCoordinates.forEach(val => {
						if (val.distance < closest.distance) closest = val;
					});
					console.log(closest);
					window.scrollBy(0, 2000);

					directionsService.route({
						origin: coord,
						destination: closest.coord,
						travelMode: google.maps.TravelMode[encontrar.id]
					}, (res, stt) => {
						if (stt === google.maps.DirectionsStatus.OK) {
							directionsRenderer.setDirections(res);
						}
					})
				})
			}
			window.initMap = initMap;
		</script>
	</body>
</html>
